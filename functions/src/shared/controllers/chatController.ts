import { chatMessageNotifiedNode, chatNode } from "../databaseNodes/chat";
import { Chat } from "../models/Generic/Chat";

export async function pushChat(chat?: Chat): Promise<string> {
  let chatId: string = (await chatNode().push(chat)).key!;
  return chatId;
}

export async function getChat(chatId: string): Promise<Chat> {
  return (await chatNode(chatId).once('value')).val();
}

export async function setChat(chatId: string, chat: Chat) {
  return (await chatNode(chatId).set(chat))
}

export async function updateChat(chatId: string, chat: Chat) {
  return (await chatNode(chatId).update(chat))
}

export async function setChatMessageNotifiedAsTrue(chatId: string, messageId: string) {
  return chatMessageNotifiedNode(chatId, messageId).set(true);
}