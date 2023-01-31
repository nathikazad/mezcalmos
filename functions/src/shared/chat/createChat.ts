import { createDirectChat, createMezAdminChat, createRestaurantCustomerChat } from "../graphql/chat/createChat";
import { getRestaurant } from "../graphql/restaurant/getRestaurant";
import { getCustomer } from "../graphql/user/customer/getCustomer";
import { getUser } from "../graphql/user/getUser";
import { getMezAdmins } from "../graphql/user/mezAdmin/getMezAdmin";
import { AppType } from "../models/Generic/Generic";
import { ServiceProviderType } from "../models/Services/Service";

export interface ServiceProviderDetails {
    serviceProviderId: number,
    serviceProviderType: ServiceProviderType
}
export async function createServiceProviderChat(customerId: number, serviceProviderDetails: ServiceProviderDetails) {
    if(serviceProviderDetails.serviceProviderType =  ServiceProviderType.Restaurant) {
        let restaurantPromise = getRestaurant(serviceProviderDetails.serviceProviderId);
        let customerPromise = getCustomer(customerId);
        let response = await Promise.all([restaurantPromise, customerPromise]);
        let restaurant = response[0];
        let customer = response[1];

        createRestaurantCustomerChat(restaurant, customer);
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