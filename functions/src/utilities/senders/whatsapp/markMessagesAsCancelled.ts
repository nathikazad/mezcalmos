
import { getHasura } from "../../hasura";
import { MezError } from "../../../shared/models/Generic/Generic";
import { order_by } from "../../../../../hasura/library/src/generated/graphql-zeus";
import { getDriverId } from "./markMessagesAsResponded";
// import { notifyDrivers } from "./handleWhatsapp";


export interface MarkMessagesAsCancelledDetails {
  phoneNumber: string,
}


export interface MarkMessagesAsCancelledResponse {
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

export async function markMessagesAsCancelled(uid: number, data: MarkMessagesAsCancelledDetails): Promise<MarkMessagesAsCancelledResponse> {
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
        order_by: [{
          id: order_by.desc
        }],
        limit: 4,
        where:
        {
          _and: [{
            phone_number: {
              _eq: phoneNumber
            },
            responded_time: {
              _is_null: false
            }
          }]
        }
      }, {
        entry: [{}, true],
        id: true,
        driver_id: true,
        responded_time: true
      }]
    });

    if (response.delivery_messages.length == 0 || response.delivery_messages[0].driver_id != driverId)
      throw new MezError(MarkMessagesError.UnauthorizedDriver);
    await chain.mutation({
      update_delivery_messages_by_pk: [{
        _set: {
          responded_time: null,
          driver_id: null as any
        },
        pk_columns: {
          id: response.delivery_messages[0].id
        }
      }, {
        id: true
      }]
    });
    // notifyDrivers(phoneNumber)
    return { success: true };

  } catch (e: any) {
    console.log(e);
    
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