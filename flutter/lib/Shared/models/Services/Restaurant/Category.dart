import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class Category {
  LanguageMap? name;
  String? id;
  int? descriptionId;
  int? nameId;
  LanguageMap? dialog;
  int position = 0;
  List<Item> items = <Item>[];
  Restaurant? restaurant;

  List<Item> get getItems {
    sortItems();
    return items;
  }

  Category({
    this.name,
    this.id,
    this.descriptionId,
    this.nameId,
    this.position = 0,
    this.dialog,
  });

  factory Category.fromData(String categoryId, categoryData) {
    final Category category = Category(
      id: categoryId,
      position: categoryData["position"] ?? 0,
    );
    if (categoryData["name"] != null)
      category.name = convertToLanguageMap(categoryData["name"]);
    if (categoryData["dialog"] != null)
      category.dialog = convertToLanguageMap(categoryData["dialog"]);
    categoryData["items"]?.forEach((itemId, itemData) {
      category.items.add(Item.itemFromData(
        itemId,
        itemData,
      ));
    });
    category.sortItems();
    return category;
  }

  void sortItems() {
    items.sort((Item a, Item b) => a.position.compareTo(b.position));
  }

  List<Item> get getAvailableItems {
    final List<Item> data =
        items.where((Item element) => element.available == true).toList();
    data.sort((Item a, Item b) => a.position.compareTo(b.position));
    return data;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "name": name?.toFirebaseFormat(),
      "dialog": dialog?.toFirebaseFormat(),
      "position": position,
      // 'items': items.map((Item x) => x.toJson()).toList(),
    };
  }

  @override
  bool operator ==(Object other) {
    return other is Category && other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        id.hashCode ^
        descriptionId.hashCode ^
        nameId.hashCode ^
        dialog.hashCode ^
        position.hashCode ^
        items.hashCode ^
        restaurant.hashCode;
  }
}
