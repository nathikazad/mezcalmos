// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

class ServiceInput {
  ServiceInfo? serviceInfo;
  Schedule? schedule;
  ServiceDeliveryType? deliveryType;
  int? deliveryPartnerId;
  DeliveryCost? selfDeliveryCost;
  ServiceProviderLanguage? languages;
  ServiceInput(
      {this.serviceInfo,
      this.schedule,
      this.deliveryType = ServiceDeliveryType.Delivery_Partner,
      this.deliveryPartnerId,
      this.selfDeliveryCost,
      this.languages});

  ServiceInput copyWith({
    ServiceInfo? serviceInfo,
    Schedule? schedule,
    ServiceDeliveryType? deliveryType,
    int? deliveryPartnerId,
    DeliveryCost? selfDeliveryCost,
  }) {
    return ServiceInput(
      serviceInfo: serviceInfo ?? this.serviceInfo,
      schedule: schedule ?? this.schedule,
      deliveryType: deliveryType ?? this.deliveryType,
      deliveryPartnerId: deliveryPartnerId ?? this.deliveryPartnerId,
      selfDeliveryCost: selfDeliveryCost ?? this.selfDeliveryCost,
    );
  }

  bool get isSelfDelivery {
    return deliveryType == ServiceDeliveryType.Self_delivery;
  }

  bool get isValid {
    if (deliveryType == ServiceDeliveryType.Delivery_Partner) {
      return serviceInfo != null &&
          schedule != null &&
          deliveryPartnerId != null;
    } else {
      return serviceInfo != null &&
          schedule != null &&
          selfDeliveryCost != null;
    }
  }

  @override
  String toString() {
    return 'ServiceInput(serviceInfo: $serviceInfo, schedule: $schedule, deliveryType: $deliveryType, deliveryPartnerId: $deliveryPartnerId, selfDeliveryCost: $selfDeliveryCost)';
  }

  @override
  bool operator ==(covariant ServiceInput other) {
    if (identical(this, other)) return true;

    return other.serviceInfo == serviceInfo &&
        other.schedule == schedule &&
        other.deliveryType == deliveryType &&
        other.deliveryPartnerId == deliveryPartnerId &&
        other.selfDeliveryCost == selfDeliveryCost;
  }

  @override
  int get hashCode {
    return serviceInfo.hashCode ^
        schedule.hashCode ^
        deliveryType.hashCode ^
        deliveryPartnerId.hashCode ^
        selfDeliveryCost.hashCode;
  }
}

enum ServiceDeliveryType { Delivery_Partner, Self_delivery }

extension ParseServiceDeliveryTypeToString on ServiceDeliveryType {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }

  String toNormalString() {
    String str = toString().split('.').last;
    str = str[0].toUpperCase() + str.substring(1);
    str = str.replaceFirst("_", " ");
    return str;
  }
}

extension ParseStringToServiceDeliveryType on String {
  ServiceDeliveryType toServiceDeliveryType() {
    return ServiceDeliveryType.values.firstWhere((ServiceDeliveryType e) =>
        e.toFirebaseFormatString().toLowerCase() == this);
  }
}
