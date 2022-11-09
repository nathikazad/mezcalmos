import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graphql/client.dart';
import 'package:gql/ast.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart' show mezDbgPrint;

class HasuraDb {
  late GraphQLClient graphQLClient;
  WebSocketLink? _wsLink;
  AppLaunchMode appLaunchMode;
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  HasuraDb(this.appLaunchMode);

  Future<void> initializeHasura({bool withAuthenticatedUser = false}) async {
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
    HttpLink _httpLink = HttpLink(hasuraDbLink,
        defaultHeaders: {'x-hasura-admin-secret': 'myadminsecretkey'});
    Link _link = _httpLink;
    dynamic initialPayload = <dynamic, dynamic>{
      'headers': {'x-hasura-admin-secret': 'myadminsecretkey'},
    };
    ;
    if (withAuthenticatedUser) {
      final AuthController _authController = Get.find<AuthController>();
      if (_authController.fireAuthUser == null) {
        mezDbgPrint("Cannot initialize Hasura with user authentication");
      } else {
        final String hasuraAuthToken =
            await _getAuthorizationToken(_authController.fireAuthUser!);
        final AuthLink _authLink =
            AuthLink(getToken: () async => 'Bearer $hasuraAuthToken');
        _httpLink = HttpLink(hasuraDbLink, defaultHeaders: {
          'Authorization': 'Bearer $hasuraAuthToken',
        });
        _link = _authLink.concat(_httpLink);
        initialPayload = <dynamic, dynamic>{
          'headers': {'Authorization': 'Bearer $hasuraAuthToken'},
        };
      }
    }
    _wsLink = WebSocketLink(
      hasuraDbLink.replaceAll("https", "wss"),
      config: SocketClientConfig(
        autoReconnect: true,
        inactivityTimeout: Duration(seconds: 30),
        initialPayload: initialPayload,
      ),
    );

    _link = Link.split(
        (Request request) => request.isSubscription, _wsLink!, _link);

    graphQLClient = GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );
  }

  Future<String> _getAuthorizationToken(User user) async {
    IdTokenResult? tokenResult = await user.getIdTokenResult();
    if (tokenResult.claims?['https://hasura.io/jwt/claims'] == null) {
      mezDbgPrint("No token, calling addHasuraClaims");
      await FirebaseFunctions.instance.httpsCallable('hasura-addClaims').call();
    } else if (await _checkIfAdminNeededButNotGiven(tokenResult)) {
      mezDbgPrint("Need admin priveleges, calling addHasuraClaims");
      await FirebaseFunctions.instance.httpsCallable('hasura-addClaims').call();
    }

    return Get.find<AuthController>().fireAuthUser!.getIdToken(true);
  }

  Future<bool> _checkIfAdminNeededButNotGiven(IdTokenResult tokenResult) async {
    bool isAdmin = false;
    try {
      (await _databaseHelper.firebaseDatabase
              .ref()
              .child("admins/${Get.find<AuthController>().fireAuthUser!.uid}")
              .once())
          .snapshot
          .value;
      // If value is returned, then user is admin, make isAdmin be true;
      isAdmin = true;
    } catch (e) {
      // If error is permission denied, then user is not admin, let isAdmin be false;
      if ((e as dynamic).details != "Permission Denied") {
        throw e;
      }
    }

    return (isAdmin &&
        !tokenResult.claims!['https://hasura.io/jwt/claims']
                ['x-hasura-allowed-roles']
            .toString()
            .contains("admin"));
  }
}
