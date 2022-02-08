import { info } from "../shared/databaseNodes/restaurant";
import { Restaurant } from "../shared/models/Services/Restaurant/Restaurant";

export async function getRestaurant(restaurantId: string): Promise<Restaurant> {
  return (await info(restaurantId).once("value")).val();
}
