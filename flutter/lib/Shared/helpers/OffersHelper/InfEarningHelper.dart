// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/models/User.dart' as user;

class InfEarning {
  UserInfo? customerInfo;
  user.UserInfo influencerInfo;
  user.ServiceInfo serviceInfo;
  InfluencerOfferDetails influencerOfferDetails;
  num orderTotal;
  num comission;
  num discount;

  InfEarning({
    required this.customerInfo,
    required this.influencerInfo,
    required this.serviceInfo,
    required this.orderTotal,
    required this.comission,
    required this.discount,
    required this.influencerOfferDetails,
  });

  num get totalBeforeDiscount => orderTotal + discount;

  // String get description =>
  //     "${customerInfo?.name} bought for ${orderTotal.toPriceString()} from ${serviceInfo.name} your commission is ${comission.toPriceString()}.";
}

class InfPayout {
  int id;
  user.UserInfo influencerInfo;
  int serviceProviderId;
  int influencerId;
  ServiceProviderType serviceProviderType;
  user.ServiceInfo serviceInfo;
  DateTime date;
  num amount;
  InfPayout({
    required this.id,
    required this.influencerInfo,
    required this.influencerId,
    required this.serviceProviderId,
    required this.serviceProviderType,
    required this.serviceInfo,
    required this.date,
    required this.amount,
  });

  @override
  bool operator ==(covariant InfPayout other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.influencerInfo == influencerInfo &&
        other.serviceProviderId == serviceProviderId &&
        other.serviceProviderType == serviceProviderType &&
        other.serviceInfo == serviceInfo &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        influencerInfo.hashCode ^
        serviceProviderId.hashCode ^
        serviceProviderType.hashCode ^
        serviceInfo.hashCode ^
        date.hashCode;
  }
}
