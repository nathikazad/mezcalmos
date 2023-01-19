import { getHasura } from "../../../utilities/hasura";
import { Discount } from "../../models/Services/Service";

export async function updateOffersApplied(orderId: number, offerIdsAndDiscount: Record<number, Discount>) {
    let chain = getHasura();

    let objects = [];
    for(let offerId in offerIdsAndDiscount) {
        objects.push({
            order_id: orderId,
            offer_id: parseInt(offerId),
            loss: offerIdsAndDiscount[offerId].discountAmount
        })
    }

    // let response = 
    await chain.mutation({
        insert_service_provider_offer_applied: [{
            objects: objects
        }, {
            affected_rows: true
        }]
    });
}