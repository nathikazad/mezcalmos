import { BusinessDetails, BusinessError } from "../../../business/createNewBusiness";
import { getHasura } from "../../../utilities/hasura";
import { AppType, AuthorizationStatus, MezError } from "../../models/Generic/Generic";
import { Business } from "../../models/Services/Business/Business";
import { ServiceProviderType } from "../../models/Services/Service";


export async function createBusiness(businessDetails: BusinessDetails, businessOperatorUserId: number): Promise<Business> {
    let chain = getHasura();

    let response = await chain.mutation({
        insert_business_business_one: [{
            object: {
                profile: businessDetails.profile,
                details: {
                    data: {
                        name: businessDetails.name,
                        image: businessDetails.image,
                        language: JSON.stringify(businessDetails.language),
                        service_provider_type: ServiceProviderType.Business,
                        schedule: JSON.stringify(businessDetails.schedule),
                        location: {
                            data: {
                                gps: JSON.stringify({
                                    "type": "point",
                                    "coordinates": [businessDetails.location.lng, businessDetails.location.lat]
                                }),
                                address: businessDetails.location.address
                            }
                        },
                    }
                },
                operators: {
                    data: [{
                        user_id: businessOperatorUserId,
                        operator_details: {
                            data: {
                                user_id: businessOperatorUserId,
                                status: AuthorizationStatus.Authorized,
                                owner: true,
                                app_type_id: AppType.Business,
                            }
                        }
                    }]
                }
            }
        }, {
            service_provider_type: true,
            id: true,
            details_id: true
        }],
    });
    
    console.log("response: ", response);
    
    if(response.insert_business_business_one == null) {
        throw new MezError(BusinessError.BusinessCreationError);
    }
    let business: Business = {
        profile: businessDetails.profile,
        details: {
            id: response.insert_business_business_one.id,
            serviceProviderDetailsId: response.insert_business_business_one.details_id,
            name: businessDetails.name,
            image: businessDetails.image,
            location: businessDetails.location,
            schedule: businessDetails.schedule,
            deliveryDetails: {
                customerPickup: false,
                deliveryAvailable: false,
                selfDelivery: false
            },
            language: businessDetails.language,
            serviceProviderType: ServiceProviderType.Business
        }
    }
    if(businessDetails.businessOperatorNotificationToken) {
        chain.mutation({
            insert_notification_info_one: [{
                object: {
                    user_id: businessOperatorUserId,
                    app_type_id: AppType.Business,
                    token: businessDetails.businessOperatorNotificationToken
                }
            }, {
                id: true
            }]
        });
     }
    return business
}