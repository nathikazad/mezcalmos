import { getHasura } from "../../../../utilities/hasura";
import { AppType, Language, MezError, NotificationInfo } from "../../../models/Generic/Generic";
import { AuthorizationStatus } from "../../../models/Generic/Generic";
import { Operator } from "../../../models/Services/Service";

export async function getDeliveryOperators(deliveryCompanyId: number): Promise<Operator[]> {
    let chain = getHasura();

    let response = await chain.query({
        delivery_operator: [{
            where: {
                delivery_company_id: {
                    _eq: deliveryCompanyId
                }
            }
        }, {
            id: true,
            user_id: true,
            operator_details: {
                id: true,
                status: true,
                owner: true,
                app_version: true,
                online: true,
                notification_info: {
                    token: true,
                    turn_off_notifications: true
                },
            },
            user: {
                firebase_id: true,
                language_id: true
            }
        }]
    })
    // if (response.delivery_operator == null) {
    //     throw new MezError("deliveryCompanyOperatorsNotFound");
    // }
    return response.delivery_operator.map((d) => {
        return {
            id: d.id,
            userId: d.user_id,
            detailsId: d.operator_details.id,
            serviceProviderId: deliveryCompanyId,
            status: d.operator_details.status as AuthorizationStatus,
            owner: d.operator_details.owner,
            online: d.operator_details.online,
            appVersion: d.operator_details.app_version,
            notificationInfo: (d.operator_details.notification_info) ? <NotificationInfo>{
                appType: AppType.DeliveryAdmin,
                token: d.operator_details.notification_info.token,
                turnOffNotifications: d.operator_details.notification_info.turn_off_notifications
            } : undefined,
            user: {
                id: d.user_id,
                firebaseId: d.user.firebase_id,
                language: d.user.language_id as Language
            }
        }
    })
}

export async function getDeliveryOperator(deliveryOperatorId: number): Promise<Operator> {
    let chain = getHasura();

    let response = await chain.query({
        delivery_operator_by_pk: [{
            id: deliveryOperatorId
        }, {
            id: true,
            user_id: true,
            delivery_company_id: true,
            operator_details: {
                id: true,
                status: true,
                owner: true,
                online: true,
                app_version: true,
                notification_info: {
                    token: true,
                    turn_off_notifications: true
                },
            },
            user: {
                firebase_id: true,
                language_id: true
            }
        }]
    })
    if (response.delivery_operator_by_pk == null) {
        throw new MezError("operatorNotFound");
    }

    return {
        id: response.delivery_operator_by_pk.id,
        detailsId: response.delivery_operator_by_pk.operator_details.id,
        userId: response.delivery_operator_by_pk.user_id,
        serviceProviderId: response.delivery_operator_by_pk.delivery_company_id,
        status: response.delivery_operator_by_pk.operator_details.status as AuthorizationStatus,
        owner: response.delivery_operator_by_pk.operator_details.owner,
        online: response.delivery_operator_by_pk.operator_details.online,
        appVersion: response.delivery_operator_by_pk.operator_details.app_version,
        notificationInfo: (response.delivery_operator_by_pk.operator_details.notification_info) ? <NotificationInfo>{
            appType: AppType.DeliveryAdmin,
            token: response.delivery_operator_by_pk.operator_details.notification_info.token,
            turnOffNotifications: response.delivery_operator_by_pk.operator_details.notification_info.turn_off_notifications
        } : undefined,
        user: {
            id: response.delivery_operator_by_pk.user_id,
            firebaseId: response.delivery_operator_by_pk.user.firebase_id as string,
            language: response.delivery_operator_by_pk.user.language_id as Language
        }
    }
}

export async function getDeliveryOperatorByUserId(deliveryOperatorUserId: number): Promise<Operator> {
    let chain = getHasura();

    let response = await chain.query({
        delivery_operator: [{
            where: {
                user_id: {
                    _eq: deliveryOperatorUserId
                }
            }
        }, {
            id: true,
            user_id: true,
            delivery_company_id: true,
            operator_details: {
                id: true,
                status: true,
                owner: true,
                online: true,
                app_version: true,
                notification_info: {
                    token: true,
                    turn_off_notifications: true
                },
            },
            user: {
                firebase_id: true,
                language_id: true
            }
        }]
    })
    if (!(response.delivery_operator.length)) {
        throw new MezError("operatorNotFound");
    }

    return {
        id: response.delivery_operator[0].id,
        userId: response.delivery_operator[0].user_id,
        detailsId: response.delivery_operator[0].operator_details.id,
        serviceProviderId: response.delivery_operator[0].delivery_company_id,
        status: response.delivery_operator[0].operator_details.status as AuthorizationStatus,
        owner: response.delivery_operator[0].operator_details.owner,
        online: response.delivery_operator[0].operator_details.online,
        appVersion: response.delivery_operator[0].operator_details.app_version,
        notificationInfo: (response.delivery_operator[0].operator_details.notification_info) ? <NotificationInfo>{
            appType: AppType.DeliveryAdmin,
            token: response.delivery_operator[0].operator_details.notification_info.token,
            turnOffNotifications: response.delivery_operator[0].operator_details.notification_info.turn_off_notifications
        } : undefined,
        user: {
            id: response.delivery_operator[0].user_id,
            firebaseId: response.delivery_operator[0].user.firebase_id as string,
            language: response.delivery_operator[0].user.language_id as Language
        }
    }
}