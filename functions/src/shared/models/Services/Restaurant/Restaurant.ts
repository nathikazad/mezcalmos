import { ServiceProviderStripeInfo } from "../../../../utilities/stripe/model";
import { DeliveryDetails } from "../../Generic/Delivery";
import { Language, Location, NotificationInfo } from "../../Generic/Generic";
import { PaymentType } from "../../Generic/Order";
import { UserInfo } from "../../Generic/User";
import { ForegroundNotification, NotificationForQueue } from "../../Notification";
import { ServiceLink } from "../Service";

export interface Restaurant {
  restaurantId?: number;
  name: string;
  image: string;
  phoneNumber?: string;
  firebaseId?: string;
  selfDelivery: boolean;
  location: Location;
  description?: Record<Language, string>;
  schedule?: any;
  paymentInfoId?: number;
  openStatus?: OpenStatus;
  stripeInfo?: ServiceProviderStripeInfo;
  acceptedPayments?: Record<PaymentType, boolean>;
  approved?: boolean;
  restaurantOperators?: Array<RestaurantOperator>
  links?: ServiceLink;
  deliveryPartnerId?: number;
  delivery: boolean;
  customerPickup: boolean;
  deliveryDetails?: DeliveryDetails;
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

export interface NewRestaurantNotificationForQueue extends NotificationForQueue {
  name: string,
  image: string,
  id: number,
}

export interface NewRestaurantNotification extends ForegroundNotification {
  name: string,
  image: string,
  id: number,
}

export interface OperatorApprovedNotificationForQueue extends NotificationForQueue {
  operatorId: number,
  approved: boolean
  restaurantName: string,
  restaurantId: number
}

export interface RestaurantOperatorApprovedNotification extends ForegroundNotification {
  operatorId: number,
  approved: boolean,
  restaurantName: string,
  restaurantId: number
}

export interface AuthorizeOperatorNotificationForQueue extends NotificationForQueue {
  newOperatorName: string,
  newOperatorImage: string,
  restaurantId: number,
}