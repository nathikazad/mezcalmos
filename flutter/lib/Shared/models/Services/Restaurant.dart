import 'dart:convert';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';

class Restaurant {
  String id;
  String description;
  String name;
  String photo;
  String? location;
  Schedule? schedule;
  RestaurantState restaurantState;
  List<Item> items = [];

  Restaurant(
      {required this.id,
      required this.description,
      required this.name,
      required this.photo,
      this.location,
      this.schedule,
      required this.restaurantState});

  factory Restaurant.fromRestaurantData(
      {required String restaurantId, required dynamic restaurantData}) {
    String language = Get.find<LanguageController>().userLanguageKey;
    List<Object?> availableLanguages =
        restaurantData["details"]["languages"] as List<Object?>;
    if (!availableLanguages.contains(language)) {
      language = availableLanguages[0] as String;
    }

    RestaurantState restaurantState = RestaurantState(
        restaurantData["state"]?["authorizationStatus"]
                ?.toString()
                .toAuthorizationStatus() ??
            AuthorizationStatus.Unauthorized,
        restaurantData["state"]?["open"] ?? false);
    String name = restaurantData["info"]["name"];
    String photo = restaurantData["info"]["image"];
    String description = restaurantData["details"]["description"][language];
    Schedule? schedule = Schedule.fromData(restaurantData["info"]["openHours"]);
    Restaurant restaurant = Restaurant(
        id: restaurantId,
        description: description,
        name: name,
        photo: photo,
        schedule: schedule,
        restaurantState: restaurantState);
    restaurantData["menu"].forEach((dynamic itemId, dynamic itemData) {
      restaurant.items
          .add(Item.itemFromData(itemId, itemData, language: language));
    });
    return restaurant;
  }

  Item findItemById(String id) {
    return this.items.firstWhere((item) => item.id == id);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "description": description,
      "name": name,
      "items": jsonEncode(items),
      "restaurantState": restaurantState.toJson()
    };
  }
}


class RestaurantState {
  AuthorizationStatus authorizationStatus = AuthorizationStatus.Unauthorized;
  bool open = false;
  RestaurantState(this.authorizationStatus, this.open);
  Map<String, dynamic> toJson() => {
        "authorizationStatus": authorizationStatus.toFirebaseFormatString(),
        "open": open
      };

  bool get authorized =>
      this.authorizationStatus == AuthorizationStatus.Authorized;
}

class ChooseManyOption {
  String? id;
  bool selectedByDefault = false;
  num cost = 0;
  String? name;

  ChooseManyOption.fromData(String id, dynamic data, String language) {
    this.id = id;
    this.name = data["name"][language];
    this.cost = data["cost"];
    this.selectedByDefault = data["default"] ?? false;
  }
  Map<String, dynamic> toJson() => {"id": id, "cost": cost, "name": name};
}

class ChooseOneOption {
  String? id;
  String? name;
  String? dialog;
  List<ChooseOneOptionListItem> chooseOneOptionListItems = [];
  ChooseOneOption.fromData(String id, dynamic data, String language) {
    this.id = id;
    name = data["name"][language];
    dialog = data["dialog"][language];
    data["options"].forEach((dynamic optionId, dynamic optionData) {
      ChooseOneOptionListItem chooseOneOptionListItem = ChooseOneOptionListItem(
          optionId, optionData["name"][language], optionData["cost"]);
      chooseOneOptionListItems.add(chooseOneOptionListItem);
    });
  }

  ChooseOneOptionListItem? findChooseOneOptionListItem(String id) {
    if (this.chooseOneOptionListItems.length == 0) return null;
    return this
        .chooseOneOptionListItems
        .firstWhere((element) => element.id == id);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "dialog": dialog,
        "chooseOneOptionListItems": jsonEncode(chooseOneOptionListItems)
      };
}

class ChooseOneOptionListItem {
  String? id;
  num cost = 0;
  String? name;
  ChooseOneOptionListItem(this.id, this.name, this.cost);
  Map<String, dynamic> toJson() => {"id": id, "cost": cost, "name": name};
}

// class Sides {
//   List<ChooseOneOption> chooseOneOptions = [];
//   List<ChooseManyOption> chooseManyOptions = [];
//   Sides();
//   Sides.fromData(dynamic sidesData, String language) {
//     if (sidesData["chooseOne"] != null) {
//       sidesData["chooseOne"].forEach((dynamic optionId, dynamic optionData) {
//         chooseOneOptions
//             .add(ChooseOneOption.fromData(optionId, optionData, language));
//       });
//     }
//     if (sidesData["chooseMany"] != null) {
//       sidesData["chooseMany"].forEach((dynamic optionId, dynamic optionData) {
//         chooseManyOptions
//             .add(ChooseManyOption.fromData(optionId, optionData, language));
//       });
//     }
//   }
//   Map<String, dynamic> toJson() => {
//         "chooseOneOptions": jsonEncode(chooseOneOptions),
//         "chooseManyOptions": jsonEncode(chooseManyOptions)
//       };
// }

class Item {
  String? id;
  bool? available;
  String? description;
  String? image;
  String? name;
  num cost = 0;
  List<ChooseOneOption> chooseOneOptions = [];
  List<ChooseManyOption> chooseManyOptions = [];
  // Sides sides = new Sides();
  Item(this.id, this.available, this.description, this.image, this.name,
      this.cost);

  factory Item.itemFromData(String itemId, dynamic itemData,
      {String? language}) {
    if (language == null) {
      language = Get.find<LanguageController>().userLanguageKey;
    }
    Item item = Item(
        itemId,
        itemData["available"],
        itemData["description"][language],
        itemData["image"],
        itemData["name"][language],
        itemData["cost"]);
    if (itemData["options"]?["chooseOne"] != null) {
      itemData["options"]["chooseOne"]
          .forEach((dynamic optionId, dynamic optionData) {
        item.chooseOneOptions
            .add(ChooseOneOption.fromData(optionId, optionData, language!));
      });
    }
    if (itemData["options"]?["chooseMany"] != null) {
      itemData["options"]["chooseMany"]
          .forEach((dynamic optionId, dynamic optionData) {
        item.chooseManyOptions
            .add(ChooseManyOption.fromData(optionId, optionData, language!));
      });
    }
    // if (itemData["options"]["sides"] != null) {
    //   item.sides = Sides.fromData(itemData["options"]["sides"], language);
    // }
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
    return this.chooseOneOptions.firstWhere((element) => element.id == id);
  }

  ChooseManyOption? findChooseManyOption(String id) {
    if (this.chooseOneOptions.length == 0) return null;
    return this.chooseManyOptions.firstWhere((element) => element.id == id);
  }
}
