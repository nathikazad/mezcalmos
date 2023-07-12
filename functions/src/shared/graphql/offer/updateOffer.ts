import { getHasura } from "../../../utilities/hasura";
import { OrderType } from "../../models/Generic/Order";

export async function updateOffersApplied(orderId: number, appliedOffers: Array<number>, totalDiscountValue: number, orderType: OrderType) {
    let chain = getHasura();

    let objects = [];
    for(let offerId of appliedOffers) {
        objects.push({
            order_id: orderId,
            offer_id: offerId,
            loss: totalDiscountValue,
            order_type: orderType
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