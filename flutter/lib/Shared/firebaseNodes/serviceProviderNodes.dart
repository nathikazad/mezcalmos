import 'package:mezcalmos/Shared/models/Orders/Order.dart';

String _serviceProviderNode({required OrderType orderType}) {
  return '${orderType.toPlural()}';
}

String serviceProviderInfos(
    {required OrderType orderType, String? providerId}) {
  String address = '${_serviceProviderNode(orderType: orderType)}/info';
  if (providerId != null) address += '/$providerId';
  return address;
}

String serviceProviderShortInfo(
    {required OrderType orderType, required String providerId}) {
  return serviceProviderInfos(orderType: orderType, providerId: providerId) +
      '/info';
}

String serviceProviderLocation(
    {required OrderType orderType, required String providerId}) {
  return serviceProviderShortInfo(
          orderType: orderType, providerId: providerId) +
      '/location';
}

String serviceProviderDetails(
    {required OrderType orderType, required String providerId}) {
  return serviceProviderInfos(orderType: orderType, providerId: providerId) +
      '/details';
}

String serviceProviderSchedule(
    {required OrderType orderType, required String providerId}) {
  return serviceProviderDetails(orderType: orderType, providerId: providerId) +
      '/schedule';
}

String serviceProviderPrimaryLanguage(
    {required OrderType orderType, required String providerId}) {
  return serviceProviderDetails(orderType: orderType, providerId: providerId) +
      '/language/primary';
}

String serviceProviderSecondaryLanguage(
    {required OrderType orderType, required String providerId}) {
  return serviceProviderDetails(orderType: orderType, providerId: providerId) +
      '/language/secondary';
}

String serviceProviderInProcessOrders(
    {required OrderType orderType, required String providerId}) {
  return '${_serviceProviderNode(orderType: orderType)}/inProcessOrders/$providerId';
}

String serviceProviderPastOrders(
    {required OrderType orderType, required String providerId}) {
  return '${_serviceProviderNode(orderType: orderType)}/pastOrders/$providerId';
}
