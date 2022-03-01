import { NotificationInfo } from "./Generic/Generic";

export interface DeliveryAdmin {
  authorized: boolean,
  versionNumber: string,
  notificationInfo: NotificationInfo
}