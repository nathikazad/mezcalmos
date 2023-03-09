import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { Language } from "../../models/Generic/Generic";
import { OpenStatus, Operator, ServiceProvider, ServiceProviderType } from "../../models/Services/Service";
import { AuthorizationStatus } from "../../models/Generic/Generic"

export async function getLaundryStore(storeId: number): Promise<ServiceProvider> {
    let chain = getHasura();

    let response = await chain.query({
        laundry_store_by_pk: [{
            id: storeId
        }, {
            id: true,
            details_id: true,
            delivery_details: {
                self_delivery: true,
                delivery_available: true,
                customer_pickup: true,
                minimum_cost: true,
                cost_per_km: true,
                radius: true,
                free_delivery_minimum_cost: true,
                free_delivery_km_range: true,
            },
            delivery_partners: [{}, {
                delivery_company_id: true
            }],
            details: {
                name: true,
                image: true,
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
                accepted_payments: [{}, true],
                approved: true,
                creation_time: true,
                language: [{}, true],
                schedule: [{}, true],
                stripe_info: {
                    stripe_id: true,
                    status: true,
                    charge_fees_on_customer: true,
                    charges_enabled: true,
                    details_submitted: true,
                    email: true,
                    payouts_enabled :true,
                    // requirements
                },

            },
            operators: [{}, {
                id: true,
                details_id: true,
                store_id: true,
                user_id: true,
                operator_details: {
                    status: true,
                    online: true,
                },
                user: {
                    firebase_id: true,
                    language_id: true
                }
            }]
        }]
    });
    if(response.laundry_store_by_pk == null || response.laundry_store_by_pk.details == null) {
        throw new HttpsError(
            "internal",
            "No laundry store with that id found"
        );
    }
    let laundryOperators: Operator[] = response.laundry_store_by_pk.operators.map((o) => {
        return {
            id: o.id,
            serviceProviderId: o.store_id,
            userId: o.user_id,
            detailsId: o.details_id,
            status: o.operator_details.status as AuthorizationStatus,
            online: o.operator_details.online,
            user: {
                id: o.user_id,
                firebaseId: o.user.firebase_id,
                language: o.user.language_id as Language
            }
        }
    })

    return {
        id: storeId,
        serviceProviderDetailsId: response.laundry_store_by_pk.details_id,
        name: response.laundry_store_by_pk.details.name,
        image: response.laundry_store_by_pk.details.image,
        location: {
            lat: response.laundry_store_by_pk.details.location.gps.coordinates[1],
            lng: response.laundry_store_by_pk.details.location.gps.coordinates[0],
            address: response.laundry_store_by_pk.details.location.address,
        },
        description: response.laundry_store_by_pk.details.description?.translations.reduce((prev:Record<any, any>, current) => {
            prev[current.language_id] = current.value;
            return prev;
        }, {}),
        openStatus: response.laundry_store_by_pk.details.open_status as OpenStatus,
        stripeInfo: (response.laundry_store_by_pk.details.stripe_info) 
        ? {
            id: response.laundry_store_by_pk.details.stripe_info.stripe_id,
            status: response.laundry_store_by_pk.details.stripe_info.status,
            chargeFeesOnCustomer: response.laundry_store_by_pk.details.stripe_info.charge_fees_on_customer ?? null,
            chargesEnabled: response.laundry_store_by_pk.details.stripe_info.charges_enabled,
            detailsSubmitted: response.laundry_store_by_pk.details.stripe_info.details_submitted,
            payoutsEnabled: response.laundry_store_by_pk.details.stripe_info.payouts_enabled,
            email: response.laundry_store_by_pk.details.stripe_info.email ?? null,
            //requirements
        }: undefined,
        acceptedPayments: JSON.parse(response.laundry_store_by_pk.details.accepted_payments),
        approved: response.laundry_store_by_pk.details.approved,
        creationTime: response.laundry_store_by_pk.details.creation_time,
        language: /*JSON.parse(*/response.laundry_store_by_pk.details.language,
        schedule: JSON.parse(response.laundry_store_by_pk.details.schedule),
        deliveryDetails: {
            costPerKm: response.laundry_store_by_pk.delivery_details.cost_per_km,
            freeDeliveryKmRange: response.laundry_store_by_pk.delivery_details.free_delivery_km_range,
            freeDeliveryMinimumCost: response.laundry_store_by_pk.delivery_details.free_delivery_minimum_cost,
            minimumCost: response.laundry_store_by_pk.delivery_details.minimum_cost,
            radius: response.laundry_store_by_pk.delivery_details.radius,
            customerPickup: response.laundry_store_by_pk.delivery_details.customer_pickup,
            deliveryAvailable: response.laundry_store_by_pk.delivery_details.delivery_available,
            selfDelivery: response.laundry_store_by_pk.delivery_details.self_delivery
        },
        operators: laundryOperators,
        deliveryPartnerId: response.laundry_store_by_pk.delivery_partners[0] 
            ? response.laundry_store_by_pk.delivery_partners[0].delivery_company_id
            : undefined,
        serviceProviderType: ServiceProviderType.Laundry
    }
}