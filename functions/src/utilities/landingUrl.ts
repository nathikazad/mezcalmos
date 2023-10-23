
import * as firebase from "firebase-admin";
import * as functions from 'firebase-functions';


export const getLandingUrl = functions.https.onCall(async (_, context) =>  {
    const xForwardedFor = context.rawRequest.headers['x-forwarded-for'];
    let ip:string = "192.168.0.11";
    if (xForwardedFor) {
      if (typeof xForwardedFor === 'string') {
        ip = hashIP(xForwardedFor);
      } else if (Array.isArray(xForwardedFor)) {
        ip = hashIP(xForwardedFor[0]);
      }
      
    }
    const incomingIPRef = firebase.database().ref("incomingIP");
    return (await incomingIPRef.child(ip).once('value')).val()?.path;
  });

  function hashIP(ipAddress: string): string {
    const octets = ipAddress.split('.');
    const hexOctets = octets.map(octet => parseInt(octet, 10).toString(16).padStart(2, '0'));
    return hexOctets.join('');
  }
  
  export const setLandingUrl = functions.https.onCall((data, context) => {
    const xForwardedFor = context.rawRequest.headers['x-forwarded-for'];
    let ip:string = "192.168.0.11";
    if (xForwardedFor) {
      if (typeof xForwardedFor === 'string') {
        ip = hashIP(xForwardedFor);
      } else if (Array.isArray(xForwardedFor)) {
        ip = hashIP(xForwardedFor[0]);
      }
      const optionalParam = data.optionalParam || "No optional parameter provided";
      const incomingIPRef = firebase.database().ref("incomingIP");
      incomingIPRef.child(ip).set(optionalParam);
    }
  });