import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

extension BusinessItemDetailsHelper on BusinessItemDetails {
  String? get firstImage {
    if (image == null || image!.isEmpty) {
      return null;
    }
    return image!.first;
  }
}
