import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class Choice {
  String id;
  num cost = 0;
  Map<LanguageType, String> name;
  int position = 0;
  bool available = true;
  Choice(
      {required this.id,
      required this.name,
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
}
