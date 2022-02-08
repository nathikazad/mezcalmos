import { info } from "../databaseNodes/taxi"
import { Taxi } from "../models/Drivers/Taxi";

export async function getTaxi(taxiId: string): Promise<Taxi> {
  console.log(`checking taxi node at @ ${info(taxiId)}`);
  return (await info(taxiId).once('value')).val();
}