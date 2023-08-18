import { $ } from "../../../../../../hasura/library/src/generated/graphql-zeus";
import { getHasura } from "../../../../utilities/hasura";
import { TaxiOrder } from "../../../models/Services/Taxi/TaxiOrder";

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
  