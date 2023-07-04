import 'dart:convert';

import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

class DeliveryCost {
  int? id;

  double minimumCost;
  bool selfDelivery;
  double costPerKm;
  double? freeDeliveryMinimumCost;
  double? freeDeliveryKmRange;
  double? radius;
  double? costPerKmFromBase;
  DeliveryCost({
    required this.id,
    required this.minimumCost,
    required this.selfDelivery,
    required this.costPerKm,
    this.freeDeliveryMinimumCost,
    this.freeDeliveryKmRange = 0,
    this.radius,
    this.costPerKmFromBase,
  });

  DeliveryCost copyWith({
    ServiceProviderType? serviceProviderType,
    int? serviceProviderId,
    bool? selfDelivery,
    double? minimumCost,
    double? costPerKm,
    double? freeDeliveryMinimumCost,
    double? freeDeliveryKmRange,
  }) {
    return DeliveryCost(
      minimumCost: minimumCost ?? this.minimumCost,
      selfDelivery: selfDelivery ?? this.selfDelivery,
      costPerKm: costPerKm ?? this.costPerKm,
      id: id ?? id,
      freeDeliveryMinimumCost:
          freeDeliveryMinimumCost ?? this.freeDeliveryMinimumCost,
      freeDeliveryKmRange: freeDeliveryKmRange ?? this.freeDeliveryKmRange,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'minimumCost': minimumCost,
      'costPerKm': costPerKm,
      'freeDeliveryMinimumCost': freeDeliveryMinimumCost,
      'freeDeliveryKmRange': freeDeliveryKmRange,
    };
  }

  factory DeliveryCost.fromMap(Map<String, dynamic> map) {
    return DeliveryCost(
      id: map["id"],
      selfDelivery: map["selfDelivery"],
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
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DeliveryCost &&
        other.minimumCost == minimumCost &&
        other.costPerKm == costPerKm &&
        other.freeDeliveryMinimumCost == freeDeliveryMinimumCost &&
        other.freeDeliveryKmRange == freeDeliveryKmRange;
  }

  @override
  int get hashCode {
    return minimumCost.hashCode ^
        costPerKm.hashCode ^
        freeDeliveryMinimumCost.hashCode ^
        freeDeliveryKmRange.hashCode;
  }
}
