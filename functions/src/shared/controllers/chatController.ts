import { chatMessageNotifiedNode, chatNode } from "../databaseNodes/chat";
import { Chat } from "../models/Chat";


export async function getChat(orderId: string): Promise<Chat> {
  return (await chatNode(orderId).once('value')).val();
}

export async function setChat(orderId: string, chat: Chat) {
  return (await chatNode(orderId).set(chat))
}

export async function setChatMessageNotifiedAsTrue(orderId: string, messageId: string) {
  return chatMessageNotifiedNode(orderId, messageId).set(true);
}