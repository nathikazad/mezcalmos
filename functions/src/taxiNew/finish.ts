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
export interface TaxiFinishParams {
    orderId: number;

}

export interface TaxiFinishResponse {
    success: boolean;
    error?: TaxiFinishResponseError;
    unhandledError?: string;
}

enum TaxiFinishResponseError {
    UnhandledError = "unhandledError",
    OrderNotAvailable = "orderNotAvailable"
}

export async function finishTaxi(driverId: number, taxiFinishParams: TaxiFinishParams): Promise<TaxiFinishResponse> {
    const hasura = getHasura();

    const taxiFinishHsResp =  await hasura.mutation({
        update_taxi_order_many: [{
            updates: [{
                where: {
                    _and: [{
                        id:{ 
                            _eq: taxiFinishParams.orderId
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
                    status: "finished"
                }
            }]
        }, {
            affected_rows: true
        }]
    })


    try {
        if(taxiFinishHsResp.update_taxi_order_many?.length == 0){
            return {
                success: false,
                error: TaxiFinishResponseError.OrderNotAvailable,
            }
        }
        return {
            success: true,
        };
    } catch (error: any) {
        console.error('Error sending email:', error);
        return {
            success: false,
            error: TaxiFinishResponseError.UnhandledError,
            unhandledError: error.message
        };
    }


}
