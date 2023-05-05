import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/customer/__generated/customer.graphql.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrderStatus.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/NotificationInfo.dart';

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
        notificationInfo: _cus[0].notification_info != null
            ? NotificationInfo(
                token: _cus[0].notification_info!.token,
                turnOffNotifications:
                    _cus[0].notification_info!.turn_off_notifications)
            : null);
    // if (_cus[0].c != null) {
    //   _cus[0].stripe_info["cards"].forEach((key, data) {
    //     returnedCustomer.addCreditCard(CreditCard.fromData(data: data));
    //   });
    // }

    _cus[0].saved_locations.forEach(
        (Query$get_customer_info$customer_customer$saved_locations sLocation) {
      mezDbgPrint("[tt] Found new Saved Location ==> ${sLocation.id}");
      returnedCustomer.addSavedLocation(
        SavedLocation(
          name: sLocation.name,
          id: sLocation.id,
          location: MezLocation(
            sLocation.location_text,
            sLocation.location_gps.toLocationData(),
          ),
          defaultLocation: sLocation.$default,
        ),
      );
    });

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

// Future<CustStripeInfo?> get_customer_stripe_info(
//     {required int userId, bool withCache = true}) async {
//   // final QueryResult<Query$get_customer_stripe_info> res = await _graphClient
//   //     .query$get_customer_stripe_info(Options$Query$get_customer_stripe_info(
//   //         fetchPolicy:
//   //             withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
//   //         variables:
//   //             Variables$Query$get_customer_stripe_info(customer_id: userId)));
//   // if (res.parsedData?.customer_customer == null) {
//   //   throw Exception("🛑 get customer cards exceptions 🛑  =>${res.exception}");
//   // }
//   // if (res.parsedData?.customer_customer.first.stripe_info != null) {
//   //   final dynamic? dbCards =
//   //       res.parsedData!.customer_customer.first.stripe_info?["cards"];
//   //   mezDbgPrint(
//   //       "✅ getting cards success =====>${res.parsedData?.customer_customer.first.stripe_info} ");

//   //   final List<CreditCard> cards = [];
//   //   if (dbCards != null && dbCards.isNotEmpty) {
//   //     dbCards?.forEach((key, data) {
//   //       mezDbgPrint(" 🤣 data =======>$data");
//   //       cards.add(CreditCard.fromData(data: data));
//   //     });
//   //   }
//   //   final CustStripeInfo stripeInfo = CustStripeInfo(
//   //       id: res.parsedData!.customer_customer.first.stripe_info["id"],
//   //       cards: cards);
//   //   return stripeInfo;
//   // }
//   return null;
// }

Future<List<MinimalOrder>> get_customer_orders(
    {required int customerId,
    required bool inProcess,
    required int limit,
    required offest}) async {
  final QueryResult<Query$get_customer_orders> res =
      await _graphClient.query$get_customer_orders(
    Options$Query$get_customer_orders(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Query$get_customer_orders(
          custId: customerId,
          inProcess: inProcess,
          limit: limit,
          offset: offest),
    ),
  );
  if (res.parsedData?.customer_minimal_orders == null) {
    throwError(res.exception);
  }
  return res.parsedData!.customer_minimal_orders
      .map<MinimalOrder>(
          (Query$get_customer_orders$customer_minimal_orders order) =>
              MinimalOrder(
                  id: order.id,
                  toAdress: order.to_address,
                  deliveryCost: order.delivery_cost,
                  orderTime: DateTime.parse(order.order_time),
                  title: order.name,
                  image: order.image,
                  status: _getStatus(
                      orderType: order.order_type.toOrderType(),
                      status: order.status),
                  totalCost: order.total_cost,
                  orderType: order.order_type.toOrderType()))
      .toList();
}

Stream<List<MinimalOrder>?> listen_on_customer_orders(
    {required int customerId}) {
  return _graphClient
      .subscribe$listen_on_customer_orders(
    Options$Subscription$listen_on_customer_orders(
      variables: Variables$Subscription$listen_on_customer_orders(
          custId: customerId, inProcess: true),
    ),
  )
      .map<List<MinimalOrder>?>(
          (QueryResult<Subscription$listen_on_customer_orders> event) {
    if (event.parsedData?.customer_minimal_orders != null) {
      final List<MinimalOrder> minOrders = event
          .parsedData!.customer_minimal_orders
          .map((Subscription$listen_on_customer_orders$customer_minimal_orders
                  order) =>
              MinimalOrder(
                  id: order.id,
                  toAdress: order.to_address,
                  deliveryCost: order.delivery_cost,
                  orderTime: DateTime.parse(order.order_time),
                  title: order.name,
                  image: order.image,
                  status: _getStatus(
                      orderType: order.order_type.toOrderType(),
                      status: order.status),
                  totalCost: order.total_cost,
                  orderType: order.order_type.toOrderType()))
          .toList();

      return minOrders;
    } else {
      throwError(event.exception);
    }
    return null;
  });
}

MinimalOrderStatus _getStatus(
    {required String status, required OrderType orderType}) {
  switch (orderType) {
    case OrderType.Restaurant:
      return status.toRestaurantOrderStatus().toMinimalOrderStatus();
    case OrderType.Laundry:
      return status.toLaundryOrderStatus().toMinimalOrderStatus();
    case OrderType.Courier:
      return status.toDeliveryOrderStatus().toMinimalOrderStatus();

    default:
      return status.toRestaurantOrderStatus().toMinimalOrderStatus();
  }
}

Future<int?> addRestaurantOrderReviewId(
    {required int orderId, required int reviewId}) async {
  QueryResult<Mutation$updateRestaurantOrderReviewId> res =
      await _graphClient.mutate$updateRestaurantOrderReviewId(
          Options$Mutation$updateRestaurantOrderReviewId(
              variables: Variables$Mutation$updateRestaurantOrderReviewId(
                  orderId: orderId, reviewId: reviewId)));
  if (res.parsedData?.update_restaurant_order_by_pk == null) {
    throwError(res.exception);
  }
  return res.parsedData?.update_restaurant_order_by_pk?.review_id;
}

Future<int?> addLaundryOrderReviewId(
    {required int orderId, required int reviewId}) async {
  mezDbgPrint("Order id ====================>$orderId");
  QueryResult<Mutation$updateLaundryOrderReviewId> res =
      await _graphClient.mutate$updateLaundryOrderReviewId(
          Options$Mutation$updateLaundryOrderReviewId(
              variables: Variables$Mutation$updateLaundryOrderReviewId(
                  orderId: orderId, reviewId: reviewId)));
  if (res.parsedData?.update_laundry_order_by_pk == null) {
    throwError(res.exception);
  }
  return res.parsedData?.update_laundry_order_by_pk?.review_id;
}

Future<int?> addDriverOrderReviewId(
    {required int orderId, required int reviewId}) async {
  mezDbgPrint("Order id ====================>$orderId");
  QueryResult<Mutation$updateDriverOrderReviewId> res =
      await _graphClient.mutate$updateDriverOrderReviewId(
          Options$Mutation$updateDriverOrderReviewId(
              variables: Variables$Mutation$updateDriverOrderReviewId(
                  orderId: orderId, reviewId: reviewId)));
  if (res.parsedData?.update_delivery_order_by_pk == null) {
    throwError(res.exception);
  }
  return res
      .parsedData?.update_delivery_order_by_pk?.driver_review_by_customer_id;
}
