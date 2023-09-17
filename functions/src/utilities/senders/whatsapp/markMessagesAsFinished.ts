
import { getHasura } from "../../hasura";
import { MezError } from "../../../shared/models/Generic/Generic";



export interface MarkMessagesAsFinishedDetails {
  phoneNumbers: Array<string>,
}
export interface MarkMessagesResponse {
  success: boolean,
  error?: MarkMessagesError
  unhandledError?: string,
}

export enum MarkMessagesError {
  UnhandledError = "unhandledError",
  InvalidParams = "invalidParams",
  UnauthorizedDriver = "unauthorizedDriver",
  NoMessagesFound = "noMessagesFound"
}

export async function markMessagesAsFinished(uid: number, data: MarkMessagesAsFinishedDetails): Promise<MarkMessagesResponse> {
  try {
    const chain = getHasura();
    if (!data.phoneNumbers) {
      throw new MezError(MarkMessagesError.InvalidParams);
    }
    const response = await chain.query({
      delivery_messages: [{
        where:
        {
          _and: [{
            phone_number: {
              _in: data.phoneNumbers
            },
            _or: [{
              finished_time: {
                _is_null: true
              }
            },
            {
              responded_time: {
                _is_null: true
              }
            }]
          }]
        }
      }, {
        entry: [{}, true],
        responded_time: true,
        id: true
      }]
    });


    type SetInput = {
      responded_time?: Date;
      finished_time?: Date;
    };
    if (response.delivery_messages.length > 0) {
      let mutationResponse = await chain.mutation({
        update_delivery_messages_many: [{
          updates: response.delivery_messages.map((msg, index) => {
            let setObject: SetInput = {
              finished_time: new Date()
            };

            if (msg.responded_time == null) {
              msg.responded_time = new Date();
            }

            return {
              where: {
                id: { _eq: msg.id }
              },
              _set: setObject
            };
          })
        }, {
          affected_rows: true
        }]
      });

      if (mutationResponse.update_delivery_messages_many?.length ?? 0 > 0)
        return { success: true };
      else
        throw new MezError(MarkMessagesError.NoMessagesFound);
    } else {
      throw new MezError(MarkMessagesError.NoMessagesFound);
    }

  } catch (e: any) {
    if (e instanceof MezError) {
      if (Object.values(MarkMessagesError).includes(e.message as any)) {
        return {
          success: false,
          error: e.message as any
        }
      } else {
        return {
          success: false,
          error: MarkMessagesError.UnhandledError,
          unhandledError: e.message as any
        }
      }
    } else {
      throw e
    }

  }
}