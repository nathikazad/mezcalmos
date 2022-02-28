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

String customersCounterOfferNode(
    String orderId, String customerId, String driverId) {
  return 'customers/inProcessOrders/$customerId/$orderId/counterOffers/$driverId';
}

String taxiCounterOfferNodeStatus(
    String orderId, String customerId, String driverId) {
  return customersCounterOfferNode(orderId, customerId, driverId) + "/status";
}
