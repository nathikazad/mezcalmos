// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/models/Services/Restaurant/Category.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Option.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Period.dart';

class Item {
  int? id;
  int? nameId;
  int? descriptionId;
  int? restaurantId;
  int? categoryId;
  bool available;
  String? restaurantName;
  cModels.ItemType itemType;
  LanguageMap? description;

  String? image;
  Map<LanguageType, String> name;
  num cost = 0;
  List<Option> options;
  Category? category;

  String? linkUrl;
  DateTime? startsAt;
  DateTime? endsAt;

  List<Option> get getOptions {
    sortOptions();
    return options;
  }

  int position = 0;
  Item(
      {this.id,
      this.nameId,
      this.descriptionId,
      this.restaurantId,
      this.available = false,
      this.description,
      this.image,
      this.startsAt,
      this.categoryId,
      this.restaurantName,
      this.endsAt,
      List<Option>? newOptions,
      required this.name,
      required this.itemType,
      required this.cost,
      this.position = 0})
      : options = newOptions ?? <Option>[];

  factory Item.itemFromData(
    int itemId,
    itemData,
  ) {
    final Item item = Item(
        id: itemId,
        // TODO REMOVE THIS @m66are
        itemType: cModels.ItemType.Daily,
        available: itemData?["available"] ?? false,
        description: itemData["description"] != null
            ? convertToLanguageMap(itemData["description"])
            : null,
        //itemData["description"].toLanguageMap(),
        startsAt: (itemData["startsAt"] != null)
            ? DateTime.tryParse(itemData["startsAt"])
            : null,
        endsAt: (itemData["endsAt"] != null)
            ? DateTime.tryParse(itemData["endsAt"])
            : null,

        // image: itemData?["image"],
        image: ((itemData?["image"].toString().isNotEmpty ?? false) &&
                (itemData?["image"].toString().isURL ?? false))
            ? itemData["image"]
            : null,
        position: itemData["position"] ?? 0,
        name: convertToLanguageMap(itemData["name"]),
        //itemData["name"].toLanguageMap(),
        cost: itemData["cost"]);

    if (itemData["options2"] != null) {
      itemData["options2"]?.forEach((opId, opData) {
        item.options.add(Option.fromData(opId, opData));
      });
    } else {
      itemData["options"]?.forEach((opId, opData) {
        item.options.add(Option.fromData(opId, opData));
      });
    }

    item.sortOptions();

    return item;
  }

  void sortOptions() {
    options.sort((Option a, Option b) => a.position.compareTo(b.position));
  }
//  Category? getCategory(){

//  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "available": available,
      "description": description?.toFirebaseFormat(),
      "image": image,
      "cost": cost,
      "startsAt": startsAt?.toUtc().toString() ?? null,
      "endsAt": endsAt?.toUtc().toString() ?? null,
      "name": name.toFirebaseFormat(),
      "options":
          parseOptionsListToJson(), //options.map<List<Option>>((Option x) => <String, dynamic>{x.id: x.toJson()}),
      "position": position
    };
  }

  Map<String, dynamic> parseOptionsListToJson() {
    final Map<String, dynamic> _mappedOptions = <String, dynamic>{};
    options.forEach((Option op) {
      _mappedOptions[op.id.toString()] = op.toJson();
    });

    return _mappedOptions;
  }

  Option? findOption(int id) {
    if (options.length == 0) return null;

    return options.firstWhereOrNull((Option element) => element.id == id);
  }

  LanguageMap getOptionName(int id) {
    return options.firstWhereOrNull((Option element) => element.id == id)!.name;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    // final bool Function(e1, e2) collectionEquals =
    //     const DeepCollectionEquality().equals;

    return other is Item && other.id == id;
    // other.available == available &&
    // other.description == description &&
    // other.image == image &&
    // //   collectionEquals(other.name, name) &&
    // other.cost == cost &&
    // //   collectionEquals(other.options, options) &&
    // other.category == category &&
    // other.restaurant == restaurant &&
    // other.linkUrl == linkUrl &&
    // other.position == position;
  }

  // bool get isCurrentSpecial {
  //   return restaurant!.currentSpecials.contains(this);
  // }

  // bool get isPastSpecial {
  //   return restaurant!.pastSpecials.contains(this);
  // }

  bool get isSpecial {
    return startsAt != null && endsAt != null;
  }

  PeriodOfTime? get getPeriod {
    if (isSpecial) {
      return PeriodOfTime(start: startsAt!, end: endsAt!);
    }
    return null;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        available.hashCode ^
        description.hashCode ^
        image.hashCode ^
        name.hashCode ^
        cost.hashCode ^
        options.hashCode ^
        category.hashCode ^
        linkUrl.hashCode ^
        position.hashCode;
  }

  Item copyWith({
    int? id,
    int? nameId,
    int? descriptionId,
    int? restaurantId,
    int? categoryId,
    bool? available,
    String? restaurantName,
    LanguageMap? description,
    String? image,
    Map<LanguageType, String>? name,
    num? cost,
    List<Option>? options,
    Category? category,
    String? linkUrl,
    DateTime? startsAt,
    DateTime? endsAt,
    int? position,
  }) {
    return Item(
      id: id ?? this.id,
      nameId: nameId ?? this.nameId,
      descriptionId: descriptionId ?? this.descriptionId,
      restaurantId: restaurantId ?? this.restaurantId,
      categoryId: categoryId ?? this.categoryId,
      available: available ?? this.available,
      restaurantName: restaurantName ?? this.restaurantName,
      description: description ?? this.description,
      image: image ?? this.image,
      name: name ?? this.name,
      cost: cost ?? this.cost,
      newOptions: options ?? this.options,
      startsAt: startsAt ?? this.startsAt,
      endsAt: endsAt ?? this.endsAt,
      position: position ?? this.position,
      itemType: itemType,
    );
  }
}
