import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import { addNewReferral } from '../serviceProvider/addReferral';
import { getUserFromFbId } from '../shared/graphql/user/getUser';
import { UserInfo } from '../shared/models/Generic/User';
import { MezError } from '../shared/models/Generic/Generic';

const getClientIp = (req: functions.Request): string => {
  let forwarded = req.headers['x-forwarded-for'];
  if (typeof forwarded === 'string') {
    forwarded = forwarded.split(',')[0];
  } else if (Array.isArray(forwarded)) {
    forwarded = forwarded[0];
  }
  return forwarded || req.ip;
};




// Cloud function to save IP and referral code
export async function saveIpReferral(request: functions.https.Request, response: functions.Response) {
  response.set('Access-Control-Allow-Origin', '*');
  response.set('Access-Control-Allow-Methods', 'GET, POST');
  response.set('Access-Control-Allow-Headers', 'Content-Type');

  const referralCode = request.body.referral_code;
  const ipAddress = getClientIp(request);

  // Save IP address and referral code to Firebase Database
  const ipSaveRef = admin.database().ref(`/ipSaves/${ipAddress}`);
  await ipSaveRef.set(referralCode);

  const responseData = {
    ip_address: ipAddress,
    referral_code: referralCode,
  };

  response.json(responseData);
};

// Cloud function to increment referral code count
export async function incrementReferralCount(request: functions.https.Request, response: functions.Response) {
  response.set('Access-Control-Allow-Origin', '*');
  response.set('Access-Control-Allow-Methods', 'GET, POST');
  response.set('Access-Control-Allow-Headers', 'Content-Type');

  const ipAddress: string = request.query.ip as string || getClientIp(request);
  const uid: string = request.query.uid as string; // assuming you're passing the user id in the request query
  // console.log("uid: ", uid);
  // Fetch the referral code from Firebase Database
  const ipSaveRef = admin.database().ref(`/ipSaves/${ipAddress}`);
  const snapshot = await ipSaveRef.once('value');
  const referralCode = snapshot.val();

  if (referralCode) {

    // Increment the referral count
    try {
      let hsUser: UserInfo | undefined;
      for(let i=0; i<6; i++) {
        hsUser = await getUserFromFbId(uid);
        if(hsUser) {
          break;
        } else {
          await new Promise(resolve => setTimeout(resolve, 10 * 1000));
        }
      }
      if(!hsUser) {
        throw new MezError("userNotFound");
      }
      // const referralRes = 
      await addNewReferral(hsUser.id, { uniqueId: referralCode});
      // console.log("referralRes: ", referralRes);
      
      response.send(`Referral count incremented for referral code: ${referralCode}`);

    } catch (error) {
      console.log("error: ", error);
      response.send(`Error while incrementing referral: ${error}`);
    }
    // Mark the referral code as used without overwriting existing claims
    // await admin.auth().setCustomUserClaims(uid, { ...existingClaims, isReferralCodeUsed: true });

    // Remove IP address from ipSaves
    await ipSaveRef.remove();
    
  } else {
    response.send(`No referral code found for IP: ${ipAddress}`);
  }
};

