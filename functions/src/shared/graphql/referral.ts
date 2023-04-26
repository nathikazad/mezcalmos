import { service_provider_referral_constraint } from "../../../../hasura/library/src/generated/graphql-zeus";
import { AddReferralError } from "../../serviceProvider/addReferral";
import { getHasura } from "../../utilities/hasura";
import { MezError } from "../models/Generic/Generic";
import { ServiceProviderType } from "../models/Services/Service";


export async function addReferral(customerId: number, uniqueId: string,) {
    let chain = getHasura();

    let response = await chain.query({
        service_provider_details: [{
            where: {
                unique_id: {
                    _eq: uniqueId
                }
            }
        }, {
            service_provider_type: true,
            restaurant: {
                id: true
            },
            laundry_store: {
                id: true
            },
            delivery_company: {
                id: true
            },
            business: {
                id: true
            }
        }],
        service_provider_referral_by_pk: [{
            customer_id: customerId
        }, {
            customer_id: true
        }]
    });
    if (response.service_provider_details.length == 0) {
        throw new MezError(AddReferralError.IncorrectUniqueId);
    }
    if (response.service_provider_referral_by_pk != null) {
        throw new MezError(AddReferralError.AlreadyReferred);
    }
    let serviceProviderType: ServiceProviderType = response.service_provider_details[0].service_provider_type as ServiceProviderType;
    let serviceProviderId: number;
    switch (serviceProviderType) {
        case ServiceProviderType.Restaurant:
            serviceProviderId = response.service_provider_details[0].restaurant!.id;
            break;
        case ServiceProviderType.Laundry:
            serviceProviderId = response.service_provider_details[0].laundry_store!.id;
            break;
        case ServiceProviderType.DeliveryCompany:
            serviceProviderId = response.service_provider_details[0].delivery_company!.id;
            break;
        case ServiceProviderType.Business:
            serviceProviderId = response.service_provider_details[0].business!.id;
            break;
        default:
            throw new MezError(AddReferralError.InvalidServiceProviderType);
    }
    
    await chain.mutation({
        insert_service_provider_referral_one: [{
            object: {
                customer_id: customerId,
                service_provider_id: serviceProviderId,
                service_provider_type: serviceProviderType
            },
            on_conflict: {
                constraint: service_provider_referral_constraint.referral_pkey,
                update_columns: []
            }
        }, {
            customer_id: true,
        }],
        update_service_provider_details: [{
            where: {
                unique_id: {
                    _eq: uniqueId
                }
            },
            _inc: {
                referral_points: 1
            }
        }, {
            affected_rows: true
        }]
    });
}