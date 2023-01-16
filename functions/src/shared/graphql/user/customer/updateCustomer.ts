import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { CustomerInfo } from "../../../models/Generic/User";

export async function updateCustomerStripe(customer: CustomerInfo) {
    let chain = getHasura();
    
    let response = await chain.mutation({
        update_customer_customer_by_pk: [{
            pk_columns: {
                user_id: customer.id
            },
            _set: {
                stripe_info: JSON.stringify(customer.stripeInfo),
            }
        }, {
            stripe_info:[{}, true]
        }]
    });
    if(!(response.update_customer_customer_by_pk)) {
        throw new HttpsError(
          "internal",
          "customer update error"
        );
    }
}