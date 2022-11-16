import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graphql/client.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart' show mezDbgPrint;
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class HasuraDb {
  late GraphQLClient graphQLClient;
  WebSocketLink? _wsLink;
  AppLaunchMode appLaunchMode;
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  HasuraDb(this.appLaunchMode);

  Future<void> initializeHasura({bool withAuthenticatedUser = false}) async {
    mezDbgPrint("Inside initializeHasura $withAuthenticatedUser");
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
    Map<String, String> headers = <String, String>{};
    HttpLink _httpLink = HttpLink(hasuraDbLink, defaultHeaders: headers);
    Link _link = _httpLink;

    if (withAuthenticatedUser) {
      if (fireAuth.FirebaseAuth.instance.currentUser == null) {
        mezDbgPrint("Cannot initialize Hasura with user authentication");
      } else {
        final String hasuraAuthToken = await _getAuthorizationToken(
            fireAuth.FirebaseAuth.instance.currentUser!,
            appLaunchMode == AppLaunchMode.dev);
        headers = <String, String>{'Authorization': 'Bearer $hasuraAuthToken'};
        final AuthLink _authLink =
            AuthLink(getToken: () async => 'Bearer $hasuraAuthToken');
        _httpLink = HttpLink(hasuraDbLink, defaultHeaders: headers);
        _link = _authLink.concat(_httpLink);
      }
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
}

    // import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
    // import 'package:mezcalmos/Shared/graphql/restaurant/__generated/restaurant.graphql.dart';
    // import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
    // import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
    // import 'package:mezcalmos/Shared/graphql/restaurant/mezRestaurant.dart';

    // final QueryResult result = await graphQLClient
    //     .query(QueryOptions(document: gql(r'''subscription GetRestaurants {
    //     restaurant {
    //       id
    //       name
    //       location_text
    //       status
    //       image
    //       description {
    //         translations {
    //           language_id
    //           value
    //         }
    //       }
    //       payment_info {
    //         bank_transfer
    //         card
    //         cash
    //       }
    //     }
    //   }''')));

    // mezDbgPrint("HASURAAAAA result3");
    // mezDbgPrint(result.data);

    // if (!withAuthenticatedUser)
    //   fireAuth.FirebaseAuth.instance.signInWithEmailAndPassword(
    //       email: "customer@customer.com", password: "password");