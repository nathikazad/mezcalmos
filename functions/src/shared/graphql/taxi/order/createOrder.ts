import { $ } from "../../../../../../hasura/library/src/generated/graphql-zeus";
import { TaxiRequestDetails, TaxiRequestError } from "../../../../taxi/request";
import { getHasura } from "../../../../utilities/hasura";
import { AppType, MezError } from "../../../models/Generic/Generic";
import { MezAdmin } from "../../../models/Generic/User";
import { TaxiOrder, TaxiOrderStatus } from "../../../models/Services/Taxi/TaxiOrder";

export async function createNewTaxiOrder(
    customerId: number,
    taxiRequestDetails: TaxiRequestDetails,
    mezAdmins: MezAdmin[]
): Promise<TaxiOrder> {

    let chain = getHasura();

    let mezAdminDetails = mezAdmins!.map((v) => {
        return {
            participant_id: v.id,
            app_type_id: AppType.MezAdmin
        };
    });
    let params: any = {
        "to_location_gps": {
            "type": "Point",
            "coordinates": [taxiRequestDetails.toLocation.lng, taxiRequestDetails.toLocation.lat],
        },
        "chosen_companies": taxiRequestDetails.chosenCompanies,
        "from_location_gps": [taxiRequestDetails.fromLocation.lng, taxiRequestDetails.fromLocation.lat]
    }

    let response = await chain.mutation({
        insert_taxi_order_one: [{
            object: {
                from_location_gps:  $`from_location_gps`,
                from_location_text: taxiRequestDetails.fromLocation.address,
                to_location_address: taxiRequestDetails.toLocation.address,
                to_location_gps: $`to_location_gps`,
                customer_id: customerId,
                status: TaxiOrderStatus.OrderReceived,
                payment_type: taxiRequestDetails.paymentType,
                tax: taxiRequestDetails.tax ?? undefined,
                stripe_fees: taxiRequestDetails.stripeFees ?? undefined,
                discount_value: taxiRequestDetails.discountValue ?? undefined,
                customer_app_type: taxiRequestDetails.customerAppType,
                refund_amount: taxiRequestDetails.refundAmount ?? undefined,
                chat: {
                    data: {
                        chat_participants: {
                            data: [{
                                participant_id: customerId,
                                app_type_id: AppType.Customer
                            },
                            ...mezAdminDetails]
                        }
                    }
                },
                cost: taxiRequestDetails.customerOffer,
                trip_distance: taxiRequestDetails.tripDistance,
                trip_duration: taxiRequestDetails.tripDuration,
                trip_polyline: taxiRequestDetails.tripPolyline,
                schedule_time: taxiRequestDetails.scheduledTime,
                chosen_companies: $`chosen_companies`,
            }
        }, {
            id: true,
            order_time: true,
            chat_id: true,
        }]
    }, params);
    if (response.insert_taxi_order_one == null) {
        throw new MezError(TaxiRequestError.OrderCreationError);
    }

    return {
        id: response.insert_taxi_order_one.id,
        fromLocation: taxiRequestDetails.fromLocation,
        toLocation: taxiRequestDetails.toLocation,
        customerId,
        status: TaxiOrderStatus.OrderReceived,
        paymentType: taxiRequestDetails.paymentType,
        tax: taxiRequestDetails.tax,
        stripeFees: taxiRequestDetails.stripeFees,
        discountValue: taxiRequestDetails.discountValue,
        orderTime: response.insert_taxi_order_one.order_time,
        customerAppType: taxiRequestDetails.customerAppType,
        refundAmount: taxiRequestDetails.refundAmount ?? 0,
        chatId: response.insert_taxi_order_one.chat_id,
        cost: taxiRequestDetails.customerOffer,
        tripDistance: taxiRequestDetails.tripDistance,
        tripDuration: taxiRequestDetails.tripDuration,
        tripPolyline: taxiRequestDetails.tripPolyline,
        scheduledTime: taxiRequestDetails.scheduledTime,
        chosenCompanies: taxiRequestDetails.chosenCompanies,
        notifiedDrivers: {},
        counterOffers: {}
    }
}