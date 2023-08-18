import { setCourierChatInfo } from "../shared/graphql/chat/setChatInfo";
import { createNewCourierOrder } from "../shared/graphql/delivery/courier/createOrder";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { notifyDeliveryDrivers } from "../shared/helper";
import { CustomerAppType, Location, MezError } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { CustomerInfo, MezAdmin } from "../shared/models/Generic/User";
import { CourierItem, CourierOrder } from "../shared/models/Services/Courier/Courier";
import { notifyAdminsNewOrder } from "../shared/helper";

export interface CourierRequest {
    toLocation: Location,
    fromLocationGps?: Location,
    fromLocationText?: string,
    items: Array<CourierItem>;
    deliveryCompanyIds: Array<number>,
    customerOffer: number,
    customerAppType: CustomerAppType,
    tax?: number,
    scheduledTime?: string,
    stripeFees?: number,
    discountValue?: number,
    tripDistance?: number,
    tripDuration?: number,
    tripPolyline?: string
    distanceFromBase?: number,
    refundAmount?: number,
}
export interface CreateCourierResponse {
    success: boolean,
    error?: CreateCourierError
    unhandledError?: string,
    orderId?: number
}
export enum CreateCourierError {
    UnhandledError = "unhandledError",
    CustomerNotFound = "customerNotFound",
    OrderCreationError = "orderCreationError",
    NoDeliveryCompanyFound = "noDeliveryCompanyFound",
    DeliveryCompaniesHaveNoDrivers = "deliveryCompaniesHaveNoDrivers",
}
export async function createCourierOrder(customerId: number, courierRequest: CourierRequest): Promise<CreateCourierResponse> {
    try {
        let response = await Promise.all([getCustomer(customerId), getMezAdmins()])
        let customer: CustomerInfo = response[0];
        let mezAdmins: MezAdmin[] = response[1]

        let courierOrder: CourierOrder = await createNewCourierOrder(customerId, courierRequest, mezAdmins);

        setCourierChatInfo(courierOrder, customer);
        
        await notifyDeliveryDrivers(courierOrder.deliveryOrder);
        
        notifyAdminsNewOrder(mezAdmins, courierOrder.id, OrderType.Courier);
        
        return {
            success: true,
            orderId: courierOrder.id
        }
    } catch(e: any) {
        if (e instanceof MezError) {
            if (Object.values(CreateCourierError).includes(e.message as any)) {
                return {
                    success: false,
                    error: e.message as any
                }
            } else {
                return {
                    success: false,
                    error: CreateCourierError.UnhandledError,
                    unhandledError: e.message as any
                }
            }
        } else {
        throw e
        }
    }
}
