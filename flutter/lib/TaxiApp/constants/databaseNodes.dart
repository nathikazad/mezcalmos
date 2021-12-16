import 'package:mezcalmos/Shared/constants/databaseNodes.dart';

String taxiAuthNode(String uid) {
  return 'taxis/info/$uid';
}

String taxiStateNode(String uid) {
  return 'taxis/info/$uid/state';
}

String taxiDriverAppVersionNode(String uid) {
  return taxiAuthNode(uid) + '/versionNumber';
}

String rootOpenOrderReadNode(String orderId, String uid) {
  return taxiOpenOrdersNode() + '/$orderId/notificationStatus/$uid/read';
}

String rootOpenOrderReceivedNode(String orderId, String uid) {
  return taxiOpenOrdersNode() + '/$orderId/notificationStatus/$uid/received';
}

String customerInProcessOrderReadNode(
    String orderId, String customerId, String driverId) {
  return 'customers/inProcessOrders/$customerId/$orderId/notificationStatus/$driverId/read';
}

String customerInProcessOrderReceivedNode(
    String orderId, String customerId, String driverId) {
  return 'customers/inProcessOrders/$customerId/$orderId/notificationStatus/$driverId/received';
}

String notificationsNode(String uid) {
  return 'notifications/taxi/$uid';
}

String taxiIsLookingField(String uid) => "${taxiAuthNode(uid)}/state/isLooking";

String rootInProcessOrderDriverLocationNode(String orderId) {
  return 'orders/inProcess/taxi/$orderId/driver/location';
}

String customerInProcessOrderDriverLocationNode(
    String orderId, String customerId) {
  return 'customers/inProcessOrders/$customerId/$orderId/driver/location';
}

String taxiPastOrdersNode(String uid) {
  return 'taxis/pastOrders/$uid';
}

String taxiInProcessOrderNode(String uid) {
  return 'taxis/inProcessOrders/$uid';
}

String taxiInProcessOrderDriverLocationNode(
    {required String orderId, required String taxiId}) {
  return taxiInProcessOrderNode(taxiId) + '/$orderId/driver/location';
}
