import { $ } from "../../../../../../hasura/library/src/generated/graphql-zeus";
import { getHasura } from "../../../../utilities/hasura";
import { MezError, AppType } from "../../../models/Generic/Generic";
import { TaxiDriver } from "../../../models/Services/Taxi/Taxi";
import { TaxiOrder } from "../../../models/Services/Taxi/TaxiOrder";

export async function updateTaxiDriver(order: TaxiOrder, driver: TaxiDriver) {
    let chain = getHasura();
    
    let response = await chain.mutation({
        update_taxi_order_by_pk: [{
            pk_columns: {
                id: order.id
            },
            _set: {
                driver_id: driver.id,
                taxi_company_id: driver.companyId,
                counter_offers: $`counter_offers`,
                cost: order.cost,
            }
        }, {
            id: true,
            chat_id: true,
        }]
    }, {
        "counter_offers": order.counterOffers
    });
    
    if(response.update_taxi_order_by_pk == null) {
        throw new MezError("orderNotFound");
    }

    await chain.mutation({
        insert_chat_participant: [{
            objects: [{
                chat_id: response.update_taxi_order_by_pk.chat_id,
                app_type_id: AppType.Taxi,
                participant_id: driver.userId
            }]
        }, {
            returning: {
                id: true,
            }
        }]
    })
}