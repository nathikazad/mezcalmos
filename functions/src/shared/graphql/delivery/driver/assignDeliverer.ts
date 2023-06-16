import { getHasura } from "../../../../utilities/hasura";
import { DeliveryDriver, DeliveryOrder } from "../../../models/Generic/Delivery";
import { AppType, MezError } from "../../../models/Generic/Generic";
import { OrderType } from "../../../models/Generic/Order";

export async function assignDeliveryDriver(deliveryOrder: DeliveryOrder, driver: DeliveryDriver) {
  let chain = getHasura();
  
  let response = await chain.mutation({
    update_delivery_order_by_pk: [{
      pk_columns: {
        id: deliveryOrder.deliveryId
      },
      _set: {
        delivery_driver_id: driver.id,
        service_provider_id: driver.deliveryCompanyId,
        counter_offers: deliveryOrder.counterOffers,
        delivery_cost: deliveryOrder.deliveryCost,
      }
    }, {
      id: true,
      chat_with_customer_id: true,
      chat_with_service_provider_id: true,
    }]
  });
  switch (deliveryOrder.orderType) {
    case OrderType.Restaurant:
      await chain.mutation({
        update_restaurant_order: [{
          where: {
            delivery_id: {
              _eq: deliveryOrder.deliveryId
            }
          },
          _set: {
            delivery_cost: deliveryOrder.deliveryCost,
          }
        }, {
          affected_rows: true
        }]
      });
      break;
    case OrderType.Laundry:
      await chain.mutation({
        update_laundry_order: [{
          where: {
            _or: [{
              from_customer_delivery_id: {
                _eq: deliveryOrder.deliveryId
              }
            }, {
              to_customer_delivery_id: {
                _eq: deliveryOrder.deliveryId
              }
            }]
          },
          _inc: {
            delivery_cost: deliveryOrder.deliveryCost,
          }
        }, {
          affected_rows: true
        }]
      });
      break;
    default:
      break;
  }
  if(response.update_delivery_order_by_pk == null) {
    throw new MezError("orderNotFound");
  }
  let chatParticipants = [{
    chat_id: response.update_delivery_order_by_pk.chat_with_customer_id,
    app_type_id: AppType.Delivery,
    participant_id: driver.userId
  }];
  if(response.update_delivery_order_by_pk.chat_with_service_provider_id) {
    chatParticipants.push({
      chat_id: response.update_delivery_order_by_pk.chat_with_service_provider_id,
      app_type_id: AppType.Delivery,
      participant_id: driver.userId
    })
  }
  await chain.mutation({
    insert_chat_participant: [{
      objects: chatParticipants
    }, {
      returning: {
        id: true,
      }
    }]
  })
}