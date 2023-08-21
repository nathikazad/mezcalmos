import { getDeliveryDriver } from "../shared/graphql/delivery/driver/getDeliveryDriver";
import { getDeliveryOrder } from "../shared/graphql/delivery/getDelivery";
import { updateDeliveryCounterOffers } from "../shared/graphql/delivery/updateDelivery";
import { counterOfferErrorCheck, notifyCounterOffer } from "../shared/helper";
import { DeliveryDriver, DeliveryOrder } from "../shared/models/Generic/Delivery";
import { MezError } from "../shared/models/Generic/Generic";
import { CounterOfferResponse, CounterOfferStatus, CounterOfferError } from "../shared/models/Generic/Order";

export interface DeliveryCounterOfferRequest {
    deliveryOrderId: number,
    deliveryDriverId: number,
    newPrice: number,
}

export async function requestDeliveryCounterOffer(userId: number, counterOfferRequest: DeliveryCounterOfferRequest): Promise<CounterOfferResponse> {
    try {
        let deliveryOrder: DeliveryOrder = await getDeliveryOrder(counterOfferRequest.deliveryOrderId);
        let deliveryDriver: DeliveryDriver = await getDeliveryDriver(counterOfferRequest.deliveryDriverId);

        counterOfferErrorCheck(deliveryOrder, deliveryDriver, userId);

        deliveryOrder.counterOffers = deliveryOrder.counterOffers || {};
        deliveryOrder.counterOffers[deliveryDriver.id] = {
            price: counterOfferRequest.newPrice,
            name: deliveryDriver.user?.name ,
            image : deliveryDriver.user?.image,
            status: CounterOfferStatus.Requested,
            time: (new Date()).toISOString(),
            expiryTime: (new Date(Date.now() + 1000 * 60 * 5)).toISOString(),
        }
        
        updateDeliveryCounterOffers(deliveryOrder);

        notifyCounterOffer(deliveryOrder.orderType, deliveryOrder.customerId, 0, deliveryOrder)
        return {
            success: true,
        }
    } catch(e: any) {
        if (e instanceof MezError) {
            if (Object.values(CounterOfferError).includes(e.message as any)) {
                return {
                    success: false,
                    error: e.message as any
                }
            } else {
                return {
                    success: false,
                    error: CounterOfferError.UnhandledError,
                    unhandledError: e.message as any
                }
            }
        } else {
        throw e
        }
    }
}
