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
export interface DriverRemoveParams {
    orderId: number;

}

export interface DriverRemoveResponse {
    success: boolean;
    error?: DriverRemoveResponseError;
    unhandledError?: string;
}

enum DriverRemoveResponseError {
    UnhandledError = "unhandledError",
    OrderNotAvailable = "orderNotAvailable"
}

export async function removeTaxiDriver(driverId: number, taxiRemoveParams: DriverRemoveParams): Promise<DriverRemoveResponse> {
    const hasura = getHasura();

    const taxiAcceptHsResp =  await hasura.mutation({
        update_taxi_order_many: [{
            updates: [{
                where: {
                    _and: [{
                        id:{ 
                            _eq: taxiRemoveParams.orderId
                        }
                    }, {
                        driver_id: {
                            _eq: driverId
                        }
                    }, {
                            status: {
                                _eq: "inProcess"
                            }
                        }
                    ]

                },
                _set: {
                    driver_id: undefined,
                    status: "open"
                }
            }]
        }, {
            affected_rows: true
        }]
    })


    try {
        if(taxiAcceptHsResp.update_taxi_order_many?.length == 0){
            return {
                success: false,
                error: DriverRemoveResponseError.OrderNotAvailable,
            }
        }
        return {
            success: true,
        };
    } catch (error: any) {
        console.error('Error sending email:', error);
        return {
            success: false,
            error: DriverRemoveResponseError.UnhandledError,
            unhandledError: error.message
        };
    }


}
