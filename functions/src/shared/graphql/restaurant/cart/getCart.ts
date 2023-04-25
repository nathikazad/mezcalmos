import { getHasura } from "../../../../utilities/hasura";
import { MezError } from "../../../models/Generic/Generic";
import { Cart, CartItem } from "../../../models/Services/Restaurant/Cart";

export async function getCart(customerId: number): Promise<Cart> {
    let chain = getHasura();
   
    let response =  await chain.query({
        restaurant_cart: [{
            where: {
                customer_id: {
                    _eq: customerId
                }
            }
        }, {
            restaurant_id: true,
            cost: true,
            items: [{}, {
                id: true,
                restaurant_item_id: true,
                selected_options: [{} , true],
                quantity: true,
                cost_per_one: true,
                note: true,
                restaurant_item : {
                    name : {
                        translations :  [{} , {
                            language_id : true,
                            value : true
                        }], 
                    }, 
                    image: true,
                }              
            }]
        }]
    });

    if(response.restaurant_cart == null || response.restaurant_cart.length == 0) {
        throw new MezError("cartNotFound");
    }
    // console.log("[GLOBAL[0]] SelectedOptions ===> ", response.restaurant_cart[0].items[0].selected_options);
    
    let items: CartItem[] = response.restaurant_cart[0].items.map((i:any) => {
        // console.log("SelectedOptions ===> ", i.selected_options);
        return {
            cartItemId: i.id,
            customerId,
            selectedOptions : JSON.parse(i.selected_options),
            costPerOne: i.cost_per_one,
            quantity: i.quantity,
            itemId: i.restaurant_item_id,
            name : i.restaurant_item.name.translations.reduce((prev:Record<any, any>, current:any) => {
                prev[current.language_id] = current.value;
                return prev;
            }, {}),
            image : i.restaurant_item.image,
            note: i.note
        }
    })
    return {
        customerId,
        restaurantId: response.restaurant_cart[0].restaurant_id,
        cost: response.restaurant_cart[0].cost,
        items,
    }
}