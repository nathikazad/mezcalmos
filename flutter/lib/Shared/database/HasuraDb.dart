import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart' show mezDbgPrint;
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';

class HasuraDb {
  late GraphQLClient graphQLClient;

  WebSocketLink? _wsLink;
  AppLaunchMode appLaunchMode;
  // FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  HasuraDb(this.appLaunchMode);
  Map<String, HasuraSubscription> hasuraSubscriptions =
      <String, HasuraSubscription>{};
  String? _appLifeCyclePauseCallbackId;
  String? _appLifeCycleResumeCallbackId;
  final AppLifeCycleController _appLifeCycleController =
      Get.find<AppLifeCycleController>();
  Future<void> initializeHasura() async {
    mezDbgPrint("Inside initializeHasura");
    late String hasuraDbLink;
    switch (appLaunchMode) {
      case AppLaunchMode.prod:
        hasuraDbLink = hasuraProdLink;
        break;
      case AppLaunchMode.stage:
        hasuraDbLink = hasuraDevLink; // hasuraStageLink;
        break;
      case AppLaunchMode.dev:
        hasuraDbLink = hasuraDevLink;
        break;
    }
    Map<String, String> headers = <String, String>{
      "x-hasura-admin-secret": "myadminsecretkey"
    };
    HttpLink _httpLink = HttpLink(hasuraDbLink, defaultHeaders: headers);
    Link _link = _httpLink;

    if (fireAuth.FirebaseAuth.instance.currentUser != null) {
      mezDbgPrint("[777] USER-> ${fireAuth.FirebaseAuth.instance.currentUser}");
      final String hasuraAuthToken = await _getAuthorizationToken(
        fireAuth.FirebaseAuth.instance.currentUser!,
        appLaunchMode == AppLaunchMode.dev,
      );
      mezDbgPrint("ROLE ${_getRoleBasedOnApp()}");
      mezDbgPrint("TOKEN $hasuraAuthToken");
      headers = <String, String>{
        'Authorization': 'Bearer $hasuraAuthToken',
        'x-hasura-role': _getRoleBasedOnApp()
      };
      final AuthLink _authLink =
          AuthLink(getToken: () async => 'Bearer $hasuraAuthToken');
      _httpLink = HttpLink(hasuraDbLink, defaultHeaders: headers);
      _link = _authLink.concat(_httpLink);
    }
    _wsLink = WebSocketLink("ws://127.0.0.1:8080/v1/graphql",
        config: SocketClientConfig(
          autoReconnect: true,
          inactivityTimeout: Duration(seconds: 30),
          initialPayload: () async {
            return {
              'headers': headers,
            };
          },
        ));

    _link = Link.split(
        (Request request) => request.isSubscription, _wsLink!, _link);

    graphQLClient = GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );

    if (_appLifeCyclePauseCallbackId != null)
      _appLifeCycleController.removeCallbackIdOfState(
          AppLifecycleState.paused, _appLifeCyclePauseCallbackId);
    if (_appLifeCycleResumeCallbackId != null)
      _appLifeCycleController.removeCallbackIdOfState(
          AppLifecycleState.resumed, _appLifeCycleResumeCallbackId);

    _appLifeCyclePauseCallbackId =
        _appLifeCycleController.attachCallback(AppLifecycleState.paused, () {
      hasuraSubscriptions.forEach(
          (String subscriptionId, HasuraSubscription hasuraSubscription) {
        pauseSubscription(subscriptionId);
      });
      //kill timer to refresh JWT
    });

    _appLifeCycleResumeCallbackId =
        _appLifeCycleController.attachCallback(AppLifecycleState.resumed, () {
      // check if JWT is valid
      // if not create new JWT
      // start timer to refresh JWT
      hasuraSubscriptions.forEach(
          (String subscriptionId, HasuraSubscription hasuraSubscription) {
        resumeSubscription(subscriptionId);
      });
    });
  }

  Future<String> _getAuthorizationToken(User user, bool testMode) async {
    final String token = await user.getIdToken(true);
    if (testMode) {
      final Map<String, dynamic> decoded = JwtDecoder.decode(token);
      final JwtClaim claims = JwtClaim.fromMap(decoded, defaultIatExp: false);
      return issueJwtHS256(claims, 'secret-for-testing-locally-with-emulator');
    }
    return token;
  }

  /// this return by default customer we are not handling all app types
  String _getRoleBasedOnApp() {
    final AppType appType = Get.find<SettingsController>().appType;
    switch (appType) {
      case AppType.CustomerApp:
        return "customer";
      case AppType.DeliveryAdminApp:
        return "mez_admin";
      case AppType.DeliveryApp:
        return "deliverer";
      case AppType.RestaurantApp:
        return "restaurant_operator";

      default:
        return "customer";
    }
  }

  String createSubscription(
      {required Function start, required Function cancel}) {
    final String subscriptionId = getRandomString(10);
    hasuraSubscriptions[subscriptionId] = HasuraSubscription(start, cancel);
    start();
    return subscriptionId;
  }

  void resumeSubscription(String subscriptionId) {
    hasuraSubscriptions[subscriptionId]?.start();
  }

  void pauseSubscription(String subscriptionId) {
    hasuraSubscriptions[subscriptionId]?.cancel();
  }

  void cancelSubscription(String subscriptionId) {
    hasuraSubscriptions[subscriptionId]?.cancel();
    hasuraSubscriptions.remove(subscriptionId);
  }
}

class HasuraSubscription {
  Function start;
  Function cancel;
  HasuraSubscription(this.start, this.cancel);
}
