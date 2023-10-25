// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';

class InfEarning {
  UserInfo customerInfo;
  UserInfo serviceInfo;
  num orderTotal;
  num comission;
  InfEarning({
    required this.customerInfo,
    required this.serviceInfo,
    required this.orderTotal,
    required this.comission,
  });

  String get description =>
      "${customerInfo.name} bought for ${orderTotal.toPriceString()} from ${serviceInfo.name} your commission is ${comission.toPriceString()}.";
}
