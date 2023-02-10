import { HttpsError } from "firebase-functions/v1/https";
import { getHasura } from "../../../utilities/hasura";
import { ServiceLink, ServiceProviderType } from "../../models/Services/Service";


export async function getRestaurantLinks(restaurantId: number): Promise<ServiceLink|null> {
    let chain = getHasura();
  
    let response = await chain.query({
      service_provider_service_link: [{
        where: {
            service_provider_id: {
              _eq: restaurantId
            }
          }
      }, {
        id :true,
        driver_deep_link :true,
        driver_qr_image_link :true,
        operator_deep_link: true,
        operator_qr_image_link: true,
        service_provider_id: true,
        service_provider_type:true,
      }],
     
    });
  
    if(response.service_provider_service_link == null ) {
      throw new HttpsError(
        "internal",
        "No serviceLink with that id found"
      );
    } else if (response.service_provider_service_link.length == 0) {
        console.log("No service found for this particular service provider ", restaurantId);
        return null;
    } else {
        let serviceLink: ServiceLink = {
        id: response.service_provider_service_link[0].id,
        serviceProviderId: response.service_provider_service_link[0].service_provider_id,
        serviceProviderType: response.service_provider_service_link[0].service_provider_type as ServiceProviderType,
        driverDeepLink: response.service_provider_service_link[0].driver_deep_link,
        driverQrImageLink: response.service_provider_service_link[0].driver_qr_image_link,
        operatorDeepLink: response.service_provider_service_link[0].operator_deep_link,
        operatorQrImageLink: response.service_provider_service_link[0].operator_qr_image_link,
        
        }
        return serviceLink;
    }
  
 
    
  }
  