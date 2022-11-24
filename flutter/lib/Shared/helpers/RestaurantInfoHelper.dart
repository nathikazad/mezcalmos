import 'package:mezcalmos/Shared/models/Services/Restaurant/Category.dart';

typedef CatgeoriesList = List<Category>;

extension CategoriesHelper on CatgeoriesList {
  Map<String, dynamic> toFirebaseFormatting() {
    final Map<String, dynamic> data = {};
    forEach((Category element) {
      data.addAll(element.toJson());
    });
    return data;
  }
}
