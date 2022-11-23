// ignore_for_file: avoid_annotating_with_dynamic

import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class Choice {
  String id;
  num cost = 0;
  Map<LanguageType, String> name;
  int? nameId;
  int position = 0;
  bool available = true;

  Choice(
      {required this.id,
      required this.name,
      this.nameId,
      required this.cost,
      this.available = true,
      this.position = 0});

  factory Choice.fromData(key, data) {
    return Choice(
        id: key,
        name: convertToLanguageMap(data["name"]),
        cost: data["cost"] ?? 0,
        available: data["available"] ?? true,
        position: data["position"] ?? 0);
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "cost": cost,
        "name": name.toFirebaseFormat(),
        "position": position,
        "available": available,
      };
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Choice &&
        other.id == id &&
        other.position == position &&
        other.cost == cost;
  }

  // This must be there
  @override
  int get hashCode {
    return id.hashCode ^ position.hashCode ^ cost.hashCode;
  }
  // @override
  // int get hashCode {
  //   return id.hashCode ^ cost.hashCode ^ position.hashCode ^ available.hashCode;
  // }

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is Choice &&
  //       other.id == id &&
  //       other.cost == cost &&
  //       // mapEquals(other.name, name) &&
  //       // other.nameId == nameId &&
  //       other.position == position &&
  //       other.available == available;
  // }
}
