import { Language, Location, NotificationInfo } from "../../Generic/Generic";
import { OrderType } from "../../Generic/Order";
import { UserInfo } from "../../Generic/User";
import { ForegroundNotification } from "../../Notification";
import { ServiceLink } from "../Service";

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
  restaurantId?: number;
  name: string;
  image: string;
  firebaseId?: string;
  location: Location;
  description?: Record<Language, string>;
  schedule?: any;
  paymentInfoId?: number;
  openStatus?: OpenStatus;
 
  // LanguageId: Language;
  approved?: boolean;
  restaurantOperators?: Array<RestaurantOperator>
  links?: ServiceLink;
}


export enum OpenStatus {
  Open = "open",
  ClosedTemporarily = "closed_temporarily",
  ClosedIndefinitely = "closed_indefinitely",
}

export interface RestaurantOperator {
  id?: number;
  userId: number;
  restaurantId: number;
  status: OperatorStatus;
  owner?: boolean;
  appVersion?: string;
  currentGps?: Location;
  notificationInfo?: NotificationInfo;
  user?: UserInfo;
}

export enum OperatorStatus {
  AwaitingApproval = "awaiting_approval",
  Authorized = "authorized",
  Banned = "banned"
}

export interface NewRestaurantNotification extends ForegroundNotification {
  name: string,
  image: string,
  id: number
}

