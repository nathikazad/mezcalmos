// async function 
import { deliveryAdmins } from "../databaseNodes/root";
import { ServerResponse, ServerResponseStatus } from "../models/Generic";

export async function checkAdmin(adminId: string): Promise<ServerResponse | undefined> {
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
export function isSignedIn(auth: any): ServerResponse | undefined {
  if (!auth && !auth.uid)
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "User needs to be signed in"
    }
  return undefined;
}

