import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { ServiceProvider } from "../../models/Services/Service";

export async function updateLaundryStripe(laundryStore: ServiceProvider) {
    let chain = getHasura();
    // if(!(laundryStore.id)) {
    //     throw new HttpsError(
    //         "internal",
    //         "Laundry store id not found"
    //     );
    // }
    // let response = await chain.mutation({
    //     update_laundry_store_by_pk: [{
    //         pk_columns: {
    //             id: laundryStore.id
    //         },
    //         _set: {
    //             stripe_info: JSON.stringify(laundryStore.stripeInfo),
    //             accepted_payments: JSON.stringify(laundryStore.acceptedPayments)
    //         }
    //     }, {
    //         accepted_payments: [{}, true],
    //         stripe_info:[{}, true]
    //     }]
    // });
    // if(!(response.update_laundry_store_by_pk)) {
    //     throw new HttpsError(
    //       "internal",
    //       "restaurant update error"
    //     );
    // }
    
    let response = await chain.query({
        laundry_store_by_pk: [{
            id: laundryStore.id
        }, {
            details_id: true
        }]
    })
    if(response.laundry_store_by_pk == null) {
        throw new HttpsError(
          "internal",
          "No laundry store with that id found"
        );
    }
    if(laundryStore.stripeInfo == null) {
        throw new HttpsError(
            "internal",
            "laundry store stripe info not provided"
        );
    }

    let mutationResponse = await chain.mutation({
        update_service_provider_stripe_info_by_pk: [{
            pk_columns: {
                sp_id: response.laundry_store_by_pk.details_id
            },
            _set: {
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
            stripe_id: true
        }],
        update_service_provider_details_by_pk: [{
            pk_columns: {
                id: response.laundry_store_by_pk.details_id
            },
            _set: {
                accepted_payments: JSON.stringify(laundryStore.acceptedPayments)
            }
        }, {
            id: true
        }]
    });
    if(!(mutationResponse.update_service_provider_stripe_info_by_pk)) {
        throw new HttpsError(
          "internal",
          "laundry store update error"
        );
    }
}
