import 'package:mezcalmos/Shared/models/Orders/Order.dart';

String rootTaxiOpenOrdersNode() => "orders/open/taxi";

String rootOpenOrderReadNode(String orderId, String uid) {
  return rootTaxiOpenOrdersNode() + '/$orderId/notificationStatus/$uid/read';
}

String rootOpenOrderCounterOffer(String orderId, String driverId) {
  return rootTaxiOpenOrdersNode() + '/$orderId/counterOffers/$driverId';
}

String rootOpenOrderReceivedNode(String orderId, String uid) {
  return rootTaxiOpenOrdersNode() +
      '/$orderId/notificationStatus/$uid/received';
}

String rootTaxiInProcessOrderDriverLocationNode(String orderId) {
  return rootInProcessOrderDriverLocationNode(
      orderId: orderId, orderType: OrderType.Taxi);
}

String rootInProcessOrderDriverLocationNode(
    {required String orderId,
    required OrderType orderType,
    String driverAddress = "driver"}) {
  return rootInProcessOrdersNode(orderType: orderType, orderId: orderId) +
      '/$driverAddress/location';
}

String rootInProcessOrdersNode({OrderType? orderType, String? orderId}) {
  String node = 'orders/inProcess';
  if (orderType != null) {
    node += '/${orderType.toFirebaseFormatString()}';
    if (orderId != null) node += '/$orderId';
  }
  return node;
}

String rootNotifiedAdminRoute(
    {required OrderType orderType, required String orderId}) {
  return rootInProcessOrderDriverLocationNode(
          orderId: orderId, orderType: orderType) +
      "/notified/admin";
}

String rootNotifiedOperatorRoute(
    {required OrderType orderType, required String orderId}) {
  return rootInProcessOrderDriverLocationNode(
          orderId: orderId, orderType: orderType) +
      "/notified/operator";
}

String rootPastOrdersNode({OrderType? orderType, String? orderId}) {
  String node = 'orders/past';
  if (orderType != null) {
    node += '/${orderType.toFirebaseFormatString()}';
    if (orderId != null) node += '/$orderId';
  }
  return node;
}
