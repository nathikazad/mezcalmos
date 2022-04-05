import 'package:mezcalmos/Shared/models/Orders/Order.dart';

String _serviceProviderNode({required OrderType orderType}) {
  return '${orderType.toPlural()}/info';
}

String serviceProviderInfos(
    {required OrderType orderType, String? providerId}) {
  String address = '${_serviceProviderNode(orderType: orderType)}/info';
  if (providerId != null) address += '/$providerId';
  return address;
}

String serviceProviderInProcessOrders(
    {required OrderType orderType, required String providerId}) {
  return '${_serviceProviderNode(orderType: orderType)}/inProcessOrders/$providerId';
}

String serviceProviderPastOrders(
    {required OrderType orderType, required String providerId}) {
  return '${_serviceProviderNode(orderType: orderType)}/pastOrders/$providerId';
}
