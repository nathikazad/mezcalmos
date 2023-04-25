import { getHasura } from "../../../../utilities/hasura";
import { MezError } from "../../../models/Generic/Generic";
import { ServiceType, TimeUnit } from "../../../models/Services/Business/Business";
import { BusinessItemCost } from "../../../models/Services/Business/BusinessOrder";
import { BusinessCart, BusinessCartItem } from "../../../models/Services/Business/Cart";

export async function getBusinessCart(customerId: number): Promise<BusinessCart> {
    let chain = getHasura();
   
    let response =  await chain.query({
        business_cart_by_pk: [{
            customer_id: customerId
        }, {
            business_id: true,
            discount_value: true,

            items: [{}, {
                id: true,
                cost: [{}, true],
                service_id: true,
                service_type: true,
            }]
        }]
    });

    if(response.business_cart_by_pk == null) {
        throw new MezError("cartNotFound");
    }
    
    let items: BusinessCartItem[] = response.business_cart_by_pk.items.map((i:any) => {
        return {
            cartItemId: i.id,
            customerId,
            serviceId: i.service_id,
            serviceType: i.service_type as ServiceType,
            cost: JSON.parse(i.cost) as BusinessItemCost,
        }
    })
    let cost = 0;
    items.forEach((i:any) => {
        switch (i.cost.timeUnit) {
            case TimeUnit.PerHour:
                cost += (i.cost.estimatedCostPerOne 
                            * Math.ceil((new Date(i.cost.fromTime).valueOf() - new Date(i.cost.toTime).valueOf()) / (1000 * 60 * 60)) 
                            * i.cost.quantity);
                break;
            case TimeUnit.PerDay:
                cost += (i.cost.estimatedCostPerOne 
                            * Math.ceil((new Date(i.cost.fromTime).valueOf() - new Date(i.cost.toTime).valueOf()) / (1000 * 60 * 60 * 24)) 
                            * i.cost.quantity);
                break;
            default:
                cost += i.cost.estimatedCostPerOne * i.cost.quantity;
                break;
        }
    })
    return {
        customerId,
        businessId: response.business_cart_by_pk.business_id,
        items,
        cost
    }
}