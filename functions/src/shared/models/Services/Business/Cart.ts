import { Language } from "../../Generic/Generic";
import { ServiceType } from "./Business";
import { BusinessItemCost } from "./BusinessOrder";

export interface BusinessCart {
  customerId: number;
  businessId: number;
  cost: number;
  items: Array<BusinessCartItem>;
  discountValue?: number;
}

export interface BusinessCartItem {
  cartItemId: number;
  serviceId: number,
  serviceType: ServiceType,
  customerId: number;
  cost: BusinessItemCost;
  name?: Record<Language, string>;
  image?:string;
}
