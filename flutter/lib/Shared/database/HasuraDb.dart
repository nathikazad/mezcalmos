import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart' show mezDbgPrint;
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

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
    final HttpLink _httpLink = HttpLink(hasuraDbLink,
        defaultHeaders: {'x-hasura-admin-secret': 'myadminsecretkey'});
    Link _link = _httpLink;
    final dynamic initialPayload = <dynamic, dynamic>{
      'headers': {'x-hasura-admin-secret': 'myadminsecretkey'},
    };
    // if (withAuthenticatedUser) {
    //   final AuthController _authController = Get.find<AuthController>();
    //   if (_authController.fireAuthUser == null) {
    //     mezDbgPrint("Cannot initialize Hasura with user authentication");
    //   } else {
    //     final String hasuraAuthToken =
    //         await _getAuthorizationToken(_authController.fireAuthUser!);
    //     final AuthLink _authLink =
    //         AuthLink(getToken: () async => 'Bearer $hasuraAuthToken');
    //     _httpLink = HttpLink(hasuraDbLink, defaultHeaders: {
    //       'Authorization': 'Bearer $hasuraAuthToken',
    //     });
    //     _link = _authLink.concat(_httpLink);
    //     initialPayload = <dynamic, dynamic>{
    //       'headers': {'Authorization': 'Bearer $hasuraAuthToken'},
    //     };
    //   }
    // }
    _wsLink = WebSocketLink("ws://127.0.0.1:8080/v1/graphql",
        config: SocketClientConfig(
          autoReconnect: true,
          inactivityTimeout: Duration(seconds: 30),
          initialPayload: () async {
            return {
              'headers': {'x-hasura-admin-secret': 'myadminsecretkey'},
            };
          },
        ));

    _link = Link.split(
        (Request request) => request.isSubscription, _wsLink!, _link);

    graphQLClient = GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );

    mezDbgPrint("writing to hasura");
    Category getTestCatgeory() {
      final List<Choice> choices = [
        Choice(
            id: "kk",
            available: true,
            name: <LanguageType, String>{
              LanguageType.EN: "Second Choice name in english",
              LanguageType.ES: "Second Choice name in spanish",
            },
            cost: 5),
      ];
      final List<Option> options = [
        Option(
          id: "kk",
          optionType: OptionType.ChooseOne,
          name: <LanguageType, String>{
            LanguageType.EN: "Option name in english",
            LanguageType.ES: "Option name in spanish",
          },
        )
      ];
      options.first.choices.addAll(choices);
      final List<Item> items = [
        Item(
          name: <LanguageType, String>{
            LanguageType.EN: "Item name in english",
            LanguageType.ES: "Item name in spanish",
          },
          description: <LanguageType, String>{
            LanguageType.EN: "Item Description in english",
            LanguageType.ES: "Item Description in spanish",
          },
          cost: 20,
        )
      ];
      items.first.options.addAll(options);

      final Category category = Category(
        name: <LanguageType, String>{
          LanguageType.EN: "Category name in english",
          LanguageType.ES: "Category name in spanish",
        },
        dialog: <LanguageType, String>{
          LanguageType.EN: "Category Description in english",
          LanguageType.ES: "Category Description in spanish",
        },
        position: 10,
      );
      category.items.addAll(items);
      return category;
    }

    // await writeCategoryToHasura(getTestCatgeory());

    // await writeCategoryToHasura(
    //   Category(
    //     name: <LanguageType, String>{
    //       LanguageType.EN: "Category name in english",
    //       LanguageType.ES: "Category name in spanish",
    //     },
    //     dialog: <LanguageType, String>{
    //       LanguageType.EN: "Category Description in english",
    //       LanguageType.ES: "Category Description in spanish",
    //     },
    //     position: 10,
    //   ),
    // );

    // mezDbgPrint("Hasura subscription");
    // unawaited(graphQLClient.query$RestaurantItem().then((result) {
    //   mezDbgPrint("HASURAAAAA result1");
    //   mezDbgPrint(result.parsedData?.restaurant_item[0].cost);
    //   // mezDbgPrint(result.parsedData?.restaurant_item[0].cost);
    //   // mezDbgPrint(result.parsedData?.restaurant_item[0].location_gps.longitude);
    //   // mezDbgPrint(result.parsedData?.restaurant[0].name);
    //   // result.parsedData?.restaurant
    //   //     .forEach(((element) => mezDbgPrint(element.name)));
    // }));

    // graphQLClient
    //     .subscribe(
    //         SubscriptionOptions(document: documentNodeQueryGetRestaurants))
    //     .listen((result) {
    //   mezDbgPrint("HASURAAAAA result2");
    //   mezDbgPrint(result.data);
    //   // mezDbgPrint(result.parsedData?.restaurant[0].name);
    //   // result.parsedData?.restaurant
    //   //     .forEach(((element) => mezDbgPrint(element.name)));
    // });

    // graphQLClient
    //     .subscribe(
    //         SubscriptionOptions(document: gql(r'''subscription GetRestaurants {
    //             restaurant {
    //               id
    //               name
    //               location_text
    //               status
    //               image
    //               description {
    //                 translations {
    //                   language_id
    //                   value
    //                 }
    //               }
    //               payment_info {
    //                 bank_transfer
    //                 card
    //                 cash
    //               }
    //             }
    //           }''')))
    //     .listen((result) {
    //   mezDbgPrint("HASURAAAAA result3");
    //   mezDbgPrint(result.data);
    //   // mezDbgPrint(result.parsedData?.restaurant[0].name);
    //   // result.parsedData?.restaurant
    //   //     .forEach(((element) => mezDbgPrint(element.name)));
    // });
  }

  // DocumentNode documentNodeQueryGetRestaurants = DocumentNode(definitions: [
  //   OperationDefinitionNode(
  //     type: OperationType.subscription,
  //     name: NameNode(value: 'GetRestaurants'),
  //     variableDefinitions: [],
  //     directives: [],
  //     selectionSet: SelectionSetNode(selections: [
  //       FieldNode(
  //         name: NameNode(value: 'restaurant'),
  //         alias: null,
  //         arguments: [],
  //         directives: [],
  //         selectionSet: SelectionSetNode(selections: [
  //           FieldNode(
  //             name: NameNode(value: 'image'),
  //             alias: null,
  //             arguments: [],
  //             directives: [],
  //             selectionSet: null,
  //           ),
  //           FieldNode(
  //             name: NameNode(value: '__typename'),
  //             alias: null,
  //             arguments: [],
  //             directives: [],
  //             selectionSet: null,
  //           ),
  //         ]),
  //       ),
  //       FieldNode(
  //         name: NameNode(value: '__typename'),
  //         alias: null,
  //         arguments: [],
  //         directives: [],
  //         selectionSet: null,
  //       ),
  //     ]),
  //   ),
  // ]);

  Future<String> _getAuthorizationToken(User user) async {
    final IdTokenResult? tokenResult = await user.getIdTokenResult();
    if (tokenResult?.claims?['https://hasura.io/jwt/claims'] == null) {
      mezDbgPrint("No token, calling addHasuraClaims");
      await FirebaseFunctions.instance.httpsCallable('hasura-addClaims').call();
    } else if (await _checkIfAdminNeededButNotGiven(tokenResult!)) {
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
