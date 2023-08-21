import { getHasura } from "../../../../utilities/hasura";
import { MezError } from "../../../models/Generic/Generic";
import { Cart, CartItem } from "../../../models/Services/Restaurant/Cart";

export async function getCart(customerId: number): Promise<Cart> {
    let chain = getHasura();
   
    let response =  await chain.query({
        restaurant_cart_by_pk: [{
            customer_id: customerId
        }, {
            restaurant_id: true,
            cost: true,
            discount_value: true,
            applied_offers: [{}, true],
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
                    category_id: true,
                }              
            }]
        }]
    });

    if(response.restaurant_cart_by_pk == null ||  response.restaurant_cart_by_pk.restaurant_id == null) {
        throw new MezError("cartNotFound");
    }
    // console.log("[GLOBAL[0]] SelectedOptions ===> ", response.restaurant_cart_by_pk.items[0].selected_options);
    
    let items: CartItem[] = response.restaurant_cart_by_pk.items.map((i:any) => {
        // console.log("SelectedOptions ===> ", i.selected_options);
        return {
            cartItemId: i.id,
            customerId,
            selectedOptions : (i.selected_options),
            costPerOne: i.cost_per_one,
            quantity: i.quantity,
            itemId: i.restaurant_item_id,
            name : i.restaurant_item.name.translations.reduce((prev:Record<any, any>, current:any) => {
                prev[current.language_id] = current.value;
                return prev;
            }, {}),
            image : i.restaurant_item.image,
            note: i.note,
            categoryId: i.restaurant_item.category_id
        }
    })
    return {
        customerId,
        restaurantId: response.restaurant_cart_by_pk.restaurant_id,
        cost: response.restaurant_cart_by_pk.cost,
        items,
        discountValue: response.restaurant_cart_by_pk.discount_value,
        appliedOffers: response.restaurant_cart_by_pk.applied_offers
    }
}