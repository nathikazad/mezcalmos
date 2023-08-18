import { getHasura } from "../../../../utilities/hasura";
import { CustomerAppType, MezError } from "../../../models/Generic/Generic";
import { PaymentType } from "../../../models/Generic/Order";
import { TaxiOrder, TaxiOrderStatus } from "../../../models/Services/Taxi/TaxiOrder";
import { OrderStripeInfo } from "../../../models/stripe";

export async function getTaxiOrder(orderId: number): Promise<TaxiOrder> {
  let chain = getHasura();

    let response =  await chain.query({
        taxi_order_by_pk: [
            { id: orderId }, {
                chosen_companies: [{}, true],
                cost: true,
                counter_offers: [{}, true],
                current_gps: true,
                discount_value: true,
                driver_id: true,
                from_location_gps: true,
                from_location_text: true,
                notified_drivers: [{}, true],
                taxi_company: {
                    id: true,
                    cost_per_km: true,
                    maximum_delivery_distance: true,
                    minimum_cost: true,
                },
                customer_app_type: true,
                order_time: true,
                payment_type: true,
                refund_amount: true,
                status: true,
                stripe_info: [{}, true],
                to_location_text: true,
                to_location_gps: true,
                chat_id: true,
                // final_cost: true,
                customer: {
                    user_id: true,
                    user: {
                        firebase_id: true,
                        language_id: true,
                    },
                    app_version: true,
                },
            }
        ]
    })
    if(response.taxi_order_by_pk == null) {
        throw new MezError("orderNotFound");
    }

    let order: TaxiOrder = {
        id: orderId,
        fromLocation: {
            lat: response.taxi_order_by_pk.from_location_gps.coordinates[1],
            lng: response.taxi_order_by_pk.from_location_gps.coordinates[0],
            address: response.taxi_order_by_pk.from_location_text
        },
        toLocation: {
            lat: response.taxi_order_by_pk.to_location_gps.coordinates[1],
            lng: response.taxi_order_by_pk.to_location_gps.coordinates[0],
            address: response.taxi_order_by_pk.to_location_text
        },
        customerId: response.taxi_order_by_pk.customer.user_id,
        orderTime: response.taxi_order_by_pk.order_time,
        status: response.taxi_order_by_pk.status as TaxiOrderStatus,
        paymentType: response.taxi_order_by_pk.payment_type as PaymentType,
        discountValue: parseFloat(response.taxi_order_by_pk.discount_value.replace("$","")),
        customerAppType: response.taxi_order_by_pk.customer_app_type as CustomerAppType,
        refundAmount: parseFloat(response.taxi_order_by_pk.refund_amount.replace("$","")),
        cost: parseFloat(response.taxi_order_by_pk.cost.replace("$","")),
        driverId: response.taxi_order_by_pk.driver_id,
        stripeInfo: response.taxi_order_by_pk.stripe_info as OrderStripeInfo,
        taxiCompanyId: response.taxi_order_by_pk.taxi_company?.id,
        currentGps: {
            lat: response.taxi_order_by_pk.current_gps.coordinates[1],
            lng: response.taxi_order_by_pk.current_gps.coordinates[0],
            address: ""
        },
        notifiedDrivers: response.taxi_order_by_pk.notified_drivers,
        chosenCompanies: response.taxi_order_by_pk.chosen_companies,
        counterOffers: response.taxi_order_by_pk.counter_offers,
        chatId: response.taxi_order_by_pk.chat_id,
        // spDetailsId: response.taxi_order_by_pk.restaurant.details_id,
    }
    return order;
}