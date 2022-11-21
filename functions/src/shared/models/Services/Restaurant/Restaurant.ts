import { AppType, Language, Location } from "../../Generic/Generic";

// export interface ChooseManyOption {
//   cost: number;
//   default: boolean;
//   name: Record<Language, string>;
// }

// export interface ChooseOneOptionListItem {
//   cost: number;
//   name: Record<Language, string>;
// }

// export interface ChooseOneOption {
//   dialog: Record<Language, string>;
//   name: Record<Language, string>;
//   options: Record<string, ChooseOneOptionListItem>;
// }

// export interface Options {
//   chooseMany: Record<string, ChooseManyOption>;
//   chooseOne: Record<string, ChooseOneOption>;
// }

// export interface MenuItem {
//   available: boolean;
//   cost: number;
//   description: Record<Language, string>;
//   image: string;
//   name: Record<Language, string>;
//   options: Options;
// }

// export interface Restaurant extends Service {
//   menu: Record<string, MenuItem>;
// }

export interface Restaurant {
  restaurantId: number;
  name: string;
  image: string;
  location: Location;
  description?: Record<Language, string>;
  scheduleId: number;
  paymentInfoId?: number;
  openStatus: OpenStatus;
  // LanguageId: Language;
  approved: boolean;
  restaurantOperators: Array<RestaurantOperator>
}

export enum OpenStatus {
  Open = "open",
  ClosedTemporarily = "closed_temporarily",
  ClosedIndefinitely = "closed_indefinitely",
}

export interface RestaurantOperator {
  id: number;
  userId: number;
  restaurantId: number;
  status: OperatorStatus;
  owner: boolean;
  appVersion?: string;
  currentGps?: Location;
  notificationInfo: NotificationInfo;
}
export interface NotificationInfo {
  token: string;
  AppTypeId: AppType;
}
export enum OperatorStatus {
  AwaitingApproval = "awaitingApproval",
  Authorized = "authorized",
  Banned = "banned"
}