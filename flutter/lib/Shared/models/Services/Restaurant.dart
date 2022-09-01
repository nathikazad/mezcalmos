import 'dart:convert';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

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
  List<Item> currentSpecials = <Item>[];
  List<Item> pastSpecials = <Item>[];

  List<Category> _categories = <Category>[];
  List<Item> itemsWithoutCategory = <Item>[];
  RestaurantsView restaurantsView;
  Restaurant(
      {required ServiceInfo userInfo,
      required this.description,
      this.restaurantsView = RestaurantsView.Rows,
      required Schedule schedule,
      required PaymentInfo paymentInfo,
      required ServiceState restaurantState,
      required LanguageType primaryLanguage,
      LanguageType? secondaryLanguage})
      : super(
            info: userInfo,
            schedule: schedule,
            state: restaurantState,
            primaryLanguage: primaryLanguage,
            secondaryLanguage: secondaryLanguage,
            paymentInfo: paymentInfo);

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

    final Schedule schedule =
        Schedule.fromData(restaurantData["details"]["schedule"]);

    final PaymentInfo paymentInfo =
        restaurantData["details"]["paymentInfo"] != null
            ? PaymentInfo.fromData(restaurantData["details"]["paymentInfo"])
            : PaymentInfo();

    final LanguageType primaryLanguage = restaurantData["details"]?["language"]
                ?["primary"]
            .toString()
            .toLanguageType() ??
        LanguageType.ES;

    final LanguageType? secondaryLanguage = restaurantData["details"]
                ?["language"]?["secondary"]
            .toString()
            .toLanguageType() ??
        LanguageType.EN;
    final Restaurant restaurant = Restaurant(
        userInfo: ServiceInfo.fromData(restaurantData["info"]),
        description: description ?? null,
        schedule: schedule,
        restaurantState: restaurantState,
        restaurantsView: restaurantsView,
        primaryLanguage: primaryLanguage,
        secondaryLanguage: secondaryLanguage,
        paymentInfo: paymentInfo);

    if (restaurantData['menu'] != null) {
      if (restaurantData["menu"]?["specials"] != null ||
          restaurantData["menu"]?["daily"] != null) {
        restaurantData["menu"]?["specials"]?["current"]
            ?.forEach((key, element) {
          restaurant.currentSpecials.add(Item.itemFromData(key, element));
        });
        restaurantData["menu"]?["specials"]?["past"]?.forEach((key, element) {
          restaurant.pastSpecials.add(Item.itemFromData(key, element));
        });
        restaurantData["menu"]?["daily"]?.forEach((categoryId, categoryData) {
          restaurant._categories
              .add(Category.fromData(categoryId, categoryData));
        });
      } else {
        restaurantData["menu"].forEach((itemId, itemdata) {
          restaurant.itemsWithoutCategory
              .add(Item.itemFromData(itemId, itemdata));
        });
      }
    } else if (restaurantData["menu2"] != null) {
      restaurantData["menu2"].forEach((categoryId, categoryData) {
        restaurant._categories.add(Category.fromData(categoryId, categoryData));
      });
      if (restaurantData["menu2"]["noCategory"] != null) {
        restaurantData["menu2"]["noCategory"]["items"]
            .forEach((itemId, itemdata) {
          restaurant.itemsWithoutCategory
              .add(Item.itemFromData(itemId, itemdata));
        });
      }
    }

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
    if (itemsWithoutCategory.isNotEmpty) {
      final Category noCategory = Category(id: 'noCategory');
      noCategory.items = itemsWithoutCategory;
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

  Item? findItemById({required String id, bool isSpecial = false}) {
    Item? returnVal;
    if (isSpecial) {
      currentSpecials.forEach((Item item) {
        if (item.id == id) returnVal = item;
      });
      if (returnVal == null) {
        pastSpecials.forEach((Item item) {
          if (item.id == id) returnVal = item;
        });
      }
    } else {
      _categories.forEach((Category category) {
        category.items.forEach((Item item) {
          if (item.id == id) returnVal = item;
        });
      });
      if (returnVal == null) {
        getItemsWithoutCategory?.forEach((Item element) {
          if (element.id == id) {
            returnVal = element;
          }
        });
      }
    }

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
  String? id;
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
    if (identical(this, other)) return true;
    // final bool Function(e1, e2) listEquals =
    //     const DeepCollectionEquality().equals;

    return other is Category &&
        other.name == name &&
        other.id == id &&
        other.dialog == dialog &&
        other.position == position &&
        //  listEquals(other.items, items) &&
        other.restaurant == restaurant;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        id.hashCode ^
        dialog.hashCode ^
        position.hashCode ^
        items.hashCode ^
        restaurant.hashCode;
  }
}

class Item {
  String? id;
  bool available;
  LanguageMap? description;

  String? image;
  Map<LanguageType, String> name;
  num cost = 0;
  List<Option> options;
  Category? category;
  Restaurant? restaurant;
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
      this.available = false,
      this.description,
      this.image,
      this.startsAt,
      this.endsAt,
      List<Option>? newOptions,
      required this.name,
      required this.cost,
      this.position = 0})
      : options = newOptions ?? <Option>[];

  factory Item.itemFromData(
    String itemId,
    itemData,
  ) {
    final Item item = Item(
        id: itemId,
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
        image: itemData["image"],
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
    Map<String, dynamic> _parseOptionsListToFirebaseFormattedStriing(
        List<Option> options) {
      final Map<String, dynamic> _mappedOptions = <String, dynamic>{};
      options.forEach((Option op) {
        _mappedOptions[op.name[LanguageType.EN]!] = op.toJson();
      });

      return _mappedOptions;
    }

    return <String, dynamic>{
      "id": id,
      "available": available,
      "description": description?.toFirebaseFormat(),
      "image": image,
      "cost": cost,
      "startsAt": startsAt?.toUtc().toString() ?? null,
      "endsAt": endsAt?.toUtc().toString() ?? null,
      "name": name.toFirebaseFormat(),
      "options": _parseOptionsListToFirebaseFormattedStriing(
          options), //options.map<List<Option>>((Option x) => <String, dynamic>{x.id: x.toJson()}),
      "position": position
    };
  }

  Option? findOption(String id) {
    if (options.length == 0) return null;
    return options.firstWhereOrNull((Option element) => element.id == id);
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
        restaurant.hashCode ^
        linkUrl.hashCode ^
        position.hashCode;
  }
}

enum OptionType { ChooseOne, ChooseMany, Custom }

extension ParseOrderTypeToString on OptionType {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }

  String toOptionName() {
    String str = toString().split('.').last;

    if (str.length > 6) {
      str = str.substring(6, str.length);
    }
    str[0].toLowerCase();
    return str;
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
  List<Choice> choices;
  int position = 0;
  num minimumChoice = 0;
  num freeChoice = 0;
  num maximumChoice = 0;
  num costPerExtra = 0;

  List<Choice> get getChoices {
    sortChoices();
    return choices;
  }

  Option(
      {required this.id,
      required this.optionType,
      required this.name,
      this.costPerExtra = 0,
      this.freeChoice = 0,
      this.maximumChoice = 0,
      this.minimumChoice = 0,
      List<Choice>? newChoices,
      this.position = 0})
      : choices = newChoices ?? <Choice>[];
  factory Option.fromData(String id, data) {
    final Option option = Option(
        id: id,
        name: convertToLanguageMap(data["name"]),
        position: data["position"] ?? 0,
        optionType: data["optionType"].toString().toOptionType());

    data["choices"]?.forEach((optionKey, optionData) {
      final Choice choice = Choice.fromData(optionKey, optionData);
      option.choices.add(choice);
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
    choices.sort((Choice a, Choice b) => a.position.compareTo(b.position));
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
    Map<String, dynamic> _parseChoices(List<Choice> choices) {
      final Map<String, dynamic> _mappedChoices = <String, dynamic>{};
      choices.forEach((Choice ch) {
        _mappedChoices[ch.name[LanguageType.EN]!] = ch.toJson();
      });

      return _mappedChoices;
    }

    return {
      // "id": id,
      "name": name.toFirebaseFormat(),
      "optionType": optionType.toFirebaseFormatString(),
      "choices": _parseChoices(choices),
      "minimumChoice": minimumChoice,
      "maximumChoice": maximumChoice,
      "costPerExtra": costPerExtra,
      "freeChoice": freeChoice,
    };
  }
}

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
