import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { ServiceProvider } from "../../models/Services/Service";

export async function updateLaundryStripe(laundryStore: ServiceProvider) {
    let chain = getHasura();

    if(laundryStore.stripeInfo == null) {
        throw new HttpsError(
            "internal",
            "laundry store stripe info not provided"
        );
    }

    let stripeResponse = await chain.mutation({
        insert_service_provider_stripe_info_one: [{
            object: {
                charge_fees_on_customer: laundryStore.stripeInfo.chargeFeesOnCustomer ?? undefined,
                charges_enabled: laundryStore.stripeInfo.chargesEnabled,
                details_submitted: laundryStore.stripeInfo.detailsSubmitted,
                email: laundryStore.stripeInfo.email ?? undefined,
                payouts_enabled: laundryStore.stripeInfo.payoutsEnabled,
                // requirements: ,
                stripe_id: laundryStore.stripeInfo.id,
                status: laundryStore.stripeInfo.status,
            }
        }, {
            id: true
        }]
    })
    if(!(stripeResponse.insert_service_provider_stripe_info_one)) {
        throw new HttpsError(
          "internal",
          "laundry store stripe update error"
        );
    }
    let laundryStoreResponse = await chain.query({
        laundry_store_by_pk: [{
            id: laundryStore.id
        }, {
            details_id: true
        }]
    })
    if(laundryStoreResponse.laundry_store_by_pk == null) {
        throw new HttpsError(
          "internal",
          "No laundry store with that id found"
        );
    }

    // let mutationResponse = 
    chain.mutation({
        update_service_provider_details_by_pk: [{
            pk_columns: {
                id: laundryStoreResponse.laundry_store_by_pk.details_id
            },
            _set: {
                stripe_id: stripeResponse.insert_service_provider_stripe_info_one.id,
                // accepted_payments: JSON.stringify(laundryStore.acceptedPayments)
            }
        }, {
            id: true
        }]
    });
    
}
