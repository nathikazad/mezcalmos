import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:mez_services_web_app/models/Generic.dart';
import 'package:mez_services_web_app/models/Schedule.dart';
import 'package:mez_services_web_app/models/Services/Service.dart';
import 'package:mez_services_web_app/models/User.dart';

enum RestaurantsView { Rows, Grid }

extension ParseRestaurantsViewToString on RestaurantsView {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToRestaurantsView on String {
  RestaurantsView toRestaurantsView() {
    return RestaurantsView.values
        .firstWhere((RestaurantsView e) => e.toFirebaseFormatString() == this);
  }
}

class Restaurant extends Service {
  static String kNoCategoryNode = "noCategory";
  LanguageMap? description;
  List<Category> _categories = <Category>[];
  List<Item> itemsWithoutCategory = <Item>[];
  RestaurantsView restaurantsView;
  Restaurant(
      {required ServiceInfo userInfo,
      required this.description,
      this.restaurantsView = RestaurantsView.Rows,
      Schedule? schedule,
      required ServiceState restaurantState})
      : super(info: userInfo, schedule: schedule, state: restaurantState);

  factory Restaurant.fromRestaurantData(
      {required String restaurantId, required restaurantData}) {
    // List<Object?> availableLanguages =
    //     restaurantData["details"]["languages"] as List<Object?>;

    final ServiceState restaurantState =
        ServiceState.fromServiceStateData(restaurantData["state"]);
    LanguageMap? description;
    if (restaurantData["details"]["description"] != null) {
      description =
          convertToLanguageMap(restaurantData["details"]["description"]);
    }

    RestaurantsView restaurantsView = RestaurantsView.Rows;
    if (restaurantData["details"]["restaurantsView"] != null) {
      restaurantsView = restaurantData["details"]["restaurantsView"]
          .toString()
          .toRestaurantsView();
    }

    final Schedule? schedule = restaurantData["details"]["schedule"] != null
        ? Schedule.fromData(restaurantData["details"]["schedule"])
        : null;
    final Restaurant restaurant = Restaurant(
        userInfo: ServiceInfo.fromData(restaurantData["info"]),
        description: description ?? null,
        schedule: schedule,
        restaurantState: restaurantState,
        restaurantsView: restaurantsView);
    if (restaurantData["menu2"] != null) {
      restaurantData["menu2"].forEach((categoryId, categoryData) {
        restaurant._categories.add(Category.fromData(categoryId, categoryData));
      });
    }

    // if (restaurantData["menu"] != null)
    //   restaurantData["menu2"].forEach((categoryId, categoryData) {
    //     restaurant._categories.add(Category.fromData(categoryId, categoryData));
    //   });
    // if (restaurantData["menu2"] != null)
    //   restaurantData["menu2"].forEach((categoryId, categoryData) {
    //     restaurant._categories.add(Category.fromData(categoryId, categoryData));
    //   });
    restaurant._categories
        .sort((Category a, Category b) => a.position.compareTo(b.position));
    return restaurant;
  }

  List<Category> get getCategories {
    final List<Category> categories = _categories
        .where((Category category) => category.id != kNoCategoryNode)
        .toList();
    categories.forEach((Category category) {
      category.sortItems();
    });
    return categories;
  }

  Category? get getNoCategory {
    if (getItemsWithoutCategory != null &&
        getItemsWithoutCategory!.isNotEmpty) {
      final Category noCategory = Category(id: 'noCategory');
      noCategory.items = getItemsWithoutCategory!;
      return noCategory;
    } else {
      return null;
    }
  }

  List<Item>? get getItemsWithoutCategory {
    final List<Item>? items = _categories
        .firstWhereOrNull((Category category) => category.id == kNoCategoryNode)
        ?.items;
    items?.sort((Item a, Item b) => a.position.compareTo(b.position));
    return items;
  }

  Item? findItemById(String id) {
    Item? returnVal;
    _categories.forEach((Category category) {
      category.items.forEach((Item item) {
        if (item.id == id) returnVal = item;
      });
    });
    return returnVal;
  }

  double getAverageCost() {
    double allItemsCost = 0;

    getItemsWithoutCategory?.forEach((Item element) {
      allItemsCost += element.cost;
    });
    getCategories.forEach((Category element) {
      element.items.forEach((Item element) {
        allItemsCost += element.cost;
      });
    });
    final double averageCost = allItemsCost / getNumberOfitems();
    return averageCost;
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
    return numberOfItems + (getItemsWithoutCategory?.length ?? 0);
  }

  bool isOpen() {
    return state.isOpen && (schedule?.isOpen() ?? false);
  }
}

class Category {
  LanguageMap? name;
  String id;
  LanguageMap? dialog;
  int position = 0;
  List<Item> items = <Item>[];

  List<Item> get getItems {
    sortItems();
    return items;
  }

  Category({
    this.name,
    required this.id,
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
    categoryData["items"].forEach((itemId, itemData) {
      category.items.add(Item.itemFromData(itemId, itemData));
    });
    category.sortItems();
    return category;
  }

  void sortItems() {
    items.sort((Item a, Item b) => a.position.compareTo(b.position));
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "name": name?.toFirebaseFormat(),
      "dialog": dialog?.toFirebaseFormat(),
      "position": position,
      "items": jsonEncode(items),
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

  List<Option> get options {
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
        description: itemData["description"] != null
            ? convertToLanguageMap(itemData["description"])
            : null,
        //itemData["description"].toLanguageMap(),
        image: itemData["image"],
        position: itemData["position"] ?? 0,
        name: convertToLanguageMap(itemData["name"]),
        //itemData["name"].toLanguageMap(),
        cost: itemData["cost"]);
    // TODO: change to options
    if (itemData["options2"] != null) {
      itemData["options2"].forEach((optionId, optionData) {
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
  List<Choice> _choices = <Choice>[];
  int position = 0;
  num minimumChoice = 0;
  num freeChoice = 0;
  num maximumChoice = 0;
  num costPerExtra = 0;

  List<Choice> get choices {
    sortChoices();
    return _choices;
  }

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

    data["choices"].forEach((optionKey, optionData) {
      final Choice choice = Choice.fromData(optionKey, optionData);
      option._choices.add(choice);
    });
    option.sortChoices();
    option.changeOptionType(
      option.optionType,
      minimumChoice: data["minimumChoice"],
      freeChoice: data["freeChoice"],
      maximumChoice: data["maximumChoice"],
      costPerExtra: data["costPerExtra"],
    );
    return option;
  }

  void sortChoices() {
    _choices.sort((Choice a, Choice b) => a.position.compareTo(b.position));
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
        this.freeChoice = _choices.length;
        this.maximumChoice = _choices.length;
        this.costPerExtra = 0;
        break;
      case OptionType.Custom:
        this.minimumChoice = minimumChoice ?? 0;
        this.freeChoice = freeChoice ?? 0;
        this.maximumChoice = maximumChoice ?? _choices.length;
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
      "choices": jsonEncode(_choices)
    };
  }
}

class Choice {
  String id;
  num cost = 0;
  Map<LanguageType, String> name;
  int position = 0;
  Choice(
      {required this.id,
      required this.name,
      required this.cost,
      this.position = 0});

  factory Choice.fromData(key, data) {
    return Choice(
        id: key,
        name: convertToLanguageMap(data["name"]),
        cost: data["cost"],
        position: data["position"] ?? 0);
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "cost": cost,
        "name": name.toFirebaseFormat(),
        "position": position,
      };
}
