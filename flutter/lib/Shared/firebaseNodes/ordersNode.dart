String rootTaxiOpenOrdersNode() => "orders/open/taxi";

String rootOpenOrderReadNode(String orderId, String uid) {
  return rootTaxiOpenOrdersNode() + '/$orderId/notificationStatus/$uid/read';
}

String rootOpenOrderReceivedNode(String orderId, String uid) {
  return rootTaxiOpenOrdersNode() +
      '/$orderId/notificationStatus/$uid/received';
}

String rootTaxiInProcessOrderDriverLocationNode(String orderId) {
  return 'orders/inProcess/taxi/$orderId/driver/location';
}

// String rootTaxiInProcessOrderDriverLocationNode(String orderId) {
//   return 'orders/inProcess/deliveryDriver/$orderId/driver/location';
// }
