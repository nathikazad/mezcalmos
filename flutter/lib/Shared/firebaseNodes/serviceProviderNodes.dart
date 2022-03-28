import 'package:mezcalmos/Shared/models/Orders/Order.dart';

String serviceProviderInfos(
    {required OrderType orderType, String? providerId}) {
  String address = '${orderType.toPlural()}/info';
  if (providerId != null) address += '/$providerId';
  return address;
}
