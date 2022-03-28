import { getUserInfo } from "../controllers/rootController";
import { DeliveryAdmin } from "../models/DeliveryAdmin";
import { Chat, ParticipantType } from "../models/Generic/Chat";
import { UserInfo } from "../models/Generic/User";
import * as chatController from "../controllers/chatController";

export async function addDeliveryAdminsToChat(
  deliveryAdmins: Record<string, DeliveryAdmin>,
  chat: Chat,
  chatId: string) {
  for (var deliveryAdminId in deliveryAdmins) {
    var userInfo: UserInfo = await getUserInfo(deliveryAdminId);
    chat.participants[deliveryAdminId] = {
      ...userInfo,
      particpantType: ParticipantType.DeliveryAdmin
    }
  }

  chatController.setChat(chatId, chat);
}