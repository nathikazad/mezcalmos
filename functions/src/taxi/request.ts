import { CustomerAppType, Location, MezError, } from "../shared/models/Generic/Generic";
import { DeliveryAdmin } from "../shared/models/Generic/Delivery";
import { CreateCourierError } from "../delivery/createCourierOrder";
import { setCourierChatInfo, setTaxiChatInfo } from "../shared/graphql/chat/setChatInfo";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { notifyDeliveryDrivers } from "../shared/helper";
import { CustomerInfo, MezAdmin } from "../shared/models/Generic/User";
import { PaymentType } from "../shared/models/Generic/Order";
import { createNewTaxiOrder } from "../shared/graphql/taxi/order/createOrder";
import { TaxiOrder } from "../shared/models/Services/Taxi/TaxiOrder";
 

export interface TaxiRequestDetails {
    toLocation: Location,
    fromLocation: Location,
    chosenCompanies: Array<number>,
    customerOffer: number,
    paymentType: PaymentType,
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
export interface TaxiRequestResponse {
    success: boolean,
    error?: TaxiRequestError
    unhandledError?: string,
    orderId?: number
}
export enum TaxiRequestError {
    UnhandledError = "unhandledError",
    CustomerNotFound = "customerNotFound",
    OrderCreationError = "orderCreationError",
    NoDeliveryCompanyFound = "noDeliveryCompanyFound",
    DeliveryCompaniesHaveNoDrivers = "deliveryCompaniesHaveNoDrivers",

}
export async function requestTaxi(customerId: number, taxiRequestDetails: TaxiRequestDetails): Promise<TaxiRequestResponse> {

    try {
        let response = await Promise.all([getCustomer(customerId), getMezAdmins()])
        let customer: CustomerInfo = response[0];
        let mezAdmins: MezAdmin[] = response[1];

        let order: TaxiOrder = await createNewTaxiOrder(customerId, taxiRequestDetails, mezAdmins);

        setTaxiChatInfo(order, customer);
        
        await notifyDeliveryDrivers(courierOrder.deliveryOrder);
        
        notifyAdmins(mezAdmins, courierOrder.id);


        // let userInfo = await getUser(parseInt(customerId));
        // let order = constructTaxiOrder(orderRequest, userInfo);
        // let orderRef = await customerNodes.inProcessOrders(customerId).push(order);
        // let orderId = orderRef.key!
        // rootNodes.openOrders(OrderType.Taxi, orderId).set(order);

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
};

async function notifyDeliveryAdminsNewOrder(deliveryAdmins: Record<string, DeliveryAdmin>, orderId: string) {

}