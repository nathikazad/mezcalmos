import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { Chat, Participant, AppParticipant, ChatType } from "../../models/Generic/Chat";
import { AppType, Language, MezError } from "../../models/Generic/Generic";

export async function getChatParticipant(chatId: number): Promise<Participant> {
    const chain = getHasura();

    let response = await chain.query({
        chat_participant: [{
            where: {
                participant_id: {
                    _eq: chatId
                }
            }
        }, {
            user: {
                firebase_id: true,
                language_id: true,
                name: true,
                image: true,
            },
            app_type_id: true,
            notification_info: {
                token: true,
                turn_off_notifications: true
            }
        }]
    })
    if (!(response.chat_participant)) {
        throw new HttpsError(
            "internal",
            "participant not found"
        );
    }
    return {
        id: chatId,
        name: response.chat_participant[0].user.name,
        image: response.chat_participant[0].user.image,
        firebaseId: response.chat_participant[0].user.firebase_id,
        language: response.chat_participant[0].user.language_id as Language,
        participantType: AppParticipant[response.chat_participant[0].app_type_id as AppType],
        notificationInfo: (response.chat_participant[0].notification_info) ? {
            appType: response.chat_participant[0].app_type_id as AppType,
            token: response.chat_participant[0].notification_info.token,
            turnOffNotifications: response.chat_participant[0].notification_info.turn_off_notifications
        } : null
    }
}

export async function getChat(chatId: number): Promise<Chat> {
    const chain = getHasura();

    let response = await chain.query({
        chat_by_pk: [{
            id: chatId
        }, {
            chat_participants: [{}, {
                user: {
                    firebase_id: true,
                    id: true,
                    name: true,
                    image: true,
                    language_id: true,
                },
                app_type_id: true,
                notification_info: {
                    token: true,
                    turn_off_notifications: true
                }
            }],
            chat_info: [{}, true],
            chat_type: true
        }]
    });
    if (!(response.chat_by_pk)) {
        throw new MezError("chatNotFound");
    }
    let participants: Participant[] = response.chat_by_pk.chat_participants.map((p) => {
        return <Participant>{
            id: p.user.id,
            name: p.user.name,
            image: p.user.image,
            firebaseId: p.user.firebase_id,
            language: p.user.language_id as Language,
            participantType: AppParticipant[p.app_type_id as AppType],
            notificationInfo: (p.notification_info) ? {
                appType: p.app_type_id as AppType,
                token: p.notification_info.token,
                turnOffNotifications: p.notification_info.turn_off_notifications
            } : null
        }
    })
    return {
        participants: participants,
        chatInfo: JSON.parse(response.chat_by_pk.chat_info),
        chatType: response.chat_by_pk.chat_type as ChatType
    };
}