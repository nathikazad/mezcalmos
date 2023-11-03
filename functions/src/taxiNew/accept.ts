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
export interface TaxiAcceptParams {
    orderId: number;

}

export interface TaxiAcceptResponse {
    success: boolean;
    error?: TaxiAcceptResponseError;
    unhandledError?: string;
}

enum TaxiAcceptResponseError {
    UnhandledError = "unhandledError",
    OrderNotAvailable = "orderNotAvailable"
}

export async function acceptTaxi(driverId: number, taxiAcceptParams: TaxiAcceptParams): Promise<TaxiAcceptResponse> {
    const hasura = getHasura();

    const taxiAcceptHsResp =  await hasura.mutation({
        update_taxi_order_many: [{
            updates: [{
                where: {
                    _and: [{
                        id:{ 
                            _eq: taxiAcceptParams.orderId
                        }
                    }, {
                        driver_id: {
                            _is_null: true
                        }
                    }, {
                        status: {
                            _eq: "open"
                        }
                    }]

                },
                _set: {
                    driver_id: driverId,
                    status: "inProcess"
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
                error: TaxiAcceptResponseError.OrderNotAvailable,
            }
        }
        return {
            success: true,
        };
    } catch (error: any) {
        console.error('Error sending email:', error);
        return {
            success: false,
            error: TaxiAcceptResponseError.UnhandledError,
            unhandledError: error.message
        };
    }


}
