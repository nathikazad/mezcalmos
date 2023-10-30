import * as functions from 'firebase-functions';
import * as nodemailer from 'nodemailer';
import { CustomerAppType } from '../../shared/models/Generic/Generic';

// Create a Nodemailer transporter object
const transporter = nodemailer.createTransport({
  host: 'mail.privateemail.com',
  port: 587,
  secure: false,  // true for 465 (SSL), false for 587 (TLS/STARTTLS)
  auth: {
    user: functions.config().email.username,
    pass: functions.config().email.password,
  },
});




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

  const tripDistanceKm = (taxiRequest.tripDistance / 1000).toFixed(2);  // Convert meters to kilometers and round to 2 decimal places
  const tripDurationMin = (taxiRequest.tripDuration / 60).toFixed(2);  // Convert seconds to minutes and round to 2 decimal places

  // Construct the email text using the taxi request parameters
  const emailText = `
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
    Trip Polyline: ${taxiRequest.tripPolyline}
  `;

  const mailOptions = {
    from: functions.config().email.username,
    to: "nathikazad@gmail.com",
    subject: 'New Taxi Request',
    text: emailText,
  };

  try {
    // Send email
    const info = await transporter.sendMail(mailOptions);
    console.log('Email sent:', info.response);
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
