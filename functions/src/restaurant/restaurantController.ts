import { info } from "../shared/databaseNodes/restaurant";
import { Restaurant } from "./models/Restaurant";

export async function getRestaurant(restaurantId: string): Promise<Restaurant> {
  return (await info(restaurantId).once("value")).val();
}
