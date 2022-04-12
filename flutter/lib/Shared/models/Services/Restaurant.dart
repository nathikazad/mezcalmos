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

class ChooseManyOption {
  String id;
  bool selectedByDefault;
  num cost;
  Map<LanguageType, String> name;

  ChooseManyOption(
      {required this.id,
      this.selectedByDefault = false,
      this.cost = 0,
      required this.name});

  factory ChooseManyOption.fromData(String id, dynamic data) {
    return ChooseManyOption(
        id: id,
        name: convertToLanguageMap(data["name"]),
        cost: data["cost"],
        selectedByDefault: data["default"] ?? false);
  }
  Map<String, dynamic> toJson() => {"id": id, "cost": cost, "name": name};
}

class ChooseOneOption {
  String id;
  Map<LanguageType, String> name;
  String? dialog;
  List<ChooseOneOptionListItem> chooseOneOptionListItems = [];

  ChooseOneOption({required this.id, required this.name, this.dialog});

  factory ChooseOneOption.fromData(String id, dynamic data) {
    ChooseOneOption chooseOneOption = ChooseOneOption(
        id: id,
        name: convertToLanguageMap(data["name"]),
        // data["name"].toLanguageMap(),
        //TODO:change this
        dialog: data["dialog"]["es"]);
    data["options"].forEach((dynamic optionId, dynamic optionData) {
      //mezDbgPrint(optionData["name"]);
      ChooseOneOptionListItem chooseOneOptionListItem = ChooseOneOptionListItem(
          optionId,
          convertToLanguageMap(optionData["name"]),
          optionData["cost"]);
      chooseOneOption.chooseOneOptionListItems.add(chooseOneOptionListItem);
    });
    return chooseOneOption;
  }

  ChooseOneOptionListItem? findChooseOneOptionListItem(String id) {
    if (this.chooseOneOptionListItems.length == 0) return null;
    return this
        .chooseOneOptionListItems
        .firstWhereOrNull((element) => element.id == id);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "dialog": dialog,
        "chooseOneOptionListItems": jsonEncode(chooseOneOptionListItems)
      };
}

class ChooseOneOptionListItem {
  String id;
  num cost = 0;
  Map<LanguageType, String> name;
  ChooseOneOptionListItem(this.id, this.name, this.cost);
  Map<String, dynamic> toJson() =>
      {"id": id, "cost": cost, "name": name.toFirebaseFormat()};
}

class Item {
  String id;
  bool available;
  Map<LanguageType, String>? description;
  String? image;
  Map<LanguageType, String> name;
  num cost = 0;
  List<ChooseOneOption> chooseOneOptions = [];
  List<ChooseManyOption> chooseManyOptions = [];
  // Sides sides = new Sides();
  Item(
      {required this.id,
      this.available = false,
      this.description,
      this.image,
      required this.name,
      required this.cost});

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
    if (itemData["options"]?["chooseOne"] != null) {
      itemData["options"]["chooseOne"]
          .forEach((dynamic optionId, dynamic optionData) {
        item.chooseOneOptions
            .add(ChooseOneOption.fromData(optionId, optionData));
      });
    }
    if (itemData["options"]?["chooseMany"] != null) {
      itemData["options"]["chooseMany"]
          .forEach((dynamic optionId, dynamic optionData) {
        item.chooseManyOptions
            .add(ChooseManyOption.fromData(optionId, optionData));
      });
    }
    return item;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "available": available,
      "description": description,
      "image": image,
      "cost": cost,
      "name": name,
      "chooseOneOptions": jsonEncode(chooseOneOptions),
      "chooseManyOptions": jsonEncode(chooseManyOptions)
    };
  }

  ChooseOneOption? findChooseOneOption(String id) {
    if (this.chooseOneOptions.length == 0) return null;
    return this
        .chooseOneOptions
        .firstWhereOrNull((element) => element.id == id);
  }

  ChooseManyOption? findChooseManyOption(String id) {
    if (this.chooseOneOptions.length == 0) return null;
    return this
        .chooseManyOptions
        .firstWhereOrNull((element) => element.id == id);
  }
}
