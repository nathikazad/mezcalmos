import { getUserInfo } from "../controllers/rootController";
import { DeliveryAdmin } from "../models/DeliveryAdmin";
import { ChatObject, Participant, ParticipantType } from "../models/Generic/Chat";
import { UserInfo } from "../models/Generic/User";

export async function addDeliveryAdminsToChat(
  chat: ChatObject,
  deliveryAdmins: Record<string, DeliveryAdmin>
) {
  for (var deliveryAdminId in deliveryAdmins) {
    var userInfo: UserInfo = await getUserInfo(deliveryAdminId);
    let participant: Participant = {
      ...userInfo,
      participantType: ParticipantType.DeliveryOperator,
      notificationInfo: null
    }
    chat.addParticipant(participant)
  }
}