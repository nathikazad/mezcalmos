import { $ } from "../../../../../hasura/library/src/generated/graphql-zeus";
import { AssignDriverError } from "../../../delivery/assignDriver";
import { getHasura } from "../../../utilities/hasura";
import { DeliveryOrder, DeliveryOrderStatus } from "../../models/Generic/Delivery";
import { MezError } from "../../models/Generic/Generic";

export async function updateDeliveryOrderStatus(deliveryOrder: DeliveryOrder) {
  let chain = getHasura();

  await chain.mutation({
    update_delivery_order_by_pk: [{
      pk_columns: {
        id: deliveryOrder.deliveryId
      }, 
      _set: {
        status: deliveryOrder.status,
        package_ready: deliveryOrder.packageReady ,
      }
    }, { 
      status: true
    }]
  });
}

// export async function updateDeliveryOrderCompany(deliveryOrderId: number, deliveryCompanyId: number) {
//   let chain = getHasura();

//   await chain.mutation({
//     update_delivery_order_by_pk: [{ 
//       pk_columns: {
//         id: deliveryOrderId
//       },
//       _set: {
//         service_provider_type: DeliveryServiceProviderType.DeliveryCompany,
//         service_provider_id: deliveryCompanyId
//       }
//     }, {
//       delivery_company: {
//         id: true
//       }
//     }]
//   })
// }

export async function setLockTime(deliveryOrderId: number) {
  let chain = getHasura();

  let response = await chain.mutation({
    update_delivery_order: [{
      where: {
        _and: [{
          id: {
            _eq: deliveryOrderId
          }
        }, {
          _or: [{
            
            lock_time: {
              _is_null: true
            }
          }, {
            lock_time: {
              _lt: new Date(Date.now() - 5 * 60 * 1000)
            }
          }]
        }, {
          delivery_driver_id: {
            _is_null: true
          }
        }]
      },
      _set: {
        lock_time: new Date()
      }
    }, { 
      affected_rows: true
    }]
  });
  console.log("affected rows: ", response.update_delivery_order?.affected_rows)
  if(response.update_delivery_order == null || response.update_delivery_order.affected_rows == 0) {
    
    throw new MezError(AssignDriverError.DriverAlreadyAssigned);
  }

}

export async function clearLock(deliveryOrderId: number) {
  let chain = getHasura();

  await chain.mutation({
    update_delivery_order_by_pk: [{
      pk_columns: {
        id: deliveryOrderId
      }, 
      _set: {
        lock_time: null!
      }
    }, { 
     lock_time: true
    
    }]
  });
}

export async function unassignDriver(deliveryOrderId: number) {
  let chain = getHasura();

  await chain.mutation({
    update_delivery_order_by_pk: [{
      pk_columns: {
        id: deliveryOrderId
      }, 
      _set: {
        delivery_driver_id: null!,
        status: DeliveryOrderStatus.OrderReceived
      }
    }, { 
     delivery_driver_id: true
    
    }]
  });
}


export async function updateDeliveryCounterOffers(deliveryOrder: DeliveryOrder) {
  let chain = getHasura();

  await chain.mutation({
    update_delivery_order_by_pk: [{
      pk_columns: {
        id: deliveryOrder.deliveryId
      },
      _set: {
        counter_offers: $`counter_offers`
      }
    }, {
      delivery_cost: true
    }]
  }, {
    "counter_offers": deliveryOrder.counterOffers
  })
  
}

export async function setNotifiedDrivers(deliveryOrder: DeliveryOrder) {
  let chain = getHasura();

  await chain.mutation({
    update_delivery_order_by_pk: [{
      pk_columns: {
        id: deliveryOrder.deliveryId
      },
      _set: {
        notified_drivers: $`notified_drivers`
      }
    }, {
      delivery_cost: true
    }]
  }, {
    "notified_drivers": deliveryOrder.notifiedDrivers
  })
  
}
