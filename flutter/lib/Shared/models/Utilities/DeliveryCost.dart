import 'dart:convert';

import 'package:mezcalmos/DeliveryAdminApp/models/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class DeliveryCost {
  int? id;
  DeliveryServiceType serviceProviderType;
  int serviceProviderId;
  double minimumCost;
  double costPerKm;
  double? freeDeliveryMinimumCost;
  double? freeDeliveryKmRange;
  DeliveryCost({
    required this.id,
    required this.serviceProviderType,
    required this.serviceProviderId,
    required this.minimumCost,
    required this.costPerKm,
    this.freeDeliveryMinimumCost,
    this.freeDeliveryKmRange,
  });

  DeliveryCost copyWith({
    DeliveryServiceType? serviceProviderType,
    int? serviceProviderId,
    double? minimumCost,
    double? costPerKm,
    double? freeDeliveryMinimumCost,
    double? freeDeliveryKmRange,
  }) {
    return DeliveryCost(
      serviceProviderType: serviceProviderType ?? this.serviceProviderType,
      serviceProviderId: serviceProviderId ?? this.serviceProviderId,
      minimumCost: minimumCost ?? this.minimumCost,
      costPerKm: costPerKm ?? this.costPerKm,
      id: id ?? id,
      freeDeliveryMinimumCost:
          freeDeliveryMinimumCost ?? this.freeDeliveryMinimumCost,
      freeDeliveryKmRange: freeDeliveryKmRange ?? this.freeDeliveryKmRange,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'serviceProviderType': serviceProviderType.toHasuraString(),
      'serviceProviderId': serviceProviderId,
      'minimumCost': minimumCost,
      'costPerKm': costPerKm,
      'freeDeliveryMinimumCost': freeDeliveryMinimumCost,
      'freeDeliveryKmRange': freeDeliveryKmRange,
    };
  }

  factory DeliveryCost.fromMap(Map<String, dynamic> map) {
    return DeliveryCost(
      id: map["id"],
      serviceProviderType:
          map["serviceProviderType"].toString().toDeliveryProviderType(),
      serviceProviderId: map['serviceProviderId']?.toInt() ?? 0,
      minimumCost: map['minimumCost']?.toDouble() ?? 0.0,
      costPerKm: map['costPerKm']?.toDouble() ?? 0.0,
      freeDeliveryMinimumCost:
          map['freeDeliveryMinimumCost']?.toDouble() ?? 0.0,
      freeDeliveryKmRange: map['freeDeliveryKmRange']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryCost.fromJson(String source) =>
      DeliveryCost.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DeliveryCost(serviceProviderType: $serviceProviderType, serviceProviderId: $serviceProviderId, minimumCost: $minimumCost, costPerKm: $costPerKm, freeDeliveryMinimumCost: $freeDeliveryMinimumCost, freeDeliveryKmRange: $freeDeliveryKmRange)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DeliveryCost &&
        other.serviceProviderType == serviceProviderType &&
        other.serviceProviderId == serviceProviderId &&
        other.minimumCost == minimumCost &&
        other.costPerKm == costPerKm &&
        other.freeDeliveryMinimumCost == freeDeliveryMinimumCost &&
        other.freeDeliveryKmRange == freeDeliveryKmRange;
  }

  @override
  int get hashCode {
    return serviceProviderType.hashCode ^
        serviceProviderId.hashCode ^
        minimumCost.hashCode ^
        costPerKm.hashCode ^
        freeDeliveryMinimumCost.hashCode ^
        freeDeliveryKmRange.hashCode;
  }
}
