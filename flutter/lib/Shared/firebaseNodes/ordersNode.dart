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
  return rootInProcessOrderDriverLocationNode(
      orderId: orderId, orderType: OrderType.Taxi);
}

String rootInProcessOrderDriverLocationNode(
    {required String orderId,
    required OrderType orderType,
    String driverAddress = "driver"}) {
  return 'orders/inProcess/${orderType.toFirebaseFormatString()}/$orderId/$driverAddress/location';
}
