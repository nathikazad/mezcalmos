import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { ServiceProvider } from "../../models/Services/Service";

export async function updateLaundryStripe(laundryStore: ServiceProvider) {
    let chain = getHasura();
    if(!(laundryStore.id)) {
        throw new HttpsError(
            "internal",
            "Laundry store id not found"
        );
    }
    let response = await chain.mutation({
        update_laundry_store_by_pk: [{
            pk_columns: {
                id: laundryStore.id
            },
            _set: {
                stripe_info: JSON.stringify(laundryStore.stripeInfo),
                accepted_payments: JSON.stringify(laundryStore.acceptedPayments)
            }
        }, {
            accepted_payments: [{}, true],
            stripe_info:[{}, true]
        }]
    });
    if(!(response.update_laundry_store_by_pk)) {
        throw new HttpsError(
          "internal",
          "restaurant update error"
        );
    }
}
