import 'package:http/http.dart' as http;
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/env.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';

Future<void> saveReferral(String referralCode) async {
  final User? user = FirebaseAuth.instance.currentUser;
  mezDbgPrint("saveReferral $user");
  // Check if the user is signed in and if customClaim isReferralCodeUsed is false
  if (user != null) {
    return;
  }

  // TODO: @sanchit url add for staging
  Uri url = Uri.parse(
      'https://us-central1-mezcalmos-31f1c.cloudfunctions.net/referral-saveIpReferral');
  if (MezEnv.appLaunchMode == AppLaunchMode.stage) {
    url = Uri.parse(
        'https://us-central1-mezcalmos-staging.cloudfunctions.net/referral-saveIpReferral');
  }
  // Send the referral code to the cloud function
  late http.Response response;
  try {
    response = await http.post(url, body: {'referral_code': referralCode});
  } catch (e) {
    mezDbgPrint("saveReferral error $e");
  }
  // Parse the response JSON
  final Map<String, dynamic> responseData =
      jsonDecode(response.body) as Map<String, dynamic>;
  // Save the IP address to local storage
  final String ipAddress = responseData['ip_address'] as String;
  // TODO: @sanchit maybe use different way to local storage
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('ip_address', ipAddress);
}

Future<void> incrementReferralIfItExists() async {
  final User? user = FirebaseAuth.instance.currentUser;
  mezDbgPrint("incrementReferralIfItExists");
  if (user == null) return;
  // Check if the IP address exists in local storage
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (!prefs.containsKey('ip_address')) {
    print('IP address not found in local storage.');
    // return;
  }

  // Retrieve the IP address from local storage
  final String? ipAddress = prefs.getString('ip_address');
  // final IdTokenResult tokenResult = await user.getIdTokenResult(true);
  // Check if the referral increment has already been applied in custom claims
  // final bool isReferralCodeUsed =
  //     tokenResult.claims?['isReferralCodeUsed'] ?? false;

  // TODO: @sanchit add for staging
  String functionUrl =
      'https://us-central1-mezcalmos-31f1c.cloudfunctions.net/referral-incrementReferralCount?uid=${user.uid}';
  if (MezEnv.appLaunchMode == AppLaunchMode.stage) {
    functionUrl =
        'https://us-central1-mezcalmos-staging.cloudfunctions.net/referral-incrementReferralCount?uid=${user.uid}';
  }
  if (ipAddress != null) functionUrl += '&ip=$ipAddress';
  // if (!isReferralCodeUsed) {
  final Uri url = Uri.parse(functionUrl);
  late http.Response response;
  try {
    response = await http.get(url);
  } catch (e) {
    mezDbgPrint("incrementReferralIfItExists error $e");
  }
  // Check the response status code to determine if the increment was successful
  if (response.statusCode == 200) {
    print('Referral count incremented successfully for IP: $ipAddress');
    // Remove the IP address from local storage
    await prefs.remove('ip_address');
  } else {
    print('Error incrementing referral count for IP: $ipAddress');
  }
  // } else {
  //   print('Referral increment not applicable for the user.');
  // }
}

Future<void> ifUserJustSignedUp(User user) async {
  UserMetadata metadata = user.metadata;

  if (metadata.lastSignInTime != null &&
      metadata.creationTime != null &&
      (metadata.lastSignInTime!.millisecondsSinceEpoch -
              metadata.creationTime!.millisecondsSinceEpoch <
          2 * 60 * 1000)) {
    print('This user just signed up');
    await incrementReferralIfItExists();
  } else {
    print('This user has signed in before');
  }
}
