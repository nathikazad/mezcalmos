import { CustomerAppType, Location, MezError, } from "../shared/models/Generic/Generic";
import { setTaxiChatInfo } from "../shared/graphql/chat/setChatInfo";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { notifyAdminsNewOrder, notifyTaxiDrivers } from "../shared/helper";
import { CustomerInfo, MezAdmin } from "../shared/models/Generic/User";
import { OrderType, PaymentType } from "../shared/models/Generic/Order";
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
    NoTaxiCompanyFound = "noTaxiCompanyFound",
    TaxiCompaniesHaveNoDrivers = "taxiCompaniesHaveNoDrivers",
}
export async function requestTaxi(customerId: number, taxiRequestDetails: TaxiRequestDetails): Promise<TaxiRequestResponse> {

    try {
        let response = await Promise.all([getCustomer(customerId), getMezAdmins()])
        let customer: CustomerInfo = response[0];
        let mezAdmins: MezAdmin[] = response[1];

        let order: TaxiOrder = await createNewTaxiOrder(customerId, taxiRequestDetails, mezAdmins);

        setTaxiChatInfo(order, customer); 
        
        await notifyTaxiDrivers(order);
        
        notifyAdminsNewOrder(mezAdmins, order.id, OrderType.Courier);

        return {
          success: true,
          orderId: order.id
        }
    } catch(e: any) {
        if (e instanceof MezError) {
            if (Object.values(TaxiRequestError).includes(e.message as any)) {
                return {
                    success: false,
                    error: e.message as any
                }
            } else {
                return {
                    success: false,
                    error: TaxiRequestError.UnhandledError,
                    unhandledError: e.message as any
                }
            }
        } else {
            throw e
        }
    }
};
