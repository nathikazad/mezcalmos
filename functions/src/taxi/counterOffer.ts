import { getTaxiDriver } from "../shared/graphql/taxi/driver/getTaxiDriver";
import { getTaxiOrder } from "../shared/graphql/taxi/order/getTaxiOrder";
import { updateTaxiCounterOffers } from "../shared/graphql/taxi/order/updateOrder";
import { counterOfferErrorCheck, notifyCounterOffer } from "../shared/helper";
import { MezError } from "../shared/models/Generic/Generic";
import { CounterOfferError, CounterOfferResponse, CounterOfferStatus, OrderType } from "../shared/models/Generic/Order";
import { TaxiDriver } from "../shared/models/Services/Taxi/Taxi";
import { TaxiOrder } from "../shared/models/Services/Taxi/TaxiOrder";

export interface TaxiCounterOfferRequest {
    orderId: number,
    driverId: number,
    newPrice: number,
}
export async function requestTaxiCounterOffer(userId: number, counterOfferRequest: TaxiCounterOfferRequest): Promise<CounterOfferResponse> {
    try {
        let order: TaxiOrder = await getTaxiOrder(counterOfferRequest.orderId);
        let driver: TaxiDriver = await getTaxiDriver(counterOfferRequest.driverId);

        counterOfferErrorCheck(order, driver, userId);

        order.counterOffers = order.counterOffers || {};
        order.counterOffers[driver.id] = {
            price: counterOfferRequest.newPrice,
            name: driver.user?.name ,
            image : driver.user?.image,
            status: CounterOfferStatus.Requested,
            time: (new Date()).toISOString(),
            expiryTime: (new Date(Date.now() + 1000 * 60 * 5)).toISOString(),
        }
        
        updateTaxiCounterOffers(order);

        notifyCounterOffer(OrderType.Taxi, order.customerId, order.id);
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