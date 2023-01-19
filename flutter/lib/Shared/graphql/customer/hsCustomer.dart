import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/CustomerApp/models/CustStripeInfo.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/customer/__generated/customer.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryMode.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

final GraphQLClient _graphClient = Get.find<HasuraDb>().graphQLClient;

Future<Customer?> get_customer({required int user_id}) async {
  final QueryResult<Query$get_customer_info> cusInfo =
      await _graphClient.query$get_customer_info(
    Options$Query$get_customer_info(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Query$get_customer_info(customer_id: user_id),
    ),
  );

  if (cusInfo.hasException) {
    mezDbgPrint(
        "[tt] Called :: get_customer_info :: exception :: ${cusInfo.exception}");
  }

  final List<Query$get_customer_info$customer_customer>? _cus =
      cusInfo.parsedData?.customer_customer;

  if (_cus != null && _cus.isNotEmpty) {
    mezDbgPrint(
        "[tt] Called :: get_customer_info :: SUCCESS :: got_customer(${_cus[0].user.name})");

    final Customer returnedCustomer = Customer(
      appVersion: _cus[0].app_version,
      notificationInfo: _cus[0].notification_token,
    );
    if (_cus[0].stripe_info != null) {
      _cus[0].stripe_info["cards"].forEach((key, data) {
        returnedCustomer.addCreditCard(CreditCard.fromData(data: data));
      });
    }

    // Adding Saved Locations!
    _cus[0].saved_locations.forEach(
        (Query$get_customer_info$customer_customer$saved_locations sLocation) {
      mezDbgPrint("[tt] Found new Saved Location ==> ${sLocation.id}");
      returnedCustomer.addSavedLocation(
        SavedLocation(
          name: sLocation.name,
          id: sLocation.id,
          location: Location(
            sLocation.location_text,
            sLocation.location_gps.toLocationData(),
          ),
          defaultLocation: sLocation.$default,
        ),
      );
    });

    // TODO : ADD Saved Credit Cards.

    return returnedCustomer;
  } else {
    mezDbgPrint("[tt] No such customer exists :: id($user_id)");
  }
  return null;
}

Future<Customer?> set_customer_info({
  required String app_version,
  required int user_id,
}) async {
  final QueryResult<Mutation$set_customer_info> _res =
      await _graphClient.mutate$set_customer_info(
    Options$Mutation$set_customer_info(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$set_customer_info(
        user_id: user_id,
        app_version: app_version,
      ),
    ),
  );

  if (_res.hasException) {
    mezDbgPrint(
        "[tt] Called :: set_customer_info :: exception :: ${_res.exception}");
    return null;
  } else {
    mezDbgPrint("[tt] Called :: set_customer_info :: SUCCESS");

    return Customer(appVersion: app_version);
  }
}

Future<void> set_customer_app_version(
    {required String version, required int customer_id}) async {
  final QueryResult<Mutation$set_customer_app_version> _res =
      await _graphClient.mutate$set_customer_app_version(
    Options$Mutation$set_customer_app_version(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$set_customer_app_version(
          customer_id: customer_id, version: version),
    ),
  );

  if (_res.hasException) {
    mezDbgPrint(
        "[tt] Called :: set_customer_app_version :: exception :: ${_res.exception}");
  } else {
    mezDbgPrint("[tt] Called :: set_customer_app_version :: SUCCESS");
  }
}

Future set_notification_token(
    {required String token, required int customer_id}) async {
  final QueryResult<Mutation$set_notif_token> _res =
      await _graphClient.mutate$set_notif_token(
    Options$Mutation$set_notif_token(
      variables: Variables$Mutation$set_notif_token(
          customer_id: customer_id, token: token),
    ),
  );

  if (_res.parsedData?.update_notification_info == null) {
    throw Exception(
        " 🛑🛑🛑🛑🛑 set_notification_token :: exception :: ${_res.exception}");
  } else {
    mezDbgPrint(" ✅✅✅✅✅ update notif token success");
  }
}

Future<CustStripeInfo> update_customer_stripe_info(
    {required CustStripeInfo stripeInfo, required int customer_id}) async {
  final QueryResult<Mutation$set_customer_stripe_info> _res =
      await _graphClient.mutate$set_customer_stripe_info(
    Options$Mutation$set_customer_stripe_info(
      variables: Variables$Mutation$set_customer_stripe_info(
        user_id: customer_id,
        stripe_info: stripeInfo.toMap(),
      ),
    ),
  );

  if (_res.parsedData?.update_customer_customer_by_pk?.stripe_info == null) {
    throw Exception(
        " 🛑🛑🛑🛑🛑 set_customer_stripe_info :: exception :: ${_res.exception}");
  } else {
    mezDbgPrint(" ✅✅✅✅✅ update notif token success");
    return CustStripeInfo.fromMap(
        _res.parsedData?.update_customer_customer_by_pk!.stripe_info!);
  }
}

Future<List<RestaurantOrder>> get_customer_orders(
    {required int customer_id}) async {
  final List<RestaurantOrder> _ret = [];

  final QueryResult<Query$get_customer_orders> _res =
      await _graphClient.query$get_customer_orders(
    Options$Query$get_customer_orders(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Query$get_customer_orders(customer_id: customer_id),
    ),
  );

  if (_res.hasException) {
    mezDbgPrint(
        "[tt] Called :: get_customer_orders :: exception :: ${_res.exception}");
  } else {
    mezDbgPrint("[tt] Called :: get_customer_orders :: SUCCESS");

    final List<Query$get_customer_orders$restaurant_order>? _orders =
        _res.parsedData?.restaurant_order;
    if (_orders != null) {
      mezDbgPrint(
          "[tt] found orders :: CUS_ID ($customer_id) :: len :: ${_orders.length}");

      _orders.forEach((Query$get_customer_orders$restaurant_order _o) {
        num _itemsCost = 0;
        _o.items
            .forEach((Query$get_customer_orders$restaurant_order$items item) {
          _itemsCost += (item.cost_per_one * item.quantity);
        });
        _ret.add(
          RestaurantOrder(
            deliveryMode: DeliveryMode.None,
            orderId: _o.id,
            chatId: _o.chat_id,
            status: _o.status.toRestaurantOrderStatus(),
            quantity: 1,
            serviceProviderId: _o.restaurant.id,
            paymentType: _o.payment_type.toPaymentType(),
            orderTime: DateTime.parse(_o.order_time),
            cost: _o.delivery_cost,
            restaurant: ServiceInfo(
              location: Location(
                _o.restaurant.location_text,
                _o.restaurant.location_gps.toLocationData(),
              ),
              firebaseId: _o.restaurant.firebase_id,
              hasuraId: _o.restaurant.id,
              image: _o.restaurant.image,
              name: _o.restaurant.name,
            ),
            customer: Get.find<AuthController>().user!,
            to: Location(
              _o.to_location_address!,
              _o.to_location_gps!.toLocationData(),
            ),
            itemsCost: _itemsCost,
            shippingCost: _o.delivery_cost,
          ),
        );
      });
    }
  }
  return _ret;
}

Future<CustStripeInfo?> get_customer_stripe_info(
    {required int userId, bool withCache = true}) async {
  final QueryResult<Query$get_customer_stripe_info> res = await _graphClient
      .query$get_customer_stripe_info(Options$Query$get_customer_stripe_info(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables:
              Variables$Query$get_customer_stripe_info(customer_id: userId)));
  if (res.parsedData?.customer_customer == null) {
    throw Exception("🛑 get customer cards exceptions 🛑  =>${res.exception}");
  }
  if (res.parsedData?.customer_customer.first.stripe_info != null) {
    final dynamic? dbCards =
        res.parsedData!.customer_customer.first.stripe_info?["cards"];
    mezDbgPrint(
        "✅ getting cards success =====>${res.parsedData?.customer_customer.first.stripe_info} ");

    final List<CreditCard> cards = [];
    if (dbCards != null && dbCards.isNotEmpty) {
      dbCards?.forEach((key, data) {
        cards.add(CreditCard.fromData(data: data));
      });
    }
    final CustStripeInfo stripeInfo = CustStripeInfo(
        id: res.parsedData!.customer_customer.first.stripe_info["id"],
        cards: cards);
    return stripeInfo;
  }
  return null;
}
