import 'dart:convert';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Category.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceLink.dart';

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
  int? deliveryDetailsId;

  List<Item> currentSpecials = <Item>[];
  List<Item> pastSpecials = <Item>[];
  List<Operator> operators = [];

  bool selfDelivery;
  ServiceLink? serviceLink;
  List<Category> _categories = <Category>[];
  List<Item> itemsWithoutCategory = <Item>[];
  RestaurantsView restaurantsView;
  PaymentInfo? paymentInfo;
  cModels.Schedule? schedule;
  Restaurant({
    required ServiceInfo userInfo,
    this.restaurantsView = RestaurantsView.Rows,
    required this.schedule,
    required this.paymentInfo,
    required ServiceState restaurantState,
    required cModels.ServiceProviderLanguage languages,
    required super.serviceDetailsId,
    required super.isOpen,
    super.deliveryCost,
    super.reviews,
    super.rate,
    super.currency,
    this.serviceLink,
    this.deliveryDetailsId,
    this.selfDelivery = false,
  }) : super(
            info: userInfo,
            schedule: schedule,
            languages: languages,
            state: restaurantState,
            paymentInfo: paymentInfo);

  // factory Restaurant.fromRestaurantData(
  //     {required String restaurantId, required restaurantData}) {
  //   mezDbgPrint("Restaurant id $restaurantId \n Data : $restaurantData");
  //   // List<Object?> availableLanguages =
  //   //     restaurantData["details"]["languages"] as List<Object?>;
  //   final ServiceState restaurantState =
  //       ServiceState.fromServiceStateData(restaurantData["state"]);
  //   LanguageMap? description;
  //   if (restaurantData["details"]["description"] != null) {
  //     description =
  //         convertToLanguageMap(restaurantData["details"]["description"]);
  //   }

  //   RestaurantsView restaurantsView = RestaurantsView.Rows;
  //   if (restaurantData["details"]["restaurantsView"] != null) {
  //     restaurantsView = restaurantData["details"]["restaurantsView"]
  //         .toString()
  //         .toRestaurantsView();
  //   }

  //   // final cModels.Schedule schedule =
  //   //     scheduleFromData(restaurantData["details"]["schedule"]);

  //   final PaymentInfo paymentInfo =
  //       // restaurantData["details"]["paymentInfo"] != servinull
  //       //     ? PaymentInfo.fromData(restaurantData["details"]["paymentInfo"])
  //       //     :
  //       PaymentInfo();

  //   final cModels.Language primaryLanguage = restaurantData["details"]
  //               ?["language"]?["primary"]
  //           .toString()
  //           .toLanguage() ??
  //       cModels.Language.EN;

  //   final cModels.Language? secondaryLanguage = restaurantData["details"]
  //           ?["language"]?["secondary"]
  //       .toString()
  //       .toLanguage();

  //   final num? rate = (restaurantData?["details"]?["rating"].toString() != null)
  //       ? num.tryParse(restaurantData["details"]?["rating"]?.toString() ?? "")
  //       : null;
  //   // primaryLanguage.toOpLang();
  //   final Restaurant restaurant = Restaurant(
  //       serviceDetailsId: 1,
  //       userInfo: ServiceInfo.fromData(restaurantData["info"]),
  //       schedule: schedule,
  //       restaurantState: restaurantState,
  //       restaurantsView: restaurantsView,
  //       languages: cModels.ServiceProviderLanguage(
  //           primary: primaryLanguage, secondary: secondaryLanguage),
  //       rate: rate,
  //       paymentInfo: paymentInfo);
  //   // if (restaurantData["details"]["reviews"] != null) {
  //   //   restaurantData["details"]["reviews"]?.forEach((key, review) {
  //   //     restaurant.reviews.add(Review.fromMap(key, review));
  //   //   });
  //   // }
  //   if (restaurantData['menu'] != null) {
  //     if (restaurantData["menu"]?["specials"] != null ||
  //         restaurantData["menu"]?["daily"] != null) {
  //       restaurantData["menu"]?["specials"]?["current"]
  //           ?.forEach((key, element) {
  //         restaurant.currentSpecials.add(Item.itemFromData(key, element));
  //       });
  //       restaurantData["menu"]?["specials"]?["past"]?.forEach((key, element) {
  //         restaurant.pastSpecials.add(Item.itemFromData(key, element));
  //       });
  //       restaurantData["menu"]?["daily"]?.forEach((categoryId, categoryData) {
  //         restaurant._categories
  //             .add(Category.fromData(categoryId, categoryData));
  //       });
  //     } else {
  //       restaurantData["menu"].forEach((itemId, itemdata) {
  //         restaurant.itemsWithoutCategory
  //             .add(Item.itemFromData(itemId, itemdata));
  //       });
  //     }
  //   }

  //   restaurant._categories
  //       .sort((Category a, Category b) => a.position.compareTo(b.position));
  //   restaurant.reviews
  //       .sort((Review a, Review b) => b.reviewTime.compareTo(a.reviewTime));
  //   return restaurant;
  // }

  void setCategories(List<Category> cats) {
    _categories = cats;
    _categories
        .sort((Category a, Category b) => a.position.compareTo(b.position));
  }

  void setSpecials(List<Item> items) {
    mezDbgPrint("Setting Specials 🥺🥺🥺🥺🥺===>${items.length}");
    currentSpecials = items
        .where((Item element) =>
            (element.endsAt!.toLocal().isAfter(DateTime.now().toLocal()) ||
                element.endsAt!
                    .toLocal()
                    .isAtSameMomentAs(DateTime.now().toLocal())))
        .toList();
    pastSpecials = items
        .where((Item element) =>
            !(element.endsAt!.toLocal().isAfter(DateTime.now().toLocal()) ||
                element.endsAt!
                    .toLocal()
                    .isAtSameMomentAs(DateTime.now().toLocal())))
        .toList();
  }

  int get restaurantId => info.hasuraId;

  List<Category> get getAvailableCategories {
    List<Category> categories = _categories
        .where((Category category) => category.id != kNoCategoryNode)
        .toList();
    categories = categories
        .where((Category element) => element.getAvailableItems.isNotEmpty)
        .toList();
    categories.forEach((Category category) {
      category.sortItems();
    });
    return categories;
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
      final Category noCategory = Category();
      noCategory.items = itemsWithoutCategory;
      return noCategory;
    } else {
      return null;
    }
  }

  List<Item>? get getAvItemsWithoutCategories {
    List<Item>? items = _categories
        .firstWhereOrNull((Category category) => category.id == kNoCategoryNode)
        ?.items;
    items = items?.where((Item element) => element.available == true).toList();
    items?.sort((Item a, Item b) => a.position.compareTo(b.position));
    return items;
  }

  List<Item>? get getItemsWithoutCategory {
    final List<Item>? items = _categories
        .firstWhereOrNull((Category category) => category.id == kNoCategoryNode)
        ?.items;
    items?.sort((Item a, Item b) => a.position.compareTo(b.position));
    return items;
  }

  Item? findItemById({
    required String id,
  }) {
    Item? returnVal;
    mezDbgPrint("Restaurant cats::len ==> ${_categories.length}");
    currentSpecials.forEach((Item item) {
      mezDbgPrint("[66][currentSpecials]  => Item ${item.id}");
      if (item.id == id) returnVal = item;
    });
    if (returnVal == null) {
      pastSpecials.forEach((Item item) {
        mezDbgPrint("[66][pastSpecials]  => Item ${item.id}");

        if (item.id == id) returnVal = item;
      });
    }

    if (returnVal == null) {
      _categories.forEach((Category category) {
        category.items.forEach((Item item) {
          mezDbgPrint(
              "[66][_categories] |_ [category.items]  => Item ${item.id}");

          if (item.id == id) returnVal = item;
        });
      });
      if (returnVal == null) {
        getAvItemsWithoutCategories?.forEach((Item element) {
          mezDbgPrint(
              "[66][getAvItemsWithoutCategories]  => Item ${element.id}");

          if (element.id == id) {
            returnVal = element;
          }
        });
      }
    }

    return returnVal;
  }

  bool get hasSchedule {
    return schedule != null && schedule!.openHours.isNotEmpty;
  }

  bool acceptPayment(cModels.PaymentType p) {
    return paymentInfo?.acceptedPayments[p] == true;
  }

  double getAverageCost() {
    double allItemsCost = 0;

    getAvItemsWithoutCategories?.forEach((Item element) {
      allItemsCost += element.cost;
    });
    getAvailableCategories.forEach((Category element) {
      element.items.forEach((Item element) {
        allItemsCost += element.cost;
      });
    });
    final double averageCost = allItemsCost / getNumberOfitems();
    return averageCost;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      // "description": description?.toFirebaseFormat(),
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
    return numberOfItems + (getAvItemsWithoutCategories?.length ?? 0);
  }

  List<Item> getAllItems() {
    final List<Item> data = [];
    _categories.forEach((Category element) {
      data.addAll(element.items);
    });
    data.addAll(itemsWithoutCategory);
    return data;
  }

  Restaurant copyWith({
    ServiceInfo? userInfo,
    ServiceState? state,
    bool? selfDelivery,
    PaymentInfo? paymentInfo,
    cModels.Schedule? schedule,
    int? deliveryDetailsId,
    cModels.ServiceProviderLanguage? languages,
  }) {
    return Restaurant(
      serviceDetailsId: 1,
      isOpen: isOpen,
      userInfo: userInfo ?? info,
      languages: languages ?? this.languages,
      deliveryDetailsId: deliveryDetailsId ?? this.deliveryDetailsId,
      selfDelivery: selfDelivery ?? this.selfDelivery,
      schedule: schedule ?? this.schedule,
      paymentInfo: paymentInfo ?? this.paymentInfo,
      restaurantState: state ?? this.state,
    );
  }
}
