import { getHasura } from "../../../../utilities/hasura";
import { MezError } from "../../../models/Generic/Generic";
import { BusinessCart, BusinessItemParameters, BusinessOrderItem } from "../../../models/Services/Business/BusinessOrder";

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
                item_details_id: true,
                parameters: [{}, true],
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
            itemDetailsId: i.item_details_id,
            parameters: JSON.parse(i.parameters) as BusinessItemParameters,
        }
    })
    let cost = 0;
    items.forEach((i:BusinessOrderItem) => {
        cost += i.parameters.estimatedCost;
    //     switch (i.cost.timeUnit) {
    //         case TimeUnit.PerHour:
    //             cost += (i.cost.estimatedCostPerOne 
    //                         * Math.ceil((new Date(i.cost.fromTime).valueOf() - new Date(i.cost.toTime).valueOf()) / (1000 * 60 * 60)) 
    //                         * i.cost.quantity);
    //             break;
    //         case TimeUnit.PerDay:
    //             cost += (i.cost.estimatedCostPerOne 
    //                         * Math.ceil((new Date(i.cost.fromTime).valueOf() - new Date(i.cost.toTime).valueOf()) / (1000 * 60 * 60 * 24)) 
    //                         * i.cost.quantity);
    //             break;
    //         default:
    //             cost += i.cost.estimatedCostPerOne * i.cost.quantity;
    //             break;
    //     }
    })
    return {
        customerId,
        businessId: response.business_cart_by_pk.business_id,
        items,
        cost
    }
}