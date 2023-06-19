import { setLaundryToCustomerDeliveryOrderChatInfo } from "../shared/graphql/chat/setChatInfo";
import { getDeliveryOrder } from "../shared/graphql/delivery/getDelivery";
import { createLaundryToCustomerDeliveryOrder } from "../shared/graphql/delivery/createDelivery";
import { getLaundryStore } from "../shared/graphql/laundry/getLaundry";
import { getLaundryOrder } from "../shared/graphql/laundry/order/getLaundryOrder";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { notifyDeliveryDrivers } from "../shared/helper";
import { MezError } from "../shared/models/Generic/Generic";
import { CustomerInfo } from "../shared/models/Generic/User";
import { LaundryOrder, LaundryOrderStatus } from "../shared/models/Services/Laundry/LaundryOrder";
import { ServiceProvider } from "../shared/models/Services/Service";
import { DeliveryOrder } from "../shared/models/Generic/Delivery";

export interface DeliveryRequestDetails {
    orderId: number,
    chosenCompanies: Array<number>,
    customerOffer: number,
}
export interface ReqDeliveryResponse {
    success: boolean,
    error?: ReqDeliveryError
    unhandledError?: string
}
export enum ReqDeliveryError {
    UnhandledError = "unhandledError",
    IncorrectOrderId = "incorrectOrderId",
    IncorrectOrderStatus = "incorrectOrderStatus",
}

export async function requestLaundryDelivery(customerId: number, deliveryRequestDetails: DeliveryRequestDetails): Promise<ReqDeliveryResponse> {
    try {
        let response = await Promise.all([
            getLaundryOrder(deliveryRequestDetails.orderId), 
            getCustomer(customerId),
        ])
        let laundryOrder: LaundryOrder = response[0];
        let customer: CustomerInfo = response[1];

        errorChecks(laundryOrder, customerId);

        let response1 = await Promise.all([
            getLaundryStore(laundryOrder.storeId),
            getDeliveryOrder(laundryOrder.fromCustomerDeliveryId!),
        ]);
        let laundryStore: ServiceProvider = response1[0];
        let fromCustomerDeliveryOrder: DeliveryOrder = response1[1];

        let toCustomerDeliveryOrder: DeliveryOrder = await createLaundryToCustomerDeliveryOrder(laundryOrder, laundryStore, fromCustomerDeliveryOrder, deliveryRequestDetails);

        setLaundryToCustomerDeliveryOrderChatInfo(laundryOrder, laundryStore, toCustomerDeliveryOrder, customer);

        if(laundryStore.deliveryDetails.selfDelivery == false)
            notifyDeliveryDrivers(toCustomerDeliveryOrder);
        
        return {
            success: true
        }
    } catch(e: any) {
        if (e instanceof MezError) {
            if (Object.values(ReqDeliveryError).includes(e.message as any)) {
                return {
                    success: false,
                    error: e.message as any
                }
            } else {
                return {
                    success: false,
                    error: ReqDeliveryError.UnhandledError,
                    unhandledError: e.message as any
                }
            }
        } else {
            throw e
        }
    }
}

function errorChecks(laundryOrder: LaundryOrder, customerId: number) {

    if(laundryOrder.customerId != customerId) {
        throw new MezError(ReqDeliveryError.IncorrectOrderId);
    }
    if(laundryOrder.status != LaundryOrderStatus.ReadyForDelivery) {
        throw new MezError(ReqDeliveryError.IncorrectOrderStatus);
    }
    // if(laundryOrder.fromCustomerDeliveryId == undefined) {
    //     throw new MezError(ReqLaundryError.NoPreviousDeliveryOrder);
    // }
}