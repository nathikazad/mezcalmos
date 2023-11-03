import * as functions from 'firebase-functions';
import { CustomerAppType } from '../shared/models/Generic/Generic';
import { getHasura } from "../utilities/hasura"
import { $ } from '../../../hasura/library/src/generated/graphql-zeus';
import { sendEmail } from '../utilities/senders/email';





export interface Location {
  lat: number,
  lng: number,
  address: string;
}
export interface TaxiRequest {
  customerAppType: CustomerAppType;
  fromLocation: Location;
  toLocation: Location;
  rideCost: number;
  tripDistance: number;
  tripDuration: number;
  tripPolyline: string;
  orderTime: string;
  carType: string;
}

export interface TaxiRequestResponse {
  success: boolean;
  error?: TaxiRequestResponseError;
  unhandledError?: string;
  orderId?: number;
}

enum TaxiRequestResponseError {
  UnhandledError = "unhandledError",

}

export async function requestTaxi(customerId: number, taxiRequest: TaxiRequest): Promise<TaxiRequestResponse> {
  const hasura = getHasura();
  const tripDistanceKm = (taxiRequest.tripDistance / 1000).toFixed(2);  // Convert meters to kilometers and round to 2 decimal places
  const tripDurationMin = (taxiRequest.tripDuration / 60).toFixed(2);  // Convert seconds to minutes and round to 2 decimal places
  const user = await hasura.query({
    user_by_pk: [{
      id: customerId
    }, {
      name: true,
      phone: true
    }]
  })
  // Construct the email text using the taxi request parameters
  const emailText = `
    Customer:
      Name: ${user.user_by_pk?.name}
      Phone number: ${user.user_by_pk?.phone}
    Time: ${taxiRequest.orderTime}
    From Location:
      Latitude: ${taxiRequest.fromLocation.lat}
      Longitude: ${taxiRequest.fromLocation.lng}
      Address: ${taxiRequest.fromLocation.address}
      Link: https://www.google.com/maps/?q=${taxiRequest.fromLocation.lat},${taxiRequest.fromLocation.lng}
    To Location:
      Latitude: ${taxiRequest.toLocation.lat}
      Longitude: ${taxiRequest.toLocation.lng}
      Address: ${taxiRequest.toLocation.address}
      Link: https://www.google.com/maps/?q=${taxiRequest.toLocation.lat},${taxiRequest.toLocation.lng}

    Ride Cost: $${taxiRequest.rideCost.toFixed(2)}
    Trip Distance: ${tripDistanceKm} km
    Trip Duration: ${tripDurationMin} minutes
    Car Type: ${taxiRequest.carType}
  `;

  const mailOptions = {
    from: functions.config().email.username,
    to: "nathikazad@gmail.com",
    subject: 'New Taxi Request',
    text: emailText,
  };

  hasura.mutation({
    insert_taxi_order_one: [{
      object : {
        customer_id: customerId,
        dropoff_gps: $`dropoff_gps`,
        dropoff_address: taxiRequest.toLocation.address,
        pickup_gps: $`pickup_gps`,
        pickup_address: taxiRequest.fromLocation.address,
        status: "open",
        car_type: taxiRequest.carType,
        ride_cost: taxiRequest.rideCost,
        trip_distance: taxiRequest.tripDistance,
        trip_duration: taxiRequest.tripDuration,
        trip_polyline: taxiRequest.tripPolyline,
        driver_id: 31
      }, 
    }, {
      id: true
    }]
  }, {
    "dropoff_gps": {
      "type": "Point",
      "coordinates": [taxiRequest.toLocation.lng, taxiRequest.toLocation.lat ],
    },
    "pickup_gps": {
      "type": "Point",
      "coordinates": [taxiRequest.fromLocation.lng, taxiRequest.fromLocation.lat ],
    },
  })

  
  try {
    await sendEmail(mailOptions);
    mailOptions.to = functions.config().email.to
    await sendEmail(mailOptions);
    return {
      success: true,
    };
  } catch (error: any) {
    console.error('Error sending email:', error);
    return {
      success: false,
      error: TaxiRequestResponseError.UnhandledError,
      unhandledError: error.message
    };
  }

  
}
