import { getHasura } from "../../../utilities/hasura";
import { ServiceProviderType } from "../../models/Services/Service";

export async function updateStoreCredit(
    serviceProviderId: number, 
    serviceProviderType: ServiceProviderType,
    customerId: number,
    credit: number,
) {
    let chain = getHasura();

    let response = await chain.query({
        service_provider_store_credit_by_pk: [{
            customer_id: customerId,
            service_provider_id: serviceProviderId,
            service_provider_type: serviceProviderType,
        }, {
            credit: true
        }]
    });
    if(response.service_provider_store_credit_by_pk) {
        credit += response.service_provider_store_credit_by_pk.credit;
        await chain.mutation({
            update_service_provider_store_credit_by_pk: [{
                pk_columns: {
                    customer_id: customerId,
                    service_provider_id: serviceProviderId,
                    service_provider_type: serviceProviderType,
                },
                _set: {
                    credit: credit
                }
            }, {
                credit: true
            }]
        });
    } else {
        await chain.mutation({
            insert_service_provider_store_credit_one: [{
                object: {
                    customer_id: customerId,
                    service_provider_id: serviceProviderId,
                    service_provider_type: serviceProviderType,
                    credit: credit
                }
            }, {
                credit: true
            }]
        });
    }
}