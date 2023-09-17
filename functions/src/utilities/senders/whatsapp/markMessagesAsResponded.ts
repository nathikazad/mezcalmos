
import { getHasura } from "../../hasura";
import { MezError } from "../../../shared/models/Generic/Generic";


export interface MarkMessagesAsRespondedDetails {
  phoneNumber: string,
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

export async function markMessagesAsResponded(uid: number, data: MarkMessagesAsRespondedDetails): Promise<MarkMessagesResponse> {
  try {
    const phoneNumber = data.phoneNumber;
    if (!phoneNumber) {
      throw new MezError(MarkMessagesError.InvalidParams);
    }

    const chain = getHasura();
    const driverId: number = await getDriverId(uid);

    // get all messages that match phone number and do not have responded time
    const response = await chain.query({
      delivery_messages: [{
        where:
        {
          _and: [{
            phone_number: {
              _eq: phoneNumber
            },
            responded_time: {
              _is_null: true
            }
          }]
        }
      }, {
        entry: [{}, true],
        id: true
      }]
    });


    type SetInput = {
      driver_id?: number;
      responded_time?: Date;
    };
    if (response.delivery_messages.length > 0) {
      // mark all messages as responded and only the last message with driver_id
      let mutationResponse = await chain.mutation({
        update_delivery_messages_many: [{
          updates: response.delivery_messages.map((msg, index) => {
            let setObject: SetInput = {
              responded_time: new Date()
            };

            if (index === response.delivery_messages.length - 1) {
              setObject.driver_id = driverId;
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

export async function getDriverId(uid: number) {
  const chain = getHasura();
  const response = await chain.query({
    delivery_driver: [{
      where: {
        user_id: {
          _eq: uid
        }
      }
    }, {
      id: true
    }]
  });

  if (response.delivery_driver.length < 1) {
    throw new MezError(MarkMessagesError.UnauthorizedDriver);
  }
  const driverId: number = response.delivery_driver[0].id;
  return driverId;
}