import { NotificationInfo } from "./Generic";

export interface DeliveryAdmin {
  authorized: boolean,
  versionNumber: string,
  notificationInfo: NotificationInfo
}