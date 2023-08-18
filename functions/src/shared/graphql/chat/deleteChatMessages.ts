import { getHasura } from "../../../utilities/hasura";

export async function deleteChatMessagesAndParticipant(driverId: number, chatWithCustomerId: number, chatWithServiceProviderId?: number) {
  let chain = getHasura();


  await chain.mutation({
    update_chat_by_pk: [{
      pk_columns: {
        id: chatWithCustomerId
      },

      _set: {
        messages: []
      }
    }, {
      id: true,
    }],
    delete_chat_participant: [{
      where: {
        _and: [{
          participant_id: {
            _eq: driverId
          },
          chat_id: {
            _eq: chatWithCustomerId
          },
        }] 
      }
    }, {
      affected_rows: true
    }]
  });

  // let response = await 
  if(chatWithServiceProviderId) {
  
    await chain.mutation({
      update_chat_by_pk: [{
        pk_columns: {
          id: chatWithServiceProviderId
        },
        _set: {
          messages: []
        }
      }, {
        id: true,
      }],
      delete_chat_participant: [{
        where: {
          _and: [{
            participant_id: {
              _eq: driverId
            },
            chat_id: {
              _eq: chatWithServiceProviderId
            },
          }]
        }
      }, {
        affected_rows: true
      }]
    });
  }
}