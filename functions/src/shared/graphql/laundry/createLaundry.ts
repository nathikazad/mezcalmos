import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { AppType } from "../../models/Generic/Generic";
import { ServiceProvider, ServiceProviderType } from "../../models/Services/Service";
import { AuthorizationStatus } from "../../models/Generic/Generic"

export async function createLaundryStore(
    laundryStore: ServiceProvider, 
    laundryOperatorUserId: number, 
    laundryOperatorNotificationToken?: string 
) {
    let chain = getHasura();
  
    let response = await chain.mutation({
        insert_laundry_store_one: [{
            object: {
                name: laundryStore.name,
                
                image: laundryStore.image,
                schedule: JSON.stringify(laundryStore.schedule),
                firebase_id: laundryStore.firebaseId ?? undefined,
                self_delivery: laundryStore.selfDelivery,
                delivery: laundryStore.delivery,
                customer_pickup: laundryStore.customerPickup,
                location: {
                    data: {
                        gps: JSON.stringify({
                            "type": "point",
                            "coordinates": [laundryStore.location.lng, laundryStore.location.lat]
                        }),
                        address: laundryStore.location.address
                    }
                },
                delivery_details: 
                    (laundryStore.deliveryDetails) ? { data:  {
                        minimum_cost: laundryStore.deliveryDetails.minimumCost,
                        cost_per_km: laundryStore.deliveryDetails.costPerKm,
                        radius: laundryStore.deliveryDetails.radius,
                        free_delivery_minimum_cost: laundryStore.deliveryDetails.freeDeliveryMinimumCost,
                        free_delivery_km_range: laundryStore.deliveryDetails.freeDeliveryKmRange
                    }} : undefined,
                operators: {
                    data: [{
                        user_id: laundryOperatorUserId,
                        status: AuthorizationStatus.Authorized,
                        owner: true,
                    }]
                },
                
            }
        }, {
            service_provider_type : true,
            id: true
        }],
    });
  
    console.log("response: ", response);
  
    if(response.insert_laundry_store_one == null) {
      throw new HttpsError(
        "internal",
        "laundry creation error"
      );
    }
    if(laundryStore.deliveryPartnerId) {
        await chain.mutation({
            insert_service_provider_delivery_partner_one: [{
                object: {
                    delivery_company_id: laundryStore.deliveryPartnerId,
                    service_provider_id: response.insert_laundry_store_one.id,
                    service_provider_type: ServiceProviderType.Laundry
                }
            }, {
                id: true,
            }]
        });
    }
    if(laundryOperatorNotificationToken) {
        chain.mutation({
            insert_notification_info_one: [{
                object: {
                    user_id: laundryOperatorUserId,
                    app_type_id: AppType.LaundryApp,
                    token: laundryOperatorNotificationToken
                }
            }, {
                id: true
            }]
        });
     }
    laundryStore.id = response.insert_laundry_store_one.id
}