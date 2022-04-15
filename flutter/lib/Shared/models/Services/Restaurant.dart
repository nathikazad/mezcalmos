import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';

class Restaurant extends Service {
  Map<LanguageType, String> description;
  List<Item> items = [];

  Restaurant(
      {required ServiceUserInfo userInfo,
      required this.description,
      Schedule? schedule,
      required ServiceState restaurantState})
      : super(info: userInfo, schedule: schedule, state: restaurantState);

  factory Restaurant.fromRestaurantData(
      {required String restaurantId, required dynamic restaurantData}) {
    // List<Object?> availableLanguages =
    //     restaurantData["details"]["languages"] as List<Object?>;

    ServiceState restaurantState = ServiceState(
        restaurantData["state"]?["authorizationStatus"]
                ?.toString()
                .toAuthorizationStatus() ??
            AuthorizationStatus.Unauthorized,
        restaurantData["state"]?["available"] ?? false);
    Map<LanguageType, String> description =
        convertToLanguageMap(restaurantData["details"]["description"]);
    //restaurantData["details"]["description"].toLanguageMap();
    Schedule? schedule = restaurantData["details"]["schedule"] != null
        ? Schedule.fromData(restaurantData["details"]["schedule"])
        : null;

    Restaurant restaurant = Restaurant(
        userInfo: ServiceUserInfo.fromData(restaurantData["info"]),
        description: description,
        schedule: schedule,
        restaurantState: restaurantState);
    restaurantData["menu"].forEach((dynamic itemId, dynamic itemData) {
      restaurant.items.add(Item.itemFromData(itemId, itemData));
    });
    return restaurant;
  }

  Item? findItemById(String id) {
    return this.items.firstWhereOrNull((item) {
      mezDbgPrint("@sa@d@: findItemById:: item Id ${item.id} == $id ");
      return item.id == id;
    });
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "description": description,
      "info": info.toJson(),
      "items": jsonEncode(items),
      "restaurantState": state.toJson()
    };
  }

  bool isAvailable() {
    var dayNane = DateFormat('EEEE').format(DateTime.now());

    var x = DateTime.now();

    if (this.schedule != null) {
      bool isOpen = false;
      schedule!.openHours.forEach((key, value) {
        if (key.toFirebaseFormatString() == dayNane.toLowerCase()) {
          if (value.isOpen == true) {
            var dateOfStart =
                DateTime(x.year, x.month, x.day, value.from[0], value.from[1]);
            var dateOfClose =
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
        .firstWhere((e) => e.toFirebaseFormatString() == this);
  }
}

class Option {
  String id;
  OptionType optionType;
  Map<LanguageType, String> name;
  List<Choice> choices = <Choice>[];
  num minimumChoice = 0;
  num freeChoice = 0;
  num maximumChoice = 0;
  num costPerExtra = 0;
  Option({required this.id, required this.optionType, required this.name});
  factory Option.fromData(String id, dynamic data) {
    Option option = Option(
        id: id,
        name: convertToLanguageMap(data["name"]),
        optionType: data["optionType"].toString().toOptionType());
    data["choices"].forEach((dynamic optionData) {
      Choice choice = Choice.fromData(optionData);
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

  factory Choice.fromData(dynamic data) {
    return Choice(name: convertToLanguageMap(data["name"]), cost: data["cost"]);
  }
  Map<String, dynamic> toJson() =>
      {"cost": cost, "name": name.toFirebaseFormat()};
}

class Item {
  String id;
  bool available;
  LanguageMap? description;
  String? image;
  Map<LanguageType, String> name;
  num cost = 0;
  List<Option> options = <Option>[];

  Item({
    required this.id,
    this.available = false,
    this.description,
    this.image,
    required this.name,
    required this.cost,
  });

  factory Item.itemFromData(String itemId, dynamic itemData) {
    Item item = Item(
        id: itemId,
        available: itemData["available"],
        description: convertToLanguageMap(itemData["description"]),
        //itemData["description"].toLanguageMap(),
        image: itemData["image"],
        name: convertToLanguageMap(itemData["name"]),
        //itemData["name"].toLanguageMap(),
        cost: itemData["cost"]);
    // TODO: change to options
    if (itemData["options2"] != null) {
      itemData["options2"].forEach((dynamic optionId, dynamic optionData) {
        item.options.add(Option.fromData(optionId, optionData));
      });
    }
    return item;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "available": available,
      "description": description?.toFirebaseFormat(),
      "image": image,
      "cost": cost,
      "name": name.toFirebaseFormat(),
      "options": jsonEncode(options),
    };
  }

  Option? findOption(String id) {
    if (options.length == 0) return null;
    return options.firstWhereOrNull((element) => element.id == id);
  }
}
