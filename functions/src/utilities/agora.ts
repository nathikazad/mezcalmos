

import { Keys } from "../shared/models/Generic/Keys";
import * as agora from 'agora-access-token';
import * as fcm from "../utilities/senders/fcm";
import { EndCallBackgroundNotification, NewCallBackgroundNotification, NotificationType } from "../shared/models/Notification";
import { chatUrl } from "./senders/appRoutes";
import { CallNotificationtType, AppTypeToChatInfoAppName, ParticipantType, ChatInfo, getAppTypeFromParticipantType, Participant, ParticipantAgoraDetails, CallNotificationForQueue } from "../shared/models/Generic/Chat";
import { getKeys } from "../shared/keys";
import { HttpsError } from "firebase-functions/v1/auth";
import { getChat } from "../shared/graphql/chat/getChat";
import { getNotificationInfo } from "../shared/graphql/notification/getNotificationInfo";
import { NotificationInfo } from "../shared/models/Generic/Generic";

let keys: Keys = getKeys();

export interface CallUserDetails {
  chatId: number,
  callerParticipantType: ParticipantType
}
export interface CallUserResponse {
  uid: number,
  token: string,
  expirationTime: string,
  participantType: ParticipantType,
  notificationInfo: NotificationInfo | null
}
export async function callUser(callerUserId: number, callUserDetails: CallUserDetails): Promise<CallUserResponse> {
  let chat = await getChat(callUserDetails.chatId)
  let chatInfo: ChatInfo = chat.chatInfo[AppTypeToChatInfoAppName[getAppTypeFromParticipantType(callUserDetails.callerParticipantType)]];
  
  let recipient: Participant = getRecipient();

  // out of bounds error if caller isnt there in participant
  let caller:Participant = chat.participants.filter((p) => p.participantType == callUserDetails.callerParticipantType && p.id == callerUserId)[0]

  let callerAgoraToken = getAgoraDetails(callUserDetails.chatId, caller.id)
  let recipientAgoraToken = getAgoraDetails(callUserDetails.chatId, recipient.id)


  notifyCallerOfNewCall(callUserDetails.chatId, caller, recipient, recipientAgoraToken)
  // return agoraToken, recipientId, recipientType
  return {
    ...callerAgoraToken,
    ...recipient
  }

  function getRecipient(): Participant {
    let correctParticipants: Participant[] = chat.participants.filter((p) => p.participantType == chatInfo.participantType && p.notificationInfo?.turnOffNotifications == false);
    if (correctParticipants.length > 0) {
      return correctParticipants[0]
    } else if (chatInfo.participantType != ParticipantType.Customer) { // if the customer is trying to reach someone then forward to mez admin
      correctParticipants = chat.participants.filter((p) => p.participantType == ParticipantType.MezAdmin && p.notificationInfo?.turnOffNotifications == false);
      if (correctParticipants.length > 0)
        return correctParticipants[0] 
    }

    throw new HttpsError(
      "internal",
      "Recipient not avaialable"
    );
  }
}

export async function notifyCallerOfNewCall(chatId: number, caller:Participant, recipient: Participant, recipientAgoraToken: ParticipantAgoraDetails) {
    let fcmMessage: fcm.fcmPayload = {
      token: recipient.notificationInfo!.token,
      payload: {
        data: <NewCallBackgroundNotification>{
          linkUrl: chatUrl(chatId),
          language: caller.language,
          callerName: caller.name ?? "Caller",
          callerImage: caller.image,
          notificationType: NotificationType.Call,
          callNotificationType: CallNotificationtType.Incoming,
          callerId: caller.id.toString(),
          chatId: chatId.toString(),
          callerType: caller.participantType,
          agoraToken: recipientAgoraToken.token,
          recipientuid: recipient.id.toString(),
          recipientType: recipient.participantType
        }
      },
      options: {
        priority: fcm.NotificationPriority.High,
        contentAvailable: true
      }
    };
    fcm.push(fcmMessage);
}

export async function notifyCallerOfEndCall(chatId: number, callNotificationForQueue: CallNotificationForQueue) {
  let recipientNotificationInfo = await getNotificationInfo(callNotificationForQueue.recipientId, getAppTypeFromParticipantType(callNotificationForQueue.recipientParticipantType));
  let fcmMessage: fcm.fcmPayload = {
    token: recipientNotificationInfo.token,
    payload: {
      data: <EndCallBackgroundNotification>{
        linkUrl: chatUrl(chatId),        
        notificationType: NotificationType.Call,
        callNotificationType: CallNotificationtType.EndCall,
        chatId: chatId.toString(),
        callerId: callNotificationForQueue.callerId.toString(),
        callerType: callNotificationForQueue.callerParticipantType
      }
    },
    options: {
      priority: fcm.NotificationPriority.High,
      contentAvailable: true
    }
  };
  fcm.push(fcmMessage);
}


function getAgoraDetails(chatId: number, userId: number): ParticipantAgoraDetails {
  let expirationTime: number = Math.floor(Date.now() / 1000) + 24 * 60 * 60;
  let token: string = agora.RtcTokenBuilder.buildTokenWithUid(keys.agora!.appId,
    keys.agora!.certificate,
    chatId.toString(),
    userId,
    agora.RtcRole.PUBLISHER,
    0
  );
  console.log(token)
  return <ParticipantAgoraDetails> {
    token,
    expirationTime: (new Date(expirationTime * 1000)).toISOString(),
  }
}