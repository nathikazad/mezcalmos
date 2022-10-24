import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelfDeliveryDetails {
  LatLng? location;
  DateTime? estDeliveryTime;
  SelfDeliveryDetails({
    this.location,
    this.estDeliveryTime,
  });

  SelfDeliveryDetails copyWith({
    LatLng? location,
    DateTime? estDeliveryTime,
  }) {
    return SelfDeliveryDetails(
      location: location ?? this.location,
      estDeliveryTime: estDeliveryTime ?? this.estDeliveryTime,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'location': location?.toMap(),
  //     'estDeliveryTime': estDeliveryTime?.millisecondsSinceEpoch,
  //   };
  // }

  factory SelfDeliveryDetails.fromMap(data) {
    return SelfDeliveryDetails(
        location: data["location"] != null
            ? LatLng(data["location"]["position"]["lat"],
                data["location"]["position"]["lng"])
            : null,
        estDeliveryTime: (data["estDeliveryTime"] != null)
            ? DateTime.tryParse(data["estDeliveryTime"])
            : null);
  }

  // String toJson() => json.encode(toMap());

  factory SelfDeliveryDetails.fromJson(String source) =>
      SelfDeliveryDetails.fromMap(json.decode(source));

  @override
  String toString() =>
      'SelfDeliveryDetails(location: $location, estDeliveryTime: $estDeliveryTime)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SelfDeliveryDetails &&
        other.location == location &&
        other.estDeliveryTime == estDeliveryTime;
  }

  @override
  int get hashCode => location.hashCode ^ estDeliveryTime.hashCode;
}
