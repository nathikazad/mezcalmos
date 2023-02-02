import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { Language } from "../../models/Generic/Generic";
import { Laundry } from "../../models/Services/Laundry/Laundry";
import { OpenStatus } from "../../models/Services/Service";

export async function getLaundryStore(storeId: number): Promise<Laundry> {
    let chain = getHasura();

    let response = await chain.query({
        laundry_store_by_pk: [{
            id: storeId
        }, {
            id: true,
            name: true,
            image: true,
            self_delivery: true,
            location: {
                gps: true,
                address: true,
            },
            description: {
                translations: [{}, {
                    language_id: true,
                    value: true
                }]
            },
            open_status: true,
            stripe_info: [{}, true],
            accepted_payments: [{}, true],
            approved: true,
            creation_time: true,
            language_id: true,
            schedule: [{}, true],
            delivery: true,
            customer_pickup: true,
            delivery_details: {
                minimum_cost: true,
                cost_per_km: true,
                radius: true,
                free_delivery_minimum_cost: true,
                free_delivery_km_range: true,
            }
        }]
    });
    if(response.laundry_store_by_pk == null) {
        throw new HttpsError(
            "internal",
            "No laundry store with that id found"
        );
    }
    return <Laundry> {
        id: storeId,
        name: response.laundry_store_by_pk.name,
        image: response.laundry_store_by_pk.image,
        selfDelivery: response.laundry_store_by_pk.self_delivery,
        location: {
            lat: response.laundry_store_by_pk.location.gps.coordinates[1],
            lng: response.laundry_store_by_pk.location.gps.coordinates[0],
            address: response.laundry_store_by_pk.location.address,
        },
        description: response.laundry_store_by_pk.description.translations.reduce((prev:Record<any, any>, current) => {
            prev[current.language_id] = current.value;
            return prev;
          }, {}),
        openStatus: response.laundry_store_by_pk.open_status as OpenStatus,
        stripeInfo: JSON.parse(response.laundry_store_by_pk.stripe_info),
        acceptedPayments: JSON.parse(response.laundry_store_by_pk.accepted_payments),
        approved: response.laundry_store_by_pk.approved,
        creationTime: response.laundry_store_by_pk.creation_time,
        language: response.laundry_store_by_pk.language_id as Language,
        schedule: JSON.parse(response.laundry_store_by_pk.schedule),
        delivery: response.laundry_store_by_pk.delivery,
        customerPickup: response.laundry_store_by_pk.customer_pickup,
        // deliveryDetails?: DeliveryDetails;
        // laundryOperators?: Array<LaundryOperator>
    }
}