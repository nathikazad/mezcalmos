import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

void SignTheUserWithFacbook()async{
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
}