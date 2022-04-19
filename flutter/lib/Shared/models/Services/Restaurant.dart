import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';

class Restaurant extends Service {
  LanguageMap? description;
  List<Category> _categories = <Category>[];
  List<Item> itemsWithoutCategory = <Item>[];
  Restaurant(
      {required ServiceUserInfo userInfo,
      required this.description,
      Schedule? schedule,
      required ServiceState restaurantState})
      : super(info: userInfo, schedule: schedule, state: restaurantState);

  factory Restaurant.fromRestaurantData(
      {required String restaurantId, required restaurantData}) {
    // List<Object?> availableLanguages =
    //     restaurantData["details"]["languages"] as List<Object?>;

    final ServiceState restaurantState = ServiceState(
        restaurantData["state"]?["authorizationStatus"]
                ?.toString()
                .toAuthorizationStatus() ??
            AuthorizationStatus.Unauthorized,
        restaurantData["state"]?["available"] ?? false);
    LanguageMap? description;
    if (restaurantData["details"]["description"] != null) {
      description =
          convertToLanguageMap(restaurantData["details"]["description"]);
    }

    final Schedule? schedule = restaurantData["details"]["schedule"] != null
        ? Schedule.fromData(restaurantData["details"]["schedule"])
        : null;

    final Restaurant restaurant = Restaurant(
        userInfo: ServiceUserInfo.fromData(restaurantData["info"]),
        description: description ?? null,
        schedule: schedule,
        restaurantState: restaurantState);
    restaurantData["menu2"].forEach((categoryId, categoryData) {
      restaurant._categories.add(Category.fromData(categoryId, categoryData));
    });
    restaurant._categories
        .sort((Category a, Category b) => a.position.compareTo(b.position));
    return restaurant;
  }

  List<Category> get getCategories {
    List<Category> categories = _categories
        .where((Category category) => category.id != "noCategory")
        .toList();
    categories.forEach((Category category) {
      category.sortItems();
    });
    return categories;
  }

  List<Item>? get getItemsWithoutCategory {
    List<Item>? items = _categories
        .firstWhereOrNull((Category category) => category.id == "noCategory")
        ?._items;
    items?.sort((Item a, Item b) => a.position.compareTo(b.position));
    return items;
  }

  Item? findItemById(String id) {
    Item? returnVal;
    _categories.forEach((Category category) {
      category._items.forEach((Item item) {
        if (item.id == id) returnVal = item;
      });
    });
    return returnVal;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "description": description?.toFirebaseFormat(),
      "info": info.toJson(),
      "categories": jsonEncode(_categories),
      "itemsWithoutCategory": jsonEncode(itemsWithoutCategory),
      "restaurantState": state.toJson()
    };
  }

  int getNumberOfitems() {
    int numberOfItems = 0;
    _categories.forEach((Category element) {
      numberOfItems = numberOfItems + element.items.length;
    });
    return numberOfItems;
  }

  bool isAvailable() {
    final String dayNane = DateFormat('EEEE').format(DateTime.now());

    final DateTime x = DateTime.now();

    if (schedule != null) {
      bool isOpen = false;
      schedule!.openHours.forEach((Weekday key, OpenHours value) {
        if (key.toFirebaseFormatString() == dayNane.toLowerCase()) {
          if (value.isOpen == true) {
            final DateTime dateOfStart =
                DateTime(x.year, x.month, x.day, value.from[0], value.from[1]);
            final DateTime dateOfClose =
                DateTime(x.year, x.month, x.day, value.to[0], value.to[1]);

            if (dateOfStart.isBefore(x) && dateOfClose.isAfter(x)) {
              isOpen = true;
            }
          } else {
            isOpen = false;
          }
        }
      });
      return isOpen;
    } else {
      return true;
    }
  }
}

class Category {
  LanguageMap? name;
  String id;
  LanguageMap? dialog;
  int position = 0;
  List<Item> _items = <Item>[];

  List<Item> get items {
    sortItems();
    return _items;
  }

  Category({
    this.name,
    required this.id,
    this.position = 0,
    this.dialog,
  });

  factory Category.fromData(String categoryId, dynamic categoryData) {
    final Category category = Category(
      id: categoryId,
      position: categoryData["position"] ?? 0,
    );
    if (categoryData["name"] != null)
      category.name = convertToLanguageMap(categoryData["name"]);
    if (categoryData["dialog"] != null)
      category.dialog = convertToLanguageMap(categoryData["dialog"]);
    categoryData["items"].forEach((dynamic itemId, dynamic itemData) {
      category._items.add(Item.itemFromData(itemId, itemData));
    });
    category.sortItems();
    return category;
  }

  void sortItems() {
    _items.sort((Item a, Item b) => a.position.compareTo(b.position));
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "name": name?.toFirebaseFormat(),
      "dialog": dialog?.toFirebaseFormat(),
      "position": position,
      "items": jsonEncode(_items),
    };
  }
}

class Item {
  String id;
  bool available;
  LanguageMap? description;
  String? image;
  Map<LanguageType, String> name;
  num cost = 0;
  List<Option> _options = <Option>[];

  List<Option>? get options {
    sortOptions();
    return _options;
  }
  
  int position = 0;
  Item(
      {required this.id,
      this.available = false,
      this.description,
      this.image,
      required this.name,
      required this.cost,
      this.position = 0});

  factory Item.itemFromData(String itemId, itemData) {
    final Item item = Item(
        id: itemId,
        available: itemData["available"],
        description: convertToLanguageMap(itemData["description"]),
        //itemData["description"].toLanguageMap(),
        image: itemData["image"],
        position: itemData["position"] ?? 0,
        name: convertToLanguageMap(itemData["name"]),
        //itemData["name"].toLanguageMap(),
        cost: itemData["cost"]);
    // TODO: change to options
    if (itemData["options2"] != null) {
      itemData["options2"].forEach((dynamic optionId, dynamic optionData) {
        item._options.add(Option.fromData(optionId, optionData));
      });
      item.sortOptions();
    }
    return item;
  }

  void sortOptions() {
    _options.sort((Option a, Option b) => a.position.compareTo(b.position));
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "available": available,
      "description": description?.toFirebaseFormat(),
      "image": image,
      "cost": cost,
      "name": name.toFirebaseFormat(),
      "options": jsonEncode(_options),
      "position": position
    };
  }

  Option? findOption(String id) {
    if (_options.length == 0) return null;
    return _options.firstWhereOrNull((Option element) => element.id == id);
  }
}

enum OptionType { ChooseOne, ChooseMany, Custom }

extension ParseOrderTypeToString on OptionType {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToOrderType on String {
  OptionType toOptionType() {
    return OptionType.values
        .firstWhere((OptionType e) => e.toFirebaseFormatString() == this);
  }
}

class Option {
  String id;
  OptionType optionType;
  Map<LanguageType, String> name;
  List<Choice> choices = <Choice>[];
  int position = 0;
  num minimumChoice = 0;
  num freeChoice = 0;
  num maximumChoice = 0;
  num costPerExtra = 0;
  Option(
      {required this.id,
      required this.optionType,
      required this.name,
      this.position = 0});
  factory Option.fromData(String id, data) {
    final Option option = Option(
        id: id,
        name: convertToLanguageMap(data["name"]),
        position: data["position"] ?? 0,
        optionType: data["optionType"].toString().toOptionType());

    data["choices"].forEach((optionData) {
      final Choice choice = Choice.fromData(optionData);
      option.choices.add(choice);
    });
    option.changeOptionType(
      option.optionType,
      minimumChoice: data["minimumChoice"],
      freeChoice: data["freeChoice"],
      maximumChoice: data["maximumChoice"],
      costPerExtra: data["costPerExtra"],
    );
    return option;
  }

  void changeOptionType(
    OptionType optionType, {
    num? minimumChoice,
    num? freeChoice,
    num? maximumChoice,
    num? costPerExtra,
  }) {
    switch (optionType) {
      case OptionType.ChooseOne:
        this.minimumChoice = 1;
        this.freeChoice = 1;
        this.maximumChoice = 1;
        break;
      case OptionType.ChooseMany:
        this.minimumChoice = 0;
        this.freeChoice = choices.length;
        this.maximumChoice = choices.length;
        this.costPerExtra = 0;
        break;
      case OptionType.Custom:
        this.minimumChoice = minimumChoice ?? 0;
        this.freeChoice = freeChoice ?? 0;
        this.maximumChoice = maximumChoice ?? choices.length;
        this.costPerExtra = costPerExtra ?? 0;
        break;
    }
  }

  Choice? findChoice(Map<LanguageType, String> name) {
    Choice? selected;
    choices.forEach((Choice choice) {
      if (choice.name.toFirebaseFormat().toString() ==
          name.toFirebaseFormat().toString()) selected = choice;
    });
    return selected;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name.toFirebaseFormat(),
      "optionType": optionType.toFirebaseFormatString(),
      "choices": jsonEncode(choices)
    };
  }
}

class Choice {
  num cost = 0;
  Map<LanguageType, String> name;
  Choice({required this.name, required this.cost});

  factory Choice.fromData(data) {
    return Choice(name: convertToLanguageMap(data["name"]), cost: data["cost"]);
  }
  Map<String, dynamic> toJson() =>
      {"cost": cost, "name": name.toFirebaseFormat()};
}
