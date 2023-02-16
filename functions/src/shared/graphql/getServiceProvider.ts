import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../utilities/hasura";
import { AuthorizationStatus, AppType, Language } from "../models/Generic/Generic";
import { ServiceProvider, Operator, OpenStatus, ServiceProviderType } from "../models/Services/Service";


export async function getServiceProviderDetails(serviceProviderDetailsId: number): Promise<ServiceProvider> {
    let chain = getHasura();

    let response = await chain.query({
        service_provider_details_by_pk: [{
        id: serviceProviderDetailsId
        },{
            name: true,
            description: {
                translations: [{ }, {
                    language_id: true,
                    value: true
                }]
            },
            image: true,
            phone_number: true,
            open_status: true,     
            approved: true,
            creation_time: true,
            schedule: [{}, true],
            stripe_info: {
                stripe_id: true,
                status: true,
                charge_fees_on_customer: true,
                charges_enabled: true,
                payouts_enabled: true,
                details_submitted: true,
                //requirements
                email: true,
            },
            accepted_payments: [{}, true],
            language: [{}, true],
            location: {
                gps: true,
                address: true,
            },
            service_provider_type: true,
            restaurant: {
                id: true,
                delivery_details: {
                    customer_pickup: true,
                    self_delivery: true,
                    delivery_available: true
                },
                restaurant_operators: [{}, {
                    id: true,
                    user_id: true,
                    restaurant_id: true,
                    operator_details: {
                    status: true,
                    owner: true,
                    notification_info: {
                        token: true,
                        turn_off_notifications: true
                    }
                    },
                    user: {
                        firebase_id: true,
                        language_id: true,
                        name: true,
                        email: true,
                        phone: true,
                    }
                }],
            },
            laundry_store: {
                id: true,
                delivery_details: {
                    customer_pickup: true,
                    self_delivery: true,
                    delivery_available: true
                },
                operators: [{}, {
                    id: true,
                    user_id: true,
                    store_id: true,
                    operator_details: {
                    status: true,
                    owner: true,
                    notification_info: {
                        token: true,
                        turn_off_notifications: true
                    }
                    },
                    user: {
                        firebase_id: true,
                        language_id: true,
                        name: true,
                        email: true,
                        phone: true,
                    }
                }],
            }
        }]
    });
    if(response.service_provider_details_by_pk == null) {
        throw new HttpsError(
            "internal",
            "No service provider with that id found"
        );
    }
    switch (response.service_provider_details_by_pk.service_provider_type) {
        case ServiceProviderType.Restaurant:
            let operators: Operator[] = response.service_provider_details_by_pk.restaurant!.restaurant_operators.map((r): Operator => {
                return {
                    id: r.id,
                    userId: r.user_id,
                    serviceProviderId: r.restaurant_id,
                    status: r.operator_details.status as AuthorizationStatus,
                    owner: r.operator_details.owner,
                    notificationInfo: (r.operator_details.notification_info) ? {
                        appType: AppType.RestaurantApp,
                        token: r.operator_details.notification_info.token,
                        turnOffNotifications: r.operator_details.notification_info.turn_off_notifications
                    } : undefined,
                    user: {
                        id: r.user_id,
                        firebaseId: r.user.firebase_id,
                        language: r.user.language_id as Language,
                        name: r.user.name,
                        email: r.user.email,
                        phoneNumber: r.user.phone,
                    }
                }
            });
            return {
                id: response.service_provider_details_by_pk.restaurant!.id,
                serviceProviderDetailsId,
                serviceProviderType: response.service_provider_details_by_pk.service_provider_type,
                name: response.service_provider_details_by_pk.name,
                image: response.service_provider_details_by_pk.image,
                phoneNumber: response.service_provider_details_by_pk.phone_number,
                location: {
                    address: response.service_provider_details_by_pk.location?.address,
                    lat : response.service_provider_details_by_pk.location?.gps.coordinates[1],
                    lng: response.service_provider_details_by_pk.location?.gps.coordinates[0]
                },
                description: response.service_provider_details_by_pk.description?.translations.reduce((prev:Record<any, any>, current) => {
                prev[current.language_id] = current.value;
                return prev;
                }, {}),
                schedule: JSON.parse(response.service_provider_details_by_pk.schedule),
                creationTime: response.service_provider_details_by_pk.creation_time,
                openStatus: response.service_provider_details_by_pk.open_status as OpenStatus,
                approved: response.service_provider_details_by_pk.approved,
                stripeInfo: (response.service_provider_details_by_pk.stripe_info) 
                ? {
                    id: response.service_provider_details_by_pk.stripe_info.stripe_id,
                    status: response.service_provider_details_by_pk.stripe_info.status,
                    chargeFeesOnCustomer: response.service_provider_details_by_pk.stripe_info.charge_fees_on_customer ?? null,
                    chargesEnabled: response.service_provider_details_by_pk.stripe_info.charges_enabled,
                    detailsSubmitted: response.service_provider_details_by_pk.stripe_info.details_submitted,
                    payoutsEnabled: response.service_provider_details_by_pk.stripe_info.payouts_enabled,
                    email: response.service_provider_details_by_pk.stripe_info.email ?? null,
                    //requirements
                }: undefined,
                acceptedPayments: JSON.parse(response.service_provider_details_by_pk.accepted_payments),
                operators,
                // deliveryPartnerId: response.service_provider_details_by_pk.restaurant.delivery_partners[0] 
                // ? response.service_provider_details_by_pk.restaurant.delivery_partners[0].delivery_company_id
                // : undefined,
                language: /*JSON.parse(*/response.service_provider_details_by_pk.language,
                deliveryDetails: {
                    // costPerKm: response.service_provider_details_by_pk.restaurant.delivery_details.cost_per_km,
                    // freeDeliveryKmRange: response.service_provider_details_by_pk.restaurant.delivery_details.free_delivery_km_range,
                    // freeDeliveryMinimumCost: response.service_provider_details_by_pk.restaurant.delivery_details.free_delivery_minimum_cost,
                    // minimumCost: response.service_provider_details_by_pk.restaurant.delivery_details.minimum_cost,
                    // radius: response.service_provider_details_by_pk.restaurant.delivery_details.radius,
                    customerPickup: response.service_provider_details_by_pk.restaurant!.delivery_details.customer_pickup,
                    deliveryAvailable: response.service_provider_details_by_pk.restaurant!.delivery_details.delivery_available,
                    selfDelivery: response.service_provider_details_by_pk.restaurant!.delivery_details.self_delivery
                }
            }
        case ServiceProviderType.Laundry:
            let laundryOperators: Operator[] = response.service_provider_details_by_pk.laundry_store!.operators.map((o) => {
                return {
                    id: o.id,
                    serviceProviderId: o.store_id,
                    userId: o.user_id,
                    status: o.operator_details.status as AuthorizationStatus,
                    user: {
                        id: o.user_id,
                        firebaseId: o.user.firebase_id,
                        language: o.user.language_id as Language
                    }
                }
            })
            return {
                id: response.service_provider_details_by_pk.laundry_store!.id,
                serviceProviderDetailsId,
                serviceProviderType: response.service_provider_details_by_pk.service_provider_type,
                name: response.service_provider_details_by_pk.name,
                image: response.service_provider_details_by_pk.image,
                location: {
                    lat: response.service_provider_details_by_pk.location.gps.coordinates[1],
                    lng: response.service_provider_details_by_pk.location.gps.coordinates[0],
                    address: response.service_provider_details_by_pk.location.address,
                },
                description: response.service_provider_details_by_pk.description?.translations.reduce((prev:Record<any, any>, current) => {
                    prev[current.language_id] = current.value;
                    return prev;
                }, {}),
                openStatus: response.service_provider_details_by_pk.open_status as OpenStatus,
                stripeInfo: (response.service_provider_details_by_pk.stripe_info) 
                ? {
                    id: response.service_provider_details_by_pk.stripe_info.stripe_id,
                    status: response.service_provider_details_by_pk.stripe_info.status,
                    chargeFeesOnCustomer: response.service_provider_details_by_pk.stripe_info.charge_fees_on_customer ?? null,
                    chargesEnabled: response.service_provider_details_by_pk.stripe_info.charges_enabled,
                    detailsSubmitted: response.service_provider_details_by_pk.stripe_info.details_submitted,
                    payoutsEnabled: response.service_provider_details_by_pk.stripe_info.payouts_enabled,
                    email: response.service_provider_details_by_pk.stripe_info.email ?? null,
                    //requirements
                }: undefined,
                acceptedPayments: JSON.parse(response.service_provider_details_by_pk.accepted_payments),
                approved: response.service_provider_details_by_pk.approved,
                creationTime: response.service_provider_details_by_pk.creation_time,
                language: /*JSON.parse(*/response.service_provider_details_by_pk.language,
                schedule: JSON.parse(response.service_provider_details_by_pk.schedule),
                deliveryDetails: {
                    // costPerKm: response.laundry_store_by_pk.delivery_details.cost_per_km,
                    // freeDeliveryKmRange: response.laundry_store_by_pk.delivery_details.free_delivery_km_range,
                    // freeDeliveryMinimumCost: response.laundry_store_by_pk.delivery_details.free_delivery_minimum_cost,
                    // minimumCost: response.laundry_store_by_pk.delivery_details.minimum_cost,
                    // radius: response.laundry_store_by_pk.delivery_details.radius,
                    customerPickup: response.service_provider_details_by_pk.laundry_store!.delivery_details.customer_pickup,
                    deliveryAvailable: response.service_provider_details_by_pk.laundry_store!.delivery_details.delivery_available,
                    selfDelivery: response.service_provider_details_by_pk.laundry_store!.delivery_details.self_delivery
                },
                operators: laundryOperators,
                // deliveryPartnerId: response.laundry_store_by_pk.delivery_partners[0] 
                //     ? response.laundry_store_by_pk.delivery_partners[0].delivery_company_id
                //     : undefined,
            }
        default:
            throw new HttpsError(
                "internal",
                "Invalid service provider type"
            );
            
    }
}