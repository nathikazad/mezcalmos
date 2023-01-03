import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { Participant } from "../../models/Generic/Chat";
import { AppParticipant, AppType, Language } from "../../models/Generic/Generic";

export async function getChatParticipant(userId: number): Promise<Participant> {
    const chain = getHasura();

    let response = await chain.query({
        chat_participant: [{
            where: {
                participant_id: {
                    _eq: userId
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
                token: true
            }
        }]
    })
    if(!(response.chat_participant)) {
        throw new HttpsError(
            "internal",
            "participant not found"
        );
    }
    return {
        id: userId,
        name: response.chat_participant[0].user.name,
        image: response.chat_participant[0].user.image,
        firebaseId: response.chat_participant[0].user.firebase_id,
        language: response.chat_participant[0].user.language_id as Language,
        participantType: AppParticipant[response.chat_participant[0].app_type_id as AppType],
        notificationInfo: (response.chat_participant[0].notification_info) ? {
            AppTypeId: response.chat_participant[0].app_type_id as AppType,
            token: response.chat_participant[0].notification_info.token
        }: null
    }
}

export async function getChatParticipants(chatId: number): Promise<Participant[]> {
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
                    token: true
                }
            }]
        }]
    });
    if(!(response.chat_by_pk)) {
        throw new HttpsError(
            "internal",
            "chat not found"
        );
    }
    return response.chat_by_pk.chat_participants.map((p) => {
        return {
            id: p.user.id,
            name: p.user.name,
            image: p.user.image,
            firebaseId: p.user.firebase_id,
            language: p.user.language_id as Language,
            participantType: AppParticipant[p.app_type_id as AppType],
            notificationInfo: (p.notification_info) ? {
                AppTypeId: p.app_type_id as AppType,
                token: p.notification_info.token
            }: null
        }
    })
}