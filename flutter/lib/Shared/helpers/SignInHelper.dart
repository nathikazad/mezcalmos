import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleSignInCreds {
  static String? appleName;
}

Future<void> signUp(String email, String password) async {
  try {
    await fireAuth.FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    await MezRouter.back();
  } catch (e) {
    customSnackBar(
      title: 'Error creating your account!',
      subTitle: e.toString(),
    );
  }
}

Future<void> signIn(String email, String password) async {
  try {
    await fireAuth.FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .timeout(Duration(seconds: 10),
            onTimeout: () =>
                Future.error(Exception("Timed out , Check your Internet.")))
        .then(
      (fireAuth.UserCredential value) {},
      onError: ((Object e, StackTrace stackTrace) {
        customSnackBar(
          title: 'Failed to Sign you in!',
          subTitle: e.toString(),
        );
      }),
    );
  } catch (e, s) {
    mezDbgPrint("owoawoaowaowoaow ==> $e | $s");
  }
}

Future<void> logOut() async {
  try {
    mezDbgPrint("AuthController: Sign out function");
    mezDbgPrint("AuthController: Sign out callbacks finished");
    await fireAuth.FirebaseAuth.instance.signOut();
    Get.find<AuthController>().setUserInfo = null;
    Get.appUpdate();
    mezDbgPrint("AuthController: Sign out finished");
  } catch (e) {
    customSnackBar(
      title: 'Failed to Sign you out!',
      subTitle: e.toString(),
    );
    print(e);
  }
}

Future<SendOtpResponse?> sendOTPForLogin(String phoneNumber) async {
  try {
    final SendOtpResponse res = await CloudFunctions.otp3_sendOTPForLogin(
        language: sDefaultLanguage.toFirebaseFormatString(),
        phoneNumber: phoneNumber);
    return res;
  } on FirebaseFunctionsException catch (e) {
    showErrorSnackBar(errorText: e.message.toString());
  } catch (e, stk) {
    // mezcalmosSnackBar("Notice ~", "Failed to send OTP message :( ");
    // _waitingResponse.value = false;
    mezDbgPrint("Exception happend in sendOTPForLogin : $e"); // i
    mezDbgPrint(e);
    mezDbgPrint(stk);
  }
  return null;
}

Future<AuthResponse?> signInUsingOTP(String phoneNumber, String otpCode) async {
  mezDbgPrint("$phoneNumber  < phone ------ otp > $otpCode");

  try {
    // _waitingResponse.value = true;
    final AuthResponse response = await CloudFunctions.otp3_getAuthUsingOTP(
      phoneNumber: phoneNumber,
      OTPCode: otpCode,
      // 'language': _settings.appLanguage.userLanguageKey,
    );

    if (response.success) {
      await fireAuth.FirebaseAuth.instance
          .signInWithCustomToken(response.token!)
          .catchError((Object error, StackTrace sr) {
        if (error.toString().contains('user-disabled')) {
          MezSnackbar(
            "Notice ~",
            "Your account has been deleted permanently!",
            position: Alignment.topCenter,
          );
        }
      });
    }
    return response;
  } catch (e) {
    // MezSnackbar("Oops ..", _i18n()['failedOTPConfirmRequest']);
    print("Exception happend in GetAuthUsingOTP : $e");
  }
  return null;
}

// flutter_facebook_auth Package causes a conflict with GetStorage !

Future<void> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult result = await FacebookAuth.instance.login();
  print(" FB AUTH STATUS +++++++++++++++++++++ ${result.status.toString()}");

  if (result.status == LoginStatus.success) {
    // Create a credential from the access token
    final fireAuth.OAuthCredential facebookAuthCredential =
        fireAuth.FacebookAuthProvider.credential(result.accessToken!.token);
    // Once signed in, return the UserCredential
    unawaited(
      fireAuth.FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential)
          .catchError((Object error, StackTrace sr) {
        if (error.toString().contains('user-disabled')) {
          MezSnackbar(
            "Notice ~",
            "Your account has been deleted permanently!",
            position: Alignment.topCenter,
          );
          throw Exception("Failed SignIn with Facebook !");
        }
      }),
    );
  } else {
    MezSnackbar("Notice ~", "Failed SignIn with Facebook !");
    throw Exception("Failed SignIn with Facebook !");
  }
}

Future<void> signInWithApple() async {
  // To prevent replay attacks with the credential returned from Apple, we
  // include a nonce in the credential request. When signing in in with
  // Firebase, the nonce in the id token returned by Apple, is expected to
  // match the sha256 hash of `rawNonce`.
  final String rawNonce = generateNonce();
  final String nonce = sha256ofString(rawNonce);

  try {
    // Request credential for the currently signed in Apple account.
    final AuthorizationCredentialAppleID appleCredential =
        await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    mezDbgPrint(appleCredential.authorizationCode);

    // Create an `OAuthCredential` from the credential returned by Apple.
    final fireAuth.OAuthCredential oauthCredential =
        fireAuth.OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    unawaited(fireAuth.FirebaseAuth.instance
        .signInWithCredential(oauthCredential)
        .catchError((Object error, StackTrace sr) {
      if (error.toString().contains('user-disabled')) {
        MezSnackbar(
          "Notice ~",
          "Your account has been deleted permanently!",
          position: Alignment.topCenter,
        );
      }
    }));

    if (appleCredential.givenName != null ||
        appleCredential.familyName != null) {
      AppleSignInCreds.appleName =
          ("${appleCredential.givenName} ${appleCredential.familyName}")
              .trimRight();
    }
    mezDbgPrint("💞💞💞💞💞 ${AppleSignInCreds.appleName}");
  } catch (exception) {
    mezDbgPrint(exception);
    MezSnackbar("Notice ~", "Failed SignIn with Apple !");
    throw exception;
  }
}

String generateNonce([int length = 32]) {
  final String charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  final Random random = Random.secure();
  return List.generate(length, (_) => charset[random.nextInt(charset.length)])
      .join();
}

String generateString() {
  final String charset = 'abcdefghijklmnopqrstuvwxyz';
  final Random random = Random.secure();
  return List.generate(10, (_) => charset[random.nextInt(charset.length)])
      .join();
}

/// Returns the sha256 hash of [input] in hex notation.
String sha256ofString(String input) {
  final List<int> bytes = utf8.encode(input);
  final Digest digest = sha256.convert(bytes);
  return digest.toString();
}
