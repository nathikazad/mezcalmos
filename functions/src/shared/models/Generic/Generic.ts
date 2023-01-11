import { ParticipantType } from "./Chat";
import { UserInfo } from "./User";

export interface Location {
  lat: number,
  lng: number,
  address?: string;
}

export interface Review {
  rating: number,
  fromEntityId: number,
  fromEntityType: string,
  toEntityId: number,
  toEntityType: string
}

export enum Language {
  EN = "en",
  ES = "es",
}

export enum AppType {
  Customer = "customer",
 
  RestaurantApp = "restaurant",
  DeliveryApp = "delivery",
  DeliveryAdmin = "delivery_admin",
  MezAdmin = "mez_admin"
}

export const AppParticipant: Record<AppType, ParticipantType> = {
  
  [AppType.Customer]: ParticipantType.Customer,
  [AppType.DeliveryAdmin]: ParticipantType.DeliveryOperator,
  [AppType.DeliveryApp]: ParticipantType.DeliveryDriver,
  [AppType.MezAdmin]: ParticipantType.MezAdmin,
  [AppType.RestaurantApp]: ParticipantType.RestaurantOperator
}

export interface NotificationInfo {
  token: string;
  AppTypeId: AppType;
}

export enum TokenType {
  DeviceNotificationToken = "deviceNotificationToken",
}

export interface Operator {
  info: UserInfo,
  versionNumber: string,
  notificationInfo: NotificationInfo
}
export interface LaundryOperator extends Operator {
  state: {
    laundryId: string
  }
}

export interface ServerResponse {
  status: ServerResponseStatus
  errorMessage?: string
  errorCode?: string
  [key: string]: any;
}

export interface ValidationPass {
  ok: boolean,
  error?: ServerResponse,
  [key: string]: any;
}

export enum ServerResponseStatus {
  Success = "Success",
  Error = "Error"
}

export enum AuthorizationStatus {
  InReview = "inReview",
  Authorized = "authorized",
  Unauthorized = "unauthorized"
}

export enum OperatorType {
  Delivery = "delivery",
  Restaurant = "restaurant",
}