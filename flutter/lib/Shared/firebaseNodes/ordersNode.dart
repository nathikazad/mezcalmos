import 'package:mezcalmos/Shared/models/Orders/Order.dart';

String rootTaxiOpenOrdersNode() => "orders/open/taxi";

String rootOpenOrderReadNode(String orderId, String uid) {
  return rootTaxiOpenOrdersNode() + '/$orderId/notificationStatus/$uid/read';
}

String rootOpenOrderReceivedNode(String orderId, String uid) {
  return rootTaxiOpenOrdersNode() +
      '/$orderId/notificationStatus/$uid/received';
}

String rootTaxiInProcessOrderDriverLocationNode(String orderId) {
  return rootInProcessOrderDriverLocationNode(orderId, OrderType.Taxi);
}

String rootInProcessOrderDriverLocationNode(
    String orderId, OrderType orderType) {
  return 'orders/inProcess/${orderType.toFirebaseFormatString()}/$orderId/driver/location';
}
