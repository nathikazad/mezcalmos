import { getHasura } from "../../../utilities/hasura";
import { Language, MezError } from "../../models/Generic/Generic";
import { OpenStatus, Operator, ServiceProviderType } from "../../models/Services/Service";
import { AuthorizationStatus } from "../../models/Generic/Generic"
import { Business, BusinessProfile } from "../../models/Services/Business/Business";

export async function getBusiness(businessId: number): Promise<Business> {
    let chain = getHasura();

    let response = await chain.query({
        business_business_by_pk: [{
            id: businessId
        }, {
            id: true,
            profile: true,
            details_id: true,
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
                approved: true,
                creation_time: true,
                language: [{}, true],
            },
            operators: [{}, {
                id: true,
                details_id: true,
                user_id: true,
                operator_details: {
                    status: true,
                    online: true
                },
                user: {
                    firebase_id: true,
                    language_id: true
                }
            }]
        }],
        
    });
    if(response.business_business_by_pk == null || response.business_business_by_pk.details == null) {
        throw new MezError("businessNotFound");
    }
    let businessOperators: Operator[] = response.business_business_by_pk.operators.map((o:any) => {
        return {
            id: o.id,
            serviceProviderId: businessId,
            userId: o.user_id,
            detailsId: o.details_id,
            online: o.operator_details.online,
            status: o.operator_details.status as AuthorizationStatus,
            user: {
                id: o.user_id,
                firebaseId: o.user.firebase_id,
                language: o.user.language_id as Language
            }
        }
    })

    return {
        profile: response.business_business_by_pk.profile as BusinessProfile,
        details: {
            id: businessId,
            serviceProviderDetailsId: response.business_business_by_pk.details_id,
            name: response.business_business_by_pk.details.name,
            image: response.business_business_by_pk.details.image,
            serviceProviderType: ServiceProviderType.Business,
            location: {
                lat: response.business_business_by_pk.details.location.gps.coordinates[1],
                lng: response.business_business_by_pk.details.location.gps.coordinates[0],
                address: response.business_business_by_pk.details.location.address,
            },
            description: response.business_business_by_pk.details.description?.translations.reduce((prev:Record<any, any>, current: any) => {
                prev[current.language_id] = current.value;
                return prev;
            }, {}),
            openStatus: response.business_business_by_pk.details.open_status as OpenStatus,
            approved: response.business_business_by_pk.details.approved,
            creationTime: response.business_business_by_pk.details.creation_time,
            language: /*JSON.parse(*/response.business_business_by_pk.details.language,
            deliveryDetails: {
                customerPickup: false,
                deliveryAvailable: false,
                selfDelivery: false
            },
            operators: businessOperators,
        }
    }
}