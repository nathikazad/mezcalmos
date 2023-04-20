import { getBusiness } from "../graphql/business/getBusiness";
import { createDirectChat, createMezAdminChat, createServiceProviderCustomerChat } from "../graphql/chat/createChat";
import { getDeliveryCompany } from "../graphql/delivery/getDelivery";
import { getLaundryStore } from "../graphql/laundry/getLaundry";
import { getRestaurant } from "../graphql/restaurant/getRestaurant";
import { getCustomer } from "../graphql/user/customer/getCustomer";
import { getUser } from "../graphql/user/getUser";
import { getMezAdmins } from "../graphql/user/mezAdmin/getMezAdmin";
import { AppType, MezError } from "../models/Generic/Generic";
import { CustomerInfo } from "../models/Generic/User";
import { ServiceProvider, ServiceProviderType } from "../models/Services/Service";

export interface ServiceProviderDetails {
    serviceProviderId: number,
    serviceProviderType: ServiceProviderType
}
export interface ServiceProviderChatResponse {
    success: boolean,
    error?: ServiceProviderChatError
    unhandledError?: string,
    chatId?: number
}
export enum ServiceProviderChatError {
    UnhandledError = "unhandledError",
    CustomerNotFound = "customerNotFound",
    RestaurantNotFound = "restaurantNotFound",
    LaundryStoreNotfound = "laundryStoreNotfound",
    BusinessNotFound = "businessNotFound",
    DeliveryCompanyNotFound = "deliveryCompanyNotFound",
    InvalidServiceProviderType = "invalidServiceProviderType",
    ChatCreationError = "chatCreationError"
}
export async function createServiceProviderChat(customerId: number, serviceProviderDetails: ServiceProviderDetails): Promise<ServiceProviderChatResponse> {
    try {
        let customer: CustomerInfo = await getCustomer(customerId);
        let serviceProvider: ServiceProvider;
        switch (serviceProviderDetails.serviceProviderType) {
            case ServiceProviderType.Restaurant:
                serviceProvider = await getRestaurant(serviceProviderDetails.serviceProviderId);
                break;
            case ServiceProviderType.Laundry:
                serviceProvider = await getLaundryStore(serviceProviderDetails.serviceProviderId);
                break;
            case ServiceProviderType.Business:
                serviceProvider = (await getBusiness(serviceProviderDetails.serviceProviderId)).details;
                break;
            case ServiceProviderType.DeliveryCompany:
                serviceProvider = await getDeliveryCompany(serviceProviderDetails.serviceProviderId);
                break;
            default:
                throw new MezError(ServiceProviderChatError.InvalidServiceProviderType);
        }
        let chatId: number = await createServiceProviderCustomerChat(serviceProvider, customer);
        return {
            success: true,
            chatId
        }
    } catch(e: any) {
        if (e instanceof MezError) {
            if (Object.values(ServiceProviderChatError).includes(e.message as any)) {
                return {
                    success: false,
                    error: e.message as any
                }
            } else {
                return {
                    success: false,
                    error: ServiceProviderChatError.UnhandledError,
                    unhandledError: e.message as any
                }
            }
        } else {
            throw e
        }
    }
}

export interface DirectChatDetails {
    userId2: number,
    user1AppType: AppType,
    user2AppType: AppType,
}
export async function createNewDirectChat(userId1: number, directChatDetails: DirectChatDetails) {
    let user1Promise = getUser(userId1);
    let user2Promise = getUser(directChatDetails.userId2);
    let response = await Promise.all([user1Promise, user2Promise]);
    let user1 = response[0];
    let user2 = response[1];
    
    createDirectChat(user1, user2, directChatDetails)
}

export interface MezAdminChatDetails {
    userAppType: AppType,
}
export async function createNewMezAdminChat(userId: number, mezAdminChatDetails: MezAdminChatDetails) {
    let userPromise = getUser(userId);
    let mezAdminPromise = getMezAdmins();
    let response = await Promise.all([userPromise, mezAdminPromise]);
    let user = response[0];
    let mezAdmins = response[1];
    createMezAdminChat(user, mezAdminChatDetails.userAppType, mezAdmins)
}