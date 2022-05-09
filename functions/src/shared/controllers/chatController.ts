import { chatMessageNotifiedNode, chatNode } from "../databaseNodes/chat";
import { Chat, ParticipantType } from "../models/Generic/Chat";
import { UserInfo } from "../models/Generic/User";
import { getUserInfo } from "./rootController";

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

export async function deleteChat(chatId: string) {
  return (await chatNode(chatId).remove())
}

export async function setChatMessageNotifiedAsTrue(chatId: string, messageId: string) {
  return chatMessageNotifiedNode(chatId, messageId).set(true);
}

export async function addParticipantsToChat(
  users: Array<string>,
  chat: Chat,
  chatId: string,
  participantType: ParticipantType) {
  for (var index in users) {
    let userId: string = users[index]
    var userInfo: UserInfo = await getUserInfo(userId);
    chat.participants[userId] = {
      ...userInfo,
      particpantType: participantType
    }
  }

  await setChat(chatId, chat);
}