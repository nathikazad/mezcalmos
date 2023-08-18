import { getHasura } from "../../../../utilities/hasura";
import { AppType, AuthorizationStatus, Language, MezError } from "../../../models/Generic/Generic";
import { TaxiDriver } from "../../../models/Services/Taxi/Taxi";

export async function getTaxiDrivers(taxiCompanyIds: number[]): Promise<TaxiDriver[]> {

  let chain = getHasura();
  let response = await chain.query({
    taxi_company: [{
      where: {
        id: {
          _in: taxiCompanyIds
        }
      }
    }, {
      id: true
    }],
    taxi_driver: [{
      where: {
        taxi_company_id: {
          _in: taxiCompanyIds
        }
      }
    }, {
        id: true,
        user_id: true,
        taxi_company_id: true,
        status: true,
        online: true,
        current_location: true,
        user: {
          firebase_id: true,
          language_id: true,
          image: true,
          name: true,
          phone: true
        },
        notification_info: {
          token: true,
          turn_off_notifications: true
        },
        taxi: {
          id: true,
          car_name: true,
          car_number: true,
          cost_per_km: true,
          minimum_cost: true
        }
      }]
  });
    if(response.taxi_company.length == 0) {
      throw new MezError("noTaxiCompanyFound");
    }
    if (response.taxi_driver.length == 0) {
      throw new MezError("taxiCompaniesHaveNoDrivers");
    }
    return response.taxi_driver.map((d) => {
      return {
        id: d.id,
        userId: d.user_id,
        taxiCompanyId: d.taxi_company_id,
        status: d.status as AuthorizationStatus,
        online: d.online,
        user: {
          id: d.user_id,
          firebaseId: d.user.firebase_id,
          language: d.user.language_id as Language,
          image: d.user.image,
          name: d.user.name,
          phoneNumber: d.user.phone
        },
        notificationInfo: (d.notification_info) ? {
          appType: AppType.Taxi,
          token: d.notification_info.token,
          turnOffNotifications: d.notification_info.turn_off_notifications
        } : undefined,
        taxi: {
          carName: d.taxi.car_name,
          carNumber: d.taxi.car_number,
          id: d.taxi.id,
          costPerKm: d.taxi.cost_per_km,
          minimumCost: d.taxi.minimum_cost
        }
      }
    });
}
  
export async function getTaxiDriver(driverId: number): Promise<TaxiDriver> {

  let chain = getHasura();
  let response;
    response = await chain.query({
      taxi_driver_by_pk: [{
        id: driverId
      }, {
        user_id: true,
        taxi_company_id: true,
        status: true,
        online: true,
        // current_location: true,
        user: {
          firebase_id: true,
          language_id: true,
          image: true,
          name: true,
          phone: true
        },
        notification_info: {
          token: true,
          turn_off_notifications: true
        },
        taxi: {
          id: true,
          car_name: true,
          car_number: true,
        }
      }]
    });
    if (response.taxi_driver_by_pk == null) {
      throw new MezError("driverNotFound");
    }
    return {
      id: driverId,
      userId: response.taxi_driver_by_pk.user_id,
      taxiCompanyId: response.taxi_driver_by_pk.taxi_company_id,
      status: response.taxi_driver_by_pk.status as AuthorizationStatus,
      online: response.taxi_driver_by_pk.online,
      user: {
        id: response.taxi_driver_by_pk.user_id,
        firebaseId: response.taxi_driver_by_pk.user.firebase_id,
        language: response.taxi_driver_by_pk.user.language_id as Language,
        image: response.taxi_driver_by_pk.user.image,
        name: response.taxi_driver_by_pk.user.name,
        phoneNumber: response.taxi_driver_by_pk.user.phone
      },
      notificationInfo: (response.taxi_driver_by_pk.notification_info) ? {
        appType: AppType.Delivery,
        token: response.taxi_driver_by_pk.notification_info.token,
        turnOffNotifications: response.taxi_driver_by_pk.notification_info.turn_off_notifications
      } : undefined,
      taxi: {
        id: response.taxi_driver_by_pk.taxi.id,
        carName: response.taxi_driver_by_pk.taxi.car_name,
        carNumber: response.taxi_driver_by_pk.taxi.car_number,
      }
      // currentLocation: response.taxi_driver_by_pk.current_location
      // deliveryDriverType: ParticipantType.DeliveryDriver
    }
  // }
}