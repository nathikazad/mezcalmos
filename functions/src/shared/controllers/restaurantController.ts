import * as serviceProviderNodes from "../../shared/databaseNodes/services/serviceProvider";
import { OrderType } from "../models/Generic/Order";

export async function getRestaurantReviews(restaurantId: string): Promise<any[]> {
    let array :any[] = [];
     (await serviceProviderNodes.serviceProviderReviews(OrderType.Restaurant, restaurantId).once('value')).forEach((data)=>{
         array.push(data.val());
     });
    return array;
}
