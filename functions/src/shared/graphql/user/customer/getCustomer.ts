import { getHasura } from "../../../../utilities/hasura";
import { CustomerCard } from "../../../models/stripe";
import { AppType, Language, MezError } from "../../../models/Generic/Generic";
import { CustomerInfo } from "../../../models/Generic/User";

export async function getCustomer(customerId: number): Promise<CustomerInfo> {
    let chain = getHasura();
    let response = await chain.query({
        customer_customer_by_pk: [{
            user_id: customerId
        }, {
            app_version: true,
            notification_info: {
                token: true,
                turn_off_notifications: true
            },
            user: {
                firebase_id: true,
                language_id: true,
                phone: true,
                name : true,
                image:true
            },
            stripe_cards: [{}, {
                brand: true,
                exp_month: true,
                card_id: true,
                exp_year: true,
                last_4: true,
                sp_card_ids: [{}, true]
            }],
            stripe_sp_ids: [{}, {
                sp_id: true,
                stripe_id: true,
            }],
            stripe_id: true,
            // stripe_info: [{}, true]
        }]
    })

    if(response.customer_customer_by_pk == null) {
        throw new MezError("customerNotFound");
    }
    let stripeSPIds: Record<number, string> = {};
    response.customer_customer_by_pk.stripe_sp_ids.forEach((i:any) => {
        stripeSPIds[i.sp_id] = i.stripe_id
    })
    let cards: Record<string, CustomerCard> = {}
    response.customer_customer_by_pk.stripe_cards.forEach((c:any) => {
        cards[c.card_id] = {
            cardId: c.card_id,
            brand: c.brand,
            expMonth: c.exp_month,
            expYear: c.exp_year,
            last4: c.last_4,
            idsWithServiceProvider: JSON.parse(c.sp_card_ids)
        }
    })
    return {
        id: customerId,
        firebaseId: response.customer_customer_by_pk.user.firebase_id,
        language: response.customer_customer_by_pk.user.language_id as Language,
        name : response.customer_customer_by_pk.user.name,
        image : response.customer_customer_by_pk.user.image,
        notificationInfo: (response.customer_customer_by_pk.notification_info) ? {
            appType: AppType.Customer,
            token: response.customer_customer_by_pk.notification_info.token,
            turnOffNotifications: response.customer_customer_by_pk.notification_info.turn_off_notifications,
        } : undefined,
        appVersion: response.customer_customer_by_pk.app_version,
        stripeInfo: (response.customer_customer_by_pk.stripe_id) ? {
            id: response.customer_customer_by_pk.stripe_id,
            idsWithServiceProvider: stripeSPIds,
            cards
        }: undefined,
        // JSON.parse(response.customer_customer_by_pk.stripe_info),
        phoneNumber: response.customer_customer_by_pk.user.phone
    }
}