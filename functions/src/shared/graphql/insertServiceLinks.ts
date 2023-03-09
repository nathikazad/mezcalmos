import { getHasura } from "../../utilities/hasura";
import { DeepLinkType, generateDeepLinks } from "../../utilities/links/deeplink";
import { AppType } from "../models/Generic/Generic";
import { ServiceProviderType } from "../models/Services/Service";


export async function insertServiceLinks() {
    let chain = getHasura();

    let response = await chain.query({
        service_provider_details: [{}, {
            // name: true,
            unique_id: true,
            service_provider_type: true,
            service_link_id: true,
            id: true,
        }]
    })
    // console.log("response: ", response)

    for(let d of response.service_provider_details) {
        if(d.service_link_id)
            continue;

        // let uniqueId = d.name.split(" ").join("").slice(0, 8).toLowerCase();
        // if(d.name.includes("Lavander")) {
        //     uniqueId = d.name.split(" ")[1].slice(0, 8).toLowerCase();
        // }
        let appType: AppType
        switch (d.service_provider_type) {
            case ServiceProviderType.Restaurant:
                appType = AppType.RestaurantApp
                break;
            case ServiceProviderType.Laundry:
                appType = AppType.LaundryApp
                break;
            // case ServiceProviderType.DeliveryCompany:
            //     appType = AppType.
            //     break;
            default:
                appType = AppType.DeliveryAdmin
                break;
        }
        console.log("id: ", d.id)
        if(d.unique_id == null) {
            console.log("Error: unique id not found")
            break;
        }
        console.log(d.unique_id )
        let linksResponse = await generateDeepLinks(d.unique_id, appType);
        let insertLinkResponse = await chain.mutation({
            insert_service_provider_service_link_one: [{
                object: {
                    customer_deep_link: linksResponse[DeepLinkType.Customer].url,
                    customer_qr_image_link: linksResponse[DeepLinkType.Customer].urlQrImage,
                    operator_deep_link: linksResponse[DeepLinkType.AddOperator].url,
                    operator_qr_image_link: linksResponse[DeepLinkType.AddOperator].urlQrImage,
                    driver_deep_link: linksResponse[DeepLinkType.AddDriver].url,
                    driver_qr_image_link: linksResponse[DeepLinkType.AddDriver].urlQrImage,
                }
            }, {
                id: true,
            }]
        })
        if(insertLinkResponse.insert_service_provider_service_link_one == null) {
            console.log("Error in inserting link")
            break;
        }
        
        await chain.mutation({
            update_service_provider_details_by_pk: [{
                pk_columns: {
                    id: d.id
                },
                _set: {
                    // unique_id: uniqueId,
                    service_link_id: insertLinkResponse.insert_service_provider_service_link_one.id
                }
            }, {
                id: true,
                service_link_id: true
            }]
        })
        console.log(d.unique_id )
    }
}