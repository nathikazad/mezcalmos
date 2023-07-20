import { $ } from "../../../../../hasura/library/src/generated/graphql-zeus";
import { BusinessDetails, BusinessError } from "../../../business/createNewBusiness";
import { getHasura } from "../../../utilities/hasura";
import { QRFlyerLinks, createQRFlyerPDF } from "../../../utilities/links/flyer";
import { DeepLinkType, IDeepLink, generateDeepLinks } from "../../../utilities/links/deeplink";
import { AppType, AuthorizationStatus, MezError } from "../../models/Generic/Generic";
import { Business } from "../../models/Services/Business/Business";
import { ServiceProviderType } from "../../models/Services/Service";


export async function createBusiness(businessDetails: BusinessDetails, businessOperatorUserId: number): Promise<Business> {
    let chain = getHasura();

    if(businessDetails.uniqueId) {
        let queryResponse = await chain.query({
            service_provider_details: [{
                where: {
                    unique_id: {
                        _eq: businessDetails.uniqueId
                    }
                }
            }, {
                id: true,
            }]
        });
        if(queryResponse.service_provider_details.length) {
            throw new MezError(BusinessError.UniqueIdAlreadyExists);
        }
    }
    if(businessDetails.phoneNumber.length == 10) {
        businessDetails.phoneNumber = `+52${businessDetails.phoneNumber}`;
    }
    let uniqueId: string = businessDetails.uniqueId ?? generateString();

    let linksResponse: Partial<Record<DeepLinkType, IDeepLink>> = await generateDeepLinks(uniqueId, AppType.Business);
    let QRflyer: QRFlyerLinks = await createQRFlyerPDF(uniqueId);

    let response = await chain.mutation({
        insert_business_business_one: [{
            object: {
                profile: businessDetails.profile,
                details: {
                    data: {
                        name: businessDetails.name,
                        image: businessDetails.image,
                        phone_number: businessDetails.phoneNumber,
                        language: $`language` ,
                        service_provider_type: ServiceProviderType.Business,
                        unique_id: uniqueId,
                        schedule: $`schedule`,
                        location: {
                            data: {
                                gps: $`gps`,
                                address: businessDetails.location.address
                            }
                        },
                        service_link: {
                            data: {
                                customer_qr_image_link: QRflyer.customerQRImageLink,
                                operator_deep_link: linksResponse[DeepLinkType.AddOperator]?.url,
                                operator_qr_image_link: linksResponse[DeepLinkType.AddOperator]?.urlQrImage,
                                driver_deep_link: linksResponse[DeepLinkType.AddDriver]?.url,
                                driver_qr_image_link: linksResponse[DeepLinkType.AddDriver]?.urlQrImage,
                                customer_flyer_links: $`customer_flyer_links`,
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
    }, {
        "language": businessDetails.language,
        "schedule": businessDetails.schedule,
        "gps": {
            "type": "Point",
            "coordinates": [businessDetails.location.lng, businessDetails.location.lat]
        },
        "customer_flyer_links": QRflyer.flyerLinks
    });
    
    console.log("response: ", response);
    
    if(response.insert_business_business_one == null) {
        throw new MezError(BusinessError.BusinessCreationError);
    }
    let business: Business = {
        id: response.insert_business_business_one.id,
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
  