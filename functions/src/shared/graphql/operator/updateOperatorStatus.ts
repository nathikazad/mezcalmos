import { getHasura } from "../../../utilities/hasura";
import { AuthorizationStatus, MezError } from "../../models/Generic/Generic";
import { AuthOperatorError } from "../../../serviceProvider/authorizeOperator";
import { DeliveryServiceProviderType } from "../../models/Generic/Delivery";

export async function updateOperatorStatusToAuthorized(operatorDetailsId: number) {
    let chain = getHasura();

    let mutationResponse = await chain.mutation({
        update_service_provider_operator_details_by_pk: [{
            pk_columns: {
                id: operatorDetailsId
            },
            _set: {
                status: AuthorizationStatus.Authorized
            }
        }, {
            status: true
        }],
    });
    if(!(mutationResponse.update_service_provider_operator_details_by_pk)) {
        throw new MezError(AuthOperatorError.OperatorDetailsNotFound); 
    }
}

export async function checkOperator(operatorUserId: number, serviceProviderId: number, serviceProviderType: DeliveryServiceProviderType) {
    let chain = getHasura();

    let response;
    switch (serviceProviderType) {
        case DeliveryServiceProviderType.Restaurant:
            response = await chain.query({
                restaurant_operator: [{
                    where: {
                        user_id: {
                            _eq: operatorUserId
                        },
                        restaurant_id: {
                            _eq: serviceProviderId
                        }
                    }
                }, {
                    id: true
                }],
            });
            if(response.restaurant_operator.length == 0) {
                throw new MezError("incorrectOrderId"); 
            }
            break;
        case DeliveryServiceProviderType.Laundry:
            response = await chain.query({
                laundry_operator: [{
                    where: {
                        user_id: {
                            _eq: operatorUserId
                        },
                        store_id: {
                            _eq: serviceProviderId
                        }
                    }
                }, {
                    id: true
                }],
            });
            if(response.laundry_operator.length == 0) {
                throw new MezError("incorrectOrderId");
            }
        default:
            break;
    }
    
}