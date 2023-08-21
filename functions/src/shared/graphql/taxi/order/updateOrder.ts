import { $ } from "../../../../../../hasura/library/src/generated/graphql-zeus";
import { getHasura } from "../../../../utilities/hasura";
import { TaxiOrder, TaxiOrderStatus } from "../../../models/Services/Taxi/TaxiOrder";

export async function setNotifiedTaxiDrivers(taxiOrder: TaxiOrder) {
    let chain = getHasura();
  
    await chain.mutation({
        update_taxi_order_by_pk: [{
            pk_columns: {
                id: taxiOrder.id
            },
            _set: {
                notified_drivers: $`notified_drivers`
            }
        }, {
            chat_id: true
        }]
    }, {
        "notified_drivers": taxiOrder.notifiedDrivers
    })
}

export async function updateTaxiCounterOffers(order: TaxiOrder) {
    let chain = getHasura();
  
    await chain.mutation({
      update_taxi_order_by_pk: [{
        pk_columns: {
          id: order.id
        },
        _set: {
          counter_offers: $`counter_offers`
        }
      }, {
        id: true
      }]
    }, {
      "counter_offers": order.counterOffers
    })
    
  }

export async function updateTaxiOrderStatus(taxiOrder: TaxiOrder) {
  let chain = getHasura();

  await chain.mutation({
    update_taxi_order_by_pk: [{
      pk_columns: {
        id: taxiOrder.id
      }, 
      _set: {
        status: taxiOrder.status,
        cancellation_time: (taxiOrder.status == TaxiOrderStatus.CancelledByAdmin || taxiOrder.status == TaxiOrderStatus.CancelledByCustomer) 
          ? new Date() 
          : undefined,
      }
    }, { 
      status: true
    }]
  });
}
  
export async function unassignTaxiDriver(taxiOrderId: number) {
  let chain = getHasura();

  await chain.mutation({
    update_taxi_order_by_pk: [{
      pk_columns: {
        id: taxiOrderId
      }, 
      _set: {
        driver_id: null!,
        status: TaxiOrderStatus.OrderReceived
      }
    }, { 
      driver_id: true
    
    }]
  });
}
  