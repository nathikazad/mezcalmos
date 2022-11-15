// async function 
import { deliveryAdmins } from "../databaseNodes/deliveryAdmin";
import { ServerResponse, ServerResponseStatus } from "../models/Generic/Generic";

export async function checkDeliveryAdmin(adminId: string): Promise<ServerResponse | undefined> {
  let admin = (await deliveryAdmins(adminId).once('value')).val();
  let isAdmin = admin != null && admin.authorized == true
  if (!isAdmin) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "Only admins can run this operation"
    }
  }
  return undefined;
}
export function isSignedIn(userId: string): ServerResponse | undefined {
  if (!userId)
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "User needs to be signed in"
    }
  return undefined;
}

