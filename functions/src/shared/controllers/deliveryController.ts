import { info } from "../databaseNodes/deliveryDriver"
import { DeliveryDriver } from "../models/Drivers/DeliveryDriver";

export async function getDeliveryDriver(deliveryDriverId: string): Promise<DeliveryDriver> {
  console.log(`checking taxi node at @ ${info(deliveryDriverId)}`);
  return (await info(deliveryDriverId).once('value')).val();
}