import { getHasura } from "../../../utilities/hasura";
import { AuthorizationStatus, MezError } from "../../models/Generic/Generic";
import { AuthOperatorError } from "../../../serviceProvider/authorizeOperator";
import { DeliveryServiceProviderType } from "../../models/Generic/Delivery";
import { Operator } from "../../models/Services/Service";
import { ParticipantType } from "../../models/Generic/Chat";

export async function updateOperatorStatusToAuthorized(operator: Operator, participantType: ParticipantType) {
    let chain = getHasura();

    let opCount: number = 0;

    switch (participantType) {
        case ParticipantType.RestaurantOperator:
            const response1 = await chain.query({
                restaurant_operator_aggregate: [{
                    where: {
                        restaurant_id: {
                            _eq: operator.serviceProviderId
                        }
                    }
                }, {
                    aggregate: {
                        count: [{}, true]
                    }
                }]
            });
            opCount = response1.restaurant_operator_aggregate.aggregate!.count;
            break;
        case ParticipantType.LaundryOperator:
            const response2 = await chain.query({
                laundry_operator_aggregate: [{
                    where: {
                        store_id: {
                            _eq: operator.serviceProviderId
                        }
                    }
                }, {
                    aggregate: {
                        count: [{}, true]
                    }
                }]
            });
            opCount = response2.laundry_operator_aggregate.aggregate!.count;
            break;
        case ParticipantType.DeliveryOperator:
            let response = await chain.query({
                delivery_operator_aggregate: [{
                    where: {
                        delivery_company_id: {
                            _eq: operator.serviceProviderId
                        }
                    }
                }, {
                    aggregate: {
                        count: [{}, true]
                    }
                }]
            });
            opCount = response.delivery_operator_aggregate.aggregate!.count;
            break;
    }

    let mutationResponse = await chain.mutation({
        update_service_provider_operator_details_by_pk: [{
            pk_columns: {
                id: operator.detailsId
            },
            _set: {
                owner: (opCount == 1) ? true : undefined,
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