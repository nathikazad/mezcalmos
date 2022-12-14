import { Language, NotificationInfo } from "./Generic";

export interface UserInfo {
  id: number;
  image?: string;
  firebaseId: string;
  name?: string;
  language: Language;
  email?: string;
  phoneNumber?: string;
  deleted?: boolean;
}

export interface CustomerInfo extends UserInfo {
  appVersion?: string,
  notificationInfo?: NotificationInfo
}

export interface MezAdmin {
  userId: number,
  version?: string,
  notificationInfo?: NotificationInfo,
  user?: UserInfo,
}