import { ServiceType } from "./Business";

export interface BusinessCart {
  customerId: number;
  businessId: number;
  cost: number;
  items: Array<BusinessCartItem>;
}

export interface BusinessCartItem {
  cartItemId?: number;
  serviceId: number,
  serviceType: ServiceType,
  customerId: number;
  quantity: number;
  costPerOne: number;
  // notes?: string;
  name?:any;
  image?:string;
}
