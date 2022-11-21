import { Language } from "./Generic";

export interface UserInfo {
  id: string;
  image: string;
  firebaseId?: string
  name?: string;
  language?: Language;
  email?: string;
  phoneNumber?: string;
}

export interface CustomerInfo extends UserInfo {
  appVersion: string,
  notificationInfoId?: number
}