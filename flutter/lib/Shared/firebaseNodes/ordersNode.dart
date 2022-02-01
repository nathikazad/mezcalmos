String rootTaxiOpenOrdersNode() => "orders/open/taxi";

String rootOpenOrderReadNode(String orderId, String uid) {
  return rootTaxiOpenOrdersNode() + '/$orderId/notificationStatus/$uid/read';
}

String rootOpenOrderReceivedNode(String orderId, String uid) {
  return rootTaxiOpenOrdersNode() +
      '/$orderId/notificationStatus/$uid/received';
}

String rootInProcessOrderDriverLocationNode(String orderId) {
  return 'orders/inProcess/taxi/$orderId/driver/location';
}

String taxiCounterOfferNode(String orderId, String? driverId) {
  String nodeAddress = 'orders/open/${orderId}/counterOffers';
  if (driverId != null) nodeAddress += '/$driverId';
  return nodeAddress;
}

String taxiCounterOfferNodeStatus(String orderId, String driverId) {
  return taxiCounterOfferNode(orderId, driverId) + "/status";
}
