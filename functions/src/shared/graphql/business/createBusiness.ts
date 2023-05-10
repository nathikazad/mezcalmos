import { BusinessDetails, BusinessError } from "../../../business/createNewBusiness";
import { getHasura } from "../../../utilities/hasura";
import { DeepLinkType, IDeepLink, generateDeepLinks } from "../../../utilities/links/deeplink";
import { AppType, AuthorizationStatus, MezError } from "../../models/Generic/Generic";
import { Business } from "../../models/Services/Business/Business";
import { ServiceProviderType } from "../../models/Services/Service";


export async function createBusiness(businessDetails: BusinessDetails, businessOperatorUserId: number): Promise<Business> {
    let chain = getHasura();

    let uniqueId: string = businessDetails.uniqueId ?? generateString();

    let linksResponse: Record<DeepLinkType, IDeepLink> = await generateDeepLinks(uniqueId, AppType.Business)

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
                        firebase_id: businessDetails.firebaseId ?? undefined,
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
                        service_link: {
                            data: {
                                customer_deep_link: linksResponse[DeepLinkType.Customer].url,
                                customer_qr_image_link: linksResponse[DeepLinkType.Customer].urlQrImage,
                                operator_deep_link: linksResponse[DeepLinkType.AddOperator].url,
                                operator_qr_image_link: linksResponse[DeepLinkType.AddOperator].urlQrImage,
                                driver_deep_link: linksResponse[DeepLinkType.AddDriver].url,
                                driver_qr_image_link: linksResponse[DeepLinkType.AddDriver].urlQrImage,
                              }
                        }
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

function generateString(): string {
    let result = '';
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const charactersLength = characters.length;
    let counter = 0;
    while (counter < 8) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
      counter += 1;
    }
    return result;
  }
  