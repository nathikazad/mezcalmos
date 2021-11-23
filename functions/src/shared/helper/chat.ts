
import { Chat, ChatType, ParticipantType } from "../models/Chat";
import { OrderType } from "../models/Order";
import { UserInfo } from "../models/User";
import *  as rootNodes from "../databaseNodes/root";


export async function buildChat(
  customerId: string,
  customerInfo: UserInfo,
  serviceProviderId: string,
  serviceProviderInfo: UserInfo,
  orderId: string): Promise<Chat> {
  let chat: Chat = {
    chatType: ChatType.Order,
    orderType: OrderType.Restaurant,
    participants: {
      [customerId]: {
        name: customerInfo.displayName.split(' ')[0],
        image: customerInfo.photo,
        particpantType: ParticipantType.Customer,
        language: customerInfo.language ? customerInfo.language : "en",
        phoneNumber: (customerInfo.phoneNumber) ? customerInfo.phoneNumber : undefined
      },
      [serviceProviderId]: {
        name: serviceProviderInfo.displayName.split(' ')[0],
        image: serviceProviderInfo.photo,
        particpantType: ParticipantType.Restaurant,
        language: serviceProviderInfo.language ? serviceProviderInfo.language : "en",
        phoneNumber: (serviceProviderInfo.phoneNumber) ? serviceProviderInfo.phoneNumber : undefined
      },
    }
  }
  await rootNodes.chat(orderId).set(chat);
  return chat;
}