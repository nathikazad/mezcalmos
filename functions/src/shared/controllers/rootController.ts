import { inProcessOrders, notificationInfoNode, userInfoNode } from "../databaseNodes/root";
import { ParticipantType } from "../models/Generic/Chat";
import { NotificationInfo } from "../models/Generic/Generic";
import { OrderType, TwoWayDeliverableOrder } from "../models/Generic/Order";
import { UserInfo } from "../models/Generic/User";

export async function getUserInfo(userId: string): Promise<UserInfo> {
  return (await userInfoNode(userId).once('value')).val();
}

export async function setUserInfo(userId: string, userInfo: UserInfo): Promise<void> {
  return userInfoNode(userId).set(userInfo);
}

export async function getNotificationInfo(participantType: ParticipantType, userId: string): Promise<NotificationInfo> {
  return (await notificationInfoNode(participantType, userId).once('value')).val();
}

// TwoWayDeliverableOrder because it is the lowest child
export async function getInProcessOrder(orderType: OrderType, orderId: string): Promise<TwoWayDeliverableOrder> {
  return (await inProcessOrders(orderType, orderId).once('value')).val();
}