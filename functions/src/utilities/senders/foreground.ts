import { notificationsNode } from "../../shared/databaseNodes/root";
import { ParticipantType } from "../../shared/models/Generic/Chat";
import { ForegroundNotification } from "../../shared/models/Notification";

export interface fgPayload {
  participantType: ParticipantType,
  firebaseUserId: string,
  notification: ForegroundNotification,
  linkUrl: string
}

export async function push(payload: fgPayload): Promise<void> {
  console.log("payload: ", payload);
  notificationsNode(payload.participantType, payload.firebaseUserId).push(payload.notification);
}