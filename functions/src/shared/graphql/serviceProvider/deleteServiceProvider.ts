import { DeleteServiceProviderError, DeleteServiceProviderRequest } from "../../../serviceProvider/deleteServiceProvider";
import { getHasura } from "../../../utilities/hasura";
import { MezError } from "../../models/Generic/Generic";
import { ServiceProviderType } from "../../models/Services/Service";


export async function removeServiceProvider(deleteServiceProviderReq: DeleteServiceProviderRequest) {
    let chain = getHasura();

    let response = null;
    switch (deleteServiceProviderReq.serviceProviderType) {
        case ServiceProviderType.Business:
            response = await chain.mutation({
                delete_business_business_by_pk: [{
                    id: deleteServiceProviderReq.serviceProviderId
                }, {
                    details_id: true,
                }]
            });
            if(response.delete_business_business_by_pk == null) {
                throw new MezError(DeleteServiceProviderError.DeletionError);
            }
            break;
        case ServiceProviderType.Restaurant:
            response = await chain.mutation({
                delete_restaurant_restaurant_by_pk: [{
                    id: deleteServiceProviderReq.serviceProviderId
                }, {
                    details_id: true,
                }]
            });
            if(response.delete_restaurant_restaurant_by_pk == null) {
                throw new MezError(DeleteServiceProviderError.DeletionError);
            }
            break;
        case ServiceProviderType.Laundry:
            response = await chain.mutation({
                delete_laundry_store_by_pk: [{
                    id: deleteServiceProviderReq.serviceProviderId
                }, {
                    details_id: true,
                }]
            });
            if(response.delete_laundry_store_by_pk == null) {
                throw new MezError(DeleteServiceProviderError.DeletionError);
            }
            break;
        case ServiceProviderType.DeliveryCompany:
            response = await chain.mutation({
                delete_delivery_company_by_pk: [{
                    id: deleteServiceProviderReq.serviceProviderId
                }, {
                    details_id: true,
                }]
            });
            if(response.delete_delivery_company_by_pk == null) {
                throw new MezError(DeleteServiceProviderError.DeletionError);
            }
            break;
        default:
            break;
    }
    
}