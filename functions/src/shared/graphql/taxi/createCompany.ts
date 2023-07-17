import { $, notification_info_constraint, notification_info_update_column } from "../../../../../hasura/library/src/generated/graphql-zeus";
import { TaxiCompanyDetails, } from "../../../taxi/createTaxiCompany";
import { getHasura } from "../../../utilities/hasura";
import { DeepLinkType, generateDeepLinks, IDeepLink } from "../../../utilities/links/deeplink";
import { AppType, AuthorizationStatus, MezError } from "../../models/Generic/Generic";
import { ServiceProvider, ServiceProviderType } from "../../models/Services/Service";
import { PaymentType } from '../../models/Generic/Order';
import { QRFlyerLinks, createQRFlyerPDF } from "../../../utilities/links/flyer";
import { TaxiCompany } from "../../models/Services/Taxi/Taxi";


export async function createNewTaxiCompany(
    taxiCompanyDetails: TaxiCompanyDetails,
    taxiOperatorUserId: number
): Promise<TaxiCompany> {
  let chain = getHasura();

  if(taxiCompanyDetails.uniqueId) {
    let queryResponse = await chain.query({
        service_provider_details: [{
            where: {
                unique_id: {
                    _eq: taxiCompanyDetails.uniqueId
                }
            }
        }, {
            id: true,
        }]
    });
    if(queryResponse.service_provider_details.length) {
        throw new MezError(TaxiCompanyError.UniqueIdAlreadyExists);
    }
  }
  if(taxiCompanyDetails.phoneNumber.length == 10) {
    taxiCompanyDetails.phoneNumber = `+52${taxiCompanyDetails.phoneNumber}`;
}
  let uniqueId: string = taxiCompanyDetails.uniqueId ?? generateString();

  let linksResponse: Partial<Record<DeepLinkType, IDeepLink>> = await generateDeepLinks(uniqueId, AppType.TaxiAdmin)
  let QRflyer: QRFlyerLinks = await createQRFlyerPDF(uniqueId);
  
  let response = await chain.mutation({
    insert_taxi_company_one: [{
      object: {
        details: {
          data: {
            name: taxiCompanyDetails.name,
            image: taxiCompanyDetails.image,
            phone_number: taxiCompanyDetails.phoneNumber,
            schedule: $`schedule`,
            firebase_id: taxiCompanyDetails.firebaseId ?? undefined,
            language: $`language`,
            service_provider_type: ServiceProviderType.Taxi,
            unique_id: uniqueId,
            accepted_payments: $`accepted_payments`,
            location: {
              data: {
                gps: $`gps`,
                address: taxiCompanyDetails.location.address
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
            user_id: taxiOperatorUserId,
            operator_details: {
              data: {
                owner: true,
                status: AuthorizationStatus.Authorized,
                user_id: taxiOperatorUserId,
                app_type_id: AppType.TaxiAdmin,
              }
            },
          }]
        }
      }
    }, {
      id: true,
      details_id: true,
      operators: [{}, {
        id: true
      }]
    }]
  }, {
    "schedule": taxiCompanyDetails.schedule,
    "language": taxiCompanyDetails.language,
    "accepted_payments":<Record<PaymentType, boolean>>{
      [PaymentType.Cash]: true,
      [PaymentType.Card]: false,
      [PaymentType.BankTransfer]: false,
    },
    "gps": {
      "type": "Point",
      "coordinates": [taxiCompanyDetails.location.lng, taxiCompanyDetails.location.lat]
    },
    "customer_flyer_links": QRflyer.flyerLinks
  })
  console.log("response: ", response);

  if (response.insert_taxi_company_one == null) {

    throw new MezError(TaxiCompanyError.RestaurantCreationError);
  }
  if(taxiCompanyDetails.taxiOperatorNotificationToken) {
    chain.mutation({
      insert_notification_info_one: [{
        object: {
          app_type_id: AppType.TaxiAdmin,
          token: taxiCompanyDetails.taxiOperatorNotificationToken,
          user_id: taxiOperatorUserId
        },
        on_conflict: {
          constraint: (
            notification_info_constraint.notification_info_app_type_id_user_id_key
          ),
          update_columns: [notification_info_update_column.token]
        }
      }, {
        id: true
      }]
    })
  }
  return {
    id: response.insert_taxi_company_one.id,
    details: {
      id: response.insert_taxi_company_one.id,
      serviceProviderDetailsId: response.insert_taxi_company_one.details_id,
      name: taxiCompanyDetails.name,
      image: taxiCompanyDetails.image,
      location: taxiCompanyDetails.location,
      schedule: taxiCompanyDetails.schedule,
      language: taxiCompanyDetails.language,
      firebaseId: taxiCompanyDetails.firebaseId,
      serviceProviderType: ServiceProviderType.Taxi,
      uniqueId
    },
    costPerKm: taxiCompanyDetails.costPerKm,
    minimumCost: taxiCompanyDetails.minimumCost,
  };
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
