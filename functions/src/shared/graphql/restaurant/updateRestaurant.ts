import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { ServiceProvider } from "../../models/Services/Service";

export async function updateRestaurantStripe(restaurant: ServiceProvider) {
    let chain = getHasura();

    let response = await chain.query({
        restaurant_restaurant_by_pk: [{
            id: restaurant.id
        }, {
            details_id: true
        }]
    })
    if(response.restaurant_restaurant_by_pk == null) {
        throw new HttpsError(
          "internal",
          "No restaurant with that id found"
        );
    }
    if(restaurant.stripeInfo == null) {
        throw new HttpsError(
            "internal",
            "Restaurant stripe info not provided"
        );
    }

    let mutationResponse = await chain.mutation({
        update_service_provider_stripe_info_by_pk: [{
            pk_columns: {
                id: response.restaurant_restaurant_by_pk.details_id
            },
            _set: {
                charge_fees_on_customer: restaurant.stripeInfo.chargeFeesOnCustomer ?? undefined,
                charges_enabled: restaurant.stripeInfo.chargesEnabled,
                details_submitted: restaurant.stripeInfo.detailsSubmitted,
                email: restaurant.stripeInfo.email ?? undefined,
                payouts_enabled: restaurant.stripeInfo.payoutsEnabled,
                // requirements: ,
                stripe_id: restaurant.stripeInfo.id,
                status: restaurant.stripeInfo.status,
            }
        }, {
            stripe_id: true
        }],
        update_service_provider_details_by_pk: [{
            pk_columns: {
                id: response.restaurant_restaurant_by_pk.details_id
            },
            _set: {
                accepted_payments: JSON.stringify(restaurant.acceptedPayments)
            }
        }, {
            id: true
        }]
    });
    if(!(mutationResponse.update_service_provider_stripe_info_by_pk)) {
        throw new HttpsError(
          "internal",
          "restaurant update error"
        );
    }
}
