// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'dart:math';

// import 'package:cloud_functions/cloud_functions.dart';
// import 'package:crypto/crypto.dart';
// import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
// import 'package:firebase_core/firebase_core.dart' as firebase_core;
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:mezcalmos/Shared/constants/global.dart';
// import 'package:mezcalmos/Shared/controllers/firbaseAuthController.dart';
// import 'package:mezcalmos/Shared/controllers/languageController.dart';
// import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
// import 'package:mezcalmos/Shared/firebaseNodes/rootNodes.dart';
// import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
// import 'package:mezcalmos/Shared/models/User.dart';
// import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
// import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
// import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
// // import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/firbaseAuthController.dart';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthController extends FirbaseAuthController {
  Function onSignOutCallback;
  Function onSignInCallback;
  AuthController(this.onSignInCallback, this.onSignOutCallback)
      : super(onSignOutCallback, onSignInCallback);
  @override
  Future signInWithFacebook() async {
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
              position: SnackPosition.BOTTOM,
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

  @override
  Future signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final String rawNonce = ggenerateNonce();
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
            position: SnackPosition.TOP,
          );
          return null;
        }
      }));
    } catch (exception) {
      mezDbgPrint(exception);
      MezSnackbar("Notice ~", "Failed SignIn with Apple !");
      throw exception;
    }
  }
}
