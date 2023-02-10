import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { AppType, Language, NotificationInfo } from "../../../models/Generic/Generic";
import { DeliveryOperator } from "../../../models/Generic/Delivery";
import { AuthorizationStatus } from "../../../models/Generic/Generic";

export async function getDeliveryOperators(deliveryCompanyId: number): Promise<DeliveryOperator[]> {
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
            status: true,
            owner: true,
            app_version: true,
            current_gps: true,
            notification_info: {
                token: true,
                turn_off_notifications: true
            },
            user: {
                firebase_id: true,
                language_id: true
            }
        }]
    })
    if (response.delivery_operator == null) {
        throw new HttpsError(
            "internal",
            "No delivery company with that id found or company has no operators"
        );
    }
    return response.delivery_operator.map((d) => {
        return <DeliveryOperator>{
            id: d.id,
            userId: d.user_id,
            deliveryCompanyId: deliveryCompanyId,
            status: d.status as AuthorizationStatus,
            owner: d.owner,
            appVersion: d.app_version,
            currentGPS: (d.current_gps) ? {
                lat: d.current_gps.coordinates[1],
                lng: d.current_gps.coordinates[0]
            } : undefined,
            notificationInfo: (d.notification_info) ? <NotificationInfo>{
                appType: AppType.DeliveryAdmin,
                token: d.notification_info.token,
                turnOffNotifications: d.notification_info.turn_off_notifications
            } : undefined,
            user: {
                id: d.user_id,
                firebaseId: d.user.firebase_id,
                language: d.user.language_id as Language
            }
        }
    })
}

export async function getDeliveryOperator(deliveryOperatorId: number): Promise<DeliveryOperator> {
    let chain = getHasura();

    let response = await chain.query({
        delivery_operator_by_pk: [{
            id: deliveryOperatorId
        }, {
            id: true,
            user_id: true,
            delivery_company_id: true,
            status: true,
            owner: true,
            app_version: true,
            current_gps: true,
            notification_info: {
                token: true,
                turn_off_notifications: true
            },
            user: {
                firebase_id: true,
                language_id: true
            }
        }]
    })
    if (response.delivery_operator_by_pk == null) {
        throw new HttpsError(
            "internal",
            "No delivery operator with that id found"
        );
    }

    return {
        id: response.delivery_operator_by_pk.id,
        userId: response.delivery_operator_by_pk.user_id,
        deliveryCompanyId: response.delivery_operator_by_pk.delivery_company_id,
        status: response.delivery_operator_by_pk.status as AuthorizationStatus,
        owner: response.delivery_operator_by_pk.owner,
        appVersion: response.delivery_operator_by_pk.app_version,
        currentGPS: {
            lat: response.delivery_operator_by_pk.current_gps.coordinates[1],
            lng: response.delivery_operator_by_pk.current_gps.coordinates[0]
        },
        notificationInfo: (response.delivery_operator_by_pk.notification_info) ? <NotificationInfo>{
            appType: AppType.DeliveryAdmin,
            token: response.delivery_operator_by_pk.notification_info.token,
            turnOffNotifications: response.delivery_operator_by_pk.notification_info.turn_off_notifications
        } : undefined,
        user: {
            id: response.delivery_operator_by_pk.user_id,
            firebaseId: response.delivery_operator_by_pk.user.firebase_id as string,
            language: response.delivery_operator_by_pk.user.language_id as Language
        }
    }
}

export async function getDeliveryOperatorByUserId(deliveryOperatorUserId: number): Promise<DeliveryOperator> {
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
            status: true,
            owner: true,
            app_version: true,
            current_gps: true,
            notification_info: {
                token: true,
                turn_off_notifications: true
            },
            user: {
                firebase_id: true,
                language_id: true
            }
        }]
    })
    if (!(response.delivery_operator.length)) {
        throw new HttpsError(
            "internal",
            "No delivery operator with that user id found"
        );
    }

    return {
        id: response.delivery_operator[0].id,
        userId: response.delivery_operator[0].user_id,
        deliveryCompanyId: response.delivery_operator[0].delivery_company_id,
        status: response.delivery_operator[0].status as AuthorizationStatus,
        owner: response.delivery_operator[0].owner,
        appVersion: response.delivery_operator[0].app_version,
        currentGPS: (response.delivery_operator[0].current_gps) ? {
            lat: response.delivery_operator[0].current_gps.coordinates[1],
            lng: response.delivery_operator[0].current_gps.coordinates[0]
        } : undefined,
        notificationInfo: (response.delivery_operator[0].notification_info) ? <NotificationInfo>{
            appType: AppType.DeliveryAdmin,
            token: response.delivery_operator[0].notification_info.token,
            turnOffNotifications: response.delivery_operator[0].notification_info.turn_off_notifications
        } : undefined,
        user: {
            id: response.delivery_operator[0].user_id,
            firebaseId: response.delivery_operator[0].user.firebase_id as string,
            language: response.delivery_operator[0].user.language_id as Language
        }
    }
}