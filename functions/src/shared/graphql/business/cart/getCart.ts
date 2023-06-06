import { getHasura } from "../../../../utilities/hasura";
import { MezError } from "../../../models/Generic/Generic";
import { OfferingType } from "../../../models/Services/Business/Business";
import { BusinessCart, BusinessItemParameters, BusinessOrderItem } from "../../../models/Services/Business/BusinessOrder";

export async function getBusinessCart(customerId: number): Promise<BusinessCart> {
    let chain = getHasura();
   
    let response =  await chain.query({
        business_cart_by_pk: [{
            customer_id: customerId
        }, {
            business_id: true,
            discount_value: true,
            cost: true,
            items: [{}, {
                id: true,
                item_id: true,
                parameters: [{}, true],
                cost: true,
                time: true,
                offering_type: true,
            }]
        }]
    });

    if(response.business_cart_by_pk == null) {
        throw new MezError("cartNotFound");
    }
    
    let items: BusinessOrderItem[] = response.business_cart_by_pk.items.map((i: any) => {
        return {
            id: i.id,
            customerId,
            itemId: i.item_id,
            cost: i.cost,
            time: i.time,
            offeringType: i.offering_type as OfferingType,
            parameters: JSON.parse(i.parameters) as BusinessItemParameters,
        }
    })
    return {
        customerId,
        businessId: response.business_cart_by_pk.business_id,
        items,
        cost: response.business_cart_by_pk.cost,
    }
}