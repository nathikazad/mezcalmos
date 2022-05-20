import { getUserInfo } from "../controllers/rootController";
import { DeliveryAdmin } from "../models/DeliveryAdmin";
import { ChatObject, ParticipantType } from "../models/Generic/Chat";
import { UserInfo } from "../models/Generic/User";

export async function addDeliveryAdminsToChat(
  chat: ChatObject,
  deliveryAdmins: Record<string, DeliveryAdmin>
) {
  for (var deliveryAdminId in deliveryAdmins) {
    var userInfo: UserInfo = await getUserInfo(deliveryAdminId);
    chat.addParticipant({
      ...userInfo,
      particpantType: ParticipantType.DeliveryAdmin
    })
  }
}