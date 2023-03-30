import { getHasura } from "../../../../utilities/hasura";
import { MezError } from "../../../models/Generic/Generic";
import { ServiceType } from "../../../models/Services/Business/Business";
import { BusinessCart, BusinessCartItem } from "../../../models/Services/Business/Cart";

export async function getBusinessCart(customerId: number): Promise<BusinessCart> {
    let chain = getHasura();
   
    let response =  await chain.query({
        business_cart_by_pk: [{
            customer_id: customerId
        }, {
            business_id: true,
            cost: true,
            items: [{}, {
                id: true,
                cost_per_one: true,
                quantity: true,
                service_id: true,
                service_type: true,
            }]
        }]
    });

    if(response.business_cart_by_pk == null) {
        throw new MezError("cartNotFound");
    }
    
    let items: BusinessCartItem[] = response.business_cart_by_pk.items.map((i) => {
        return {
            cartItemId: i.id,
            customerId,
            serviceId: i.service_id,
            serviceType: i.service_type as ServiceType,
            costPerOne: i.cost_per_one,
            quantity: i.quantity,
        }
    })
    return {
        customerId,
        businessId: response.business_cart_by_pk.business_id,
        cost: response.business_cart_by_pk.cost,
        items,
    }
}