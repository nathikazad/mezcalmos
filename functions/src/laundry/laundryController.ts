import { serviceProviderInfo } from "../shared/databaseNodes/services/serviceProvider";
import { OrderType } from "../shared/models/Generic/Order";
import { Laundry } from "../shared/models/Services/Laundry/Laundry";

export async function getLaundry(laundryId: string): Promise<Laundry> {
  return (await serviceProviderInfo(OrderType.Laundry, laundryId).once("value")).val();
}
