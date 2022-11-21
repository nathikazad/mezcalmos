import { UserInfo } from "./User";

export interface Location {
  gps: GPS;
  address?: string;
}

export interface GPS {
  type: string;
  coordinates: [number, number];
}

export enum Language {
  EN = "en",
  ES = "es",
}

export enum AppType {
  CustomerWeb = "CustomerWeb",
  CustomerMobile = "CustomerMobile",
  RestaurantApp = "RestaurantApp"
}

export type NotificationInfo = Record<TokenType, string>;

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