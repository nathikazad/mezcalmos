import 'dart:convert';

import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class DeliveryCost {
  int? id;

  double minimumCost;
  bool selfDelivery;
  bool deliveryAvailable;
  bool pickupAvailable;
  bool sitInAvailable;
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
    required this.sitInAvailable,
    required this.pickupAvailable,
    required this.deliveryAvailable,
    this.freeDeliveryMinimumCost,
    this.freeDeliveryKmRange = 0,
    this.radius,
    this.costPerKmFromBase,
  });

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

  DeliveryCost copyWith({
    int? id,
    double? minimumCost,
    bool? selfDelivery,
    bool? deliveryAvailable,
    bool? pickupAvailable,
    bool? sitInAvailable,
    double? costPerKm,
    double? freeDeliveryMinimumCost,
    double? freeDeliveryKmRange,
    double? radius,
    double? costPerKmFromBase,
  }) {
    return DeliveryCost(
      id: id ?? this.id,
      minimumCost: minimumCost ?? this.minimumCost,
      selfDelivery: selfDelivery ?? this.selfDelivery,
      deliveryAvailable: deliveryAvailable ?? this.deliveryAvailable,
      pickupAvailable: pickupAvailable ?? this.pickupAvailable,
      sitInAvailable: sitInAvailable ?? this.sitInAvailable,
      costPerKm: costPerKm ?? this.costPerKm,
      freeDeliveryMinimumCost:
          freeDeliveryMinimumCost ?? this.freeDeliveryMinimumCost,
      freeDeliveryKmRange: freeDeliveryKmRange ?? this.freeDeliveryKmRange,
      radius: radius ?? this.radius,
      costPerKmFromBase: costPerKmFromBase ?? this.costPerKmFromBase,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'minimumCost': minimumCost,
      'selfDelivery': selfDelivery,
      'deliveryAvailable': deliveryAvailable,
      'pickupAvailable': pickupAvailable,
      'sitInAvailable': sitInAvailable,
      'costPerKm': costPerKm,
      'freeDeliveryMinimumCost': freeDeliveryMinimumCost,
      'freeDeliveryKmRange': freeDeliveryKmRange,
      'radius': radius,
      'costPerKmFromBase': costPerKmFromBase,
    };
  }

  factory DeliveryCost.fromMap(Map<String, dynamic> map) {
    return DeliveryCost(
      id: map['id'] != null ? map['id'] as int : null,
      minimumCost: map['minimumCost'] as double,
      selfDelivery: map['selfDelivery'] as bool,
      deliveryAvailable: map['deliveryAvailable'] as bool,
      pickupAvailable: map['pickupAvailable'] as bool,
      sitInAvailable: map['sitInAvailable'] as bool,
      costPerKm: map['costPerKm'] as double,
      freeDeliveryMinimumCost: map['freeDeliveryMinimumCost'] != null
          ? map['freeDeliveryMinimumCost'] as double
          : null,
      freeDeliveryKmRange: map['freeDeliveryKmRange'] != null
          ? map['freeDeliveryKmRange'] as double
          : null,
      radius: map['radius'] != null ? map['radius'] as double : null,
      costPerKmFromBase: map['costPerKmFromBase'] != null
          ? map['costPerKmFromBase'] as double
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryCost.fromJson(String source) =>
      DeliveryCost.fromMap(json.decode(source) as Map<String, dynamic>);
  List<DeliveryType> get dvTypes {
    return [
      if (pickupAvailable) DeliveryType.Pickup,
      if (deliveryAvailable) DeliveryType.Delivery,
      if (sitInAvailable) DeliveryType.SitIn,
    ];
  }
}
