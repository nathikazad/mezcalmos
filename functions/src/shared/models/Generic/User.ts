import { CustomerStripe } from "../stripe";
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
  creationTime?: string;
}

export interface CustomerInfo extends UserInfo {
  appVersion?: string,
  notificationInfo?: NotificationInfo,
  stripeInfo?: CustomerStripe
}

export interface MezAdmin extends UserInfo {
  version?: string,
  notificationInfo?: NotificationInfo,
}