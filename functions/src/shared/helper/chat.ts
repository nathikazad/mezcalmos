import { Chat, ChatType, Participant } from "../models/Chat";
import { OrderType } from "../models/Order";
import *  as rootNodes from "../databaseNodes/root";


export async function buildChat(
  customerId: string,
  customerInfo: Participant,
  serviceProviderId: string,
  serviceProviderInfo: Participant,
  orderId: string): Promise<Chat> {
  let chat: Chat = {
    chatType: ChatType.Order,
    orderType: OrderType.Restaurant,
    participants: {
      [customerId]: customerInfo,
      [serviceProviderId]: serviceProviderInfo,
    }
  }
  await rootNodes.chat(orderId).set(chat);
  return chat;
}