import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { ServiceProvider } from "../../models/Services/Service";

export async function updateRestaurantStripe(restaurant: ServiceProvider) {
    let chain = getHasura();

    if(restaurant.stripeInfo == null) {
        throw new HttpsError(
            "internal",
            "Restaurant stripe info not provided"
        );
    }

    let stripeResponse = await chain.mutation({
        insert_service_provider_stripe_info_one: [{
            object: {
                charge_fees_on_customer: restaurant.stripeInfo.chargeFeesOnCustomer ?? undefined,
                charges_enabled: restaurant.stripeInfo.chargesEnabled,
                details_submitted: restaurant.stripeInfo.detailsSubmitted,
                email: restaurant.stripeInfo.email ?? undefined,
                payouts_enabled: restaurant.stripeInfo.payoutsEnabled,
                // requirements: ,
                stripe_id: restaurant.stripeInfo.id,
                status: restaurant.stripeInfo.status,
            },
        }, {
            id: true
        }]
    })
    if(!(stripeResponse.insert_service_provider_stripe_info_one)) {
        throw new HttpsError(
          "internal",
          "restaurant stripe update error"
        );
    }
    let restaurantResponse = await chain.query({
        restaurant_restaurant_by_pk: [{
            id: restaurant.id
        }, {
            details_id: true
        }]
    })
    if(restaurantResponse.restaurant_restaurant_by_pk == null) {
        throw new HttpsError(
          "internal",
          "No restaurant with that id found"
        );
    }

    // let mutationResponse = 
    chain.mutation({
        update_service_provider_details_by_pk: [{
            pk_columns: {
                id: restaurantResponse.restaurant_restaurant_by_pk.details_id
            },
            _set: {
                stripe_id: stripeResponse.insert_service_provider_stripe_info_one.id,
                // accepted_payments: JSON.stringify(restaurant.acceptedPayments)
            }
        }, {
            id: true
        }]
    });
    
}
