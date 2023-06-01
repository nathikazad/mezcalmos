import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

extension BusinessItemDetailsHelper on BusinessItemDetails {
  String? get firstImage {
    if (image == null || image!.isEmpty) {
      return null;
    }
    return image!.first;
  }
}

BusinessItemParameters businessItemParamsFromData(Map<String, dynamic> map) {
  return BusinessItemParameters(
    previousCost: map['previousCost'] ?? null,
    timeUnit: map["timeUnit"]?.toString().toTimeUnit() ?? null,
    previoustime: map['previoustime'] ?? null,
    numberOfUnits: map['numberOfUnits'] ?? null,
    guests: map['guests'] ?? null,
  );
}

// extension BusinessItemParamsHelper on BusinessItemParameters {

// }
