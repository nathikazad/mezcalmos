export interface Location {
  address: string;
  lat: number;
  lng: number;
}

export enum Language {
  EN = "en",
  ES = "es",
}

export interface DeliveryAdmin {
  authorized: boolean,
  versionNumber: string,
  notificationInfo: Record<NotificationType, string>
}

export enum NotificationType {
  DeviceNotificationToken = "deviceNotificationToken",
}

export interface ServerResponse {
  status: ServerResponseStatus
  errorMessage?: string
  errorCode?: string
}

export enum ServerResponseStatus {
  Success = "Success",
  Error = "Error"
}