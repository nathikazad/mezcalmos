import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../utilities/hasura";
import { ServiceProvider } from "../models/Services/Service";

export async function createServiceProviderStripe(serviceProvider: ServiceProvider) {
    let chain = getHasura();

    if(serviceProvider.stripeInfo == null) {
        throw new HttpsError(
            "internal",
            "service provider stripe info not provided"
        );
    }

    let stripeResponse = await chain.mutation({
        insert_service_provider_stripe_info_one: [{
            object: {
                charge_fees_on_customer: serviceProvider.stripeInfo.chargeFeesOnCustomer ?? undefined,
                charges_enabled: serviceProvider.stripeInfo.chargesEnabled,
                details_submitted: serviceProvider.stripeInfo.detailsSubmitted,
                email: serviceProvider.stripeInfo.email ?? undefined,
                payouts_enabled: serviceProvider.stripeInfo.payoutsEnabled,
                requirements: JSON.stringify(serviceProvider.stripeInfo.requirements),
                stripe_id: serviceProvider.stripeInfo.id,
                status: serviceProvider.stripeInfo.status,
            },
            // on_conflict: {
            //     constraint: service_provider_stripe_info_constraint.stripe_info_stripe_id_key,
            //     update_columns: [service_provider_stripe_info_update_column.]
            // }
        }, {
            id: true,
        }]
    })
    if(!(stripeResponse.insert_service_provider_stripe_info_one)) {
        throw new HttpsError(
          "internal",
          "service provider stripe update error"
        );
    }
    // let mutationResponse = 
    chain.mutation({
        update_service_provider_details_by_pk: [{
            pk_columns: {
                id: serviceProvider.serviceProviderDetailsId!
            },
            _set: {
                stripe_id: stripeResponse.insert_service_provider_stripe_info_one.id,
            }
        }, {
            id: true
        }]
    });
}

export async function updateServiceProviderStripe(serviceProvider: ServiceProvider) {
    let chain = getHasura();

    if(serviceProvider.stripeInfo == null) {
        throw new HttpsError(
            "internal",
            "service provider stripe info not provided"
        );
    }
    let response = await chain.mutation({
        update_service_provider_stripe_info: [{
            where: {
                stripe_id: {
                    _eq: serviceProvider.stripeInfo.id
                }
            },
            _set: {
                charge_fees_on_customer: serviceProvider.stripeInfo.chargeFeesOnCustomer ?? undefined,
                charges_enabled: serviceProvider.stripeInfo.chargesEnabled,
                details_submitted: serviceProvider.stripeInfo.detailsSubmitted,
                email: serviceProvider.stripeInfo.email ?? undefined,
                payouts_enabled: serviceProvider.stripeInfo.payoutsEnabled,
                requirements: JSON.stringify(serviceProvider.stripeInfo.requirements),
                stripe_id: serviceProvider.stripeInfo.id,
                status: serviceProvider.stripeInfo.status,
            }
        }, {
            affected_rows: true
        }]
    });
    if(response.update_service_provider_stripe_info == null) {
        throw new HttpsError(
          "internal",
          "service provider stripe not setup"
        );
    }
}
export async function updateServiceProviderPayment(serviceProvider: ServiceProvider) {
    let chain = getHasura();

    if(serviceProvider.acceptedPayments == null) {
        throw new HttpsError(
            "internal",
            "service provider payment methods not provided"
        );
    }
    chain.mutation({
        update_service_provider_details_by_pk: [{
            pk_columns: {
                id: serviceProvider.serviceProviderDetailsId!
            },
            _set: {
                accepted_payments: JSON.stringify(serviceProvider.acceptedPayments)
            }
        }, {
            id: true
        }]
    });
}
