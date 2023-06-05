import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

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
  const referralCode = request.query.referral_code;
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
  const ipAddress: string = request.query.ip as string || getClientIp(request);
  const uid: string = request.query.uid as string; // assuming you're passing the user id in the request query

  // Fetch the referral code from Firebase Database
  const ipSaveRef = admin.database().ref(`/ipSaves/${ipAddress}`);
  const snapshot = await ipSaveRef.once('value');
  const referralCode = snapshot.val();

  if (referralCode) {
    // Fetch the user's custom claims
    const user = await admin.auth().getUser(uid);
    const existingClaims = user.customClaims || {};
    const isReferralCodeUsed = existingClaims.isReferralCodeUsed;

    if (isReferralCodeUsed) {
      response.send(`Referral code '${referralCode}' has already been used.`);
      return;
    }

    // Increment the referral count
    const referralsRef = admin.database().ref(`/referrals/${referralCode}`);
    // TODO @sanchit, remove this db write and update to hasura instead
    await referralsRef.transaction(currentCount => {
      return (currentCount || 0) + 1;
    });

    // Mark the referral code as used without overwriting existing claims
    await admin.auth().setCustomUserClaims(uid, { ...existingClaims, isReferralCodeUsed: true });

    // Remove IP address from ipSaves
    await ipSaveRef.remove();

    response.send(`Referral count incremented for referral code: ${referralCode}`);
  } else {
    response.send(`No referral code found for IP: ${ipAddress}`);
  }
};

