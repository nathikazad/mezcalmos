import { TaxiCompanyDetails, TaxiCompanyError, } from "../../../taxi/createTaxiCompany";
import { getHasura } from "../../../utilities/hasura";
import { MezError } from "../../models/Generic/Generic";
import { Business } from "../../models/Services/Business/Business";
import { TaxiCompany } from "../../models/Services/Taxi/Taxi";


export async function createNewTaxiCompany(
    business: Business,
    taxiCompanyDetails: TaxiCompanyDetails,
): Promise<TaxiCompany> {
  let chain = getHasura();
  
  let response = await chain.mutation({
    insert_taxi_company_one: [{
      object: {
        business_id: business.id,
        cost_per_km: taxiCompanyDetails.costPerKm,
        maximum_delivery_distance: taxiCompanyDetails.maximumDeliveryDistance,
        minimum_cost: taxiCompanyDetails.minimumCost,
      }
    }, {
      id: true,
    }]
  })
  // console.log("response: ", response);

  if (response.insert_taxi_company_one == null) {

    throw new MezError(TaxiCompanyError.TaxiCompanyCreationError);
  }
  return {
    id: response.insert_taxi_company_one.id,
    businessId: business.id,
    maximumDeliveryDistance: taxiCompanyDetails.maximumDeliveryDistance,
    business,
    costPerKm: taxiCompanyDetails.costPerKm,
    minimumCost: taxiCompanyDetails.minimumCost,
  };
}