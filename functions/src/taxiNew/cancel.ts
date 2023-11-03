import * as functions from 'firebase-functions';
import { CustomerAppType } from '../shared/models/Generic/Generic';
import { getHasura } from "../utilities/hasura"
import { $ } from '../../../hasura/library/src/generated/graphql-zeus';
import { sendEmail } from '../utilities/senders/email';





export interface Location {
    lat: number,
    lng: number,
    address: string;
}
export interface cancelTaxiParams {
    orderId: number;

}

export interface cancelTaxiResponse {
    success: boolean;
    error?: cancelTaxiResponseError;
    unhandledError?: string;
}

enum cancelTaxiResponseError {
    UnhandledError = "unhandledError",
    OrderNotAvailable = "orderNotAvailable"
}

export async function cancelTaxi(driverId: number, taxiCanceltParams: cancelTaxiParams): Promise<cancelTaxiResponse> {
    const hasura = getHasura();

    const taxiCancelHsResp =  await hasura.mutation({
        update_taxi_order_many: [{
            updates: [{
                where: {
                    _and: [{
                        id:{ 
                            _eq: taxiCanceltParams.orderId
                        }
                    }, {
                        driver_id: {
                            _eq: driverId
                        }
                    }, {
                            status: {
                                _eq: "inProcess"
                            }
                    }, {
                        status: {
                            _eq: "open"
                        }
                    }
                    ]

                },
                _set: {
                    status: "cancelled"
                }
            }]
        }, {
            affected_rows: true
        }]
    })


    try {
        if(taxiCancelHsResp.update_taxi_order_many?.length == 0){
            return {
                success: false,
                error: cancelTaxiResponseError.OrderNotAvailable,
            }
        }
        return {
            success: true,
        };
    } catch (error: any) {
        console.error('Error sending email:', error);
        return {
            success: false,
            error: cancelTaxiResponseError.UnhandledError,
            unhandledError: error.message
        };
    }


}
