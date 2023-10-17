import { getHasura } from "../../../utilities/hasura";
import { OrderType } from "../../models/Generic/Order";
import { OfferApplied } from "../../models/Services/Offer";

export async function updateOffersApplied(orderId: number, appliedOffers: OfferApplied[], orderType: OrderType) {
    let chain = getHasura();

    let objects = [];
    for(let appliedOffer of appliedOffers) {

        objects.push({
            order_id: orderId,
            offer_id: appliedOffer.offerId,
            discount: appliedOffer.discount,
            order_type: orderType,
            comission: (appliedOffer.commission) ? appliedOffer.commission : undefined
        });
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