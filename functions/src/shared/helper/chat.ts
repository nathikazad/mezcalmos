import { Chat, ChatType, Participant } from "../models/Chat";
import { OrderType } from "../models/Order";
import { setChat } from "../controllers/chatController";


export async function buildChatForOrder(
  customerId: string,
  customerInfo: Participant,
  serviceProviderId: string,
  serviceProviderInfo: Participant,
  orderType: OrderType,
  orderId: string): Promise<Chat> {
  let chat: Chat = {
    chatType: ChatType.Order,
    orderType: orderType,
    participants: {
      [customerId]: customerInfo,
      [serviceProviderId]: serviceProviderInfo,
    }
  }
  await setChat(orderId, chat);
  return chat;
}