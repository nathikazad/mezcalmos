import 'dart:math';

import 'package:collection/collection.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
// ignore_for_file: avoid_annotating_with_dynamic
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

class Cart {
  List<CartItem> cartItems = <CartItem>[];
  Location? toLocation;
  Restaurant? restaurant;
  String? notes;
  PaymentType paymentType = PaymentType.Cash;
  num? shippingCost;
  RouteInformation? _routeInformation;

  Cart({this.restaurant});

  set setRouteInformation(RouteInformation? info) => _routeInformation = info;

  Cart.fromCartData(dynamic cartData, this.restaurant, num? shippingPrice) {
    if (restaurant != null) {
      cartData["items"]?.forEach((itemIdInCart, itemData) {
        final Item? item = restaurant!.findItemById(itemData["id"]);

        if (item != null)
          cartItems.add(CartItem.fromData(
              itemData: itemData,
              restaurant: restaurant!,
              item: item,
              itemIdInCart: itemIdInCart));
      });
      toLocation = cartData["to"] != null
          ? Location.fromFirebaseData(cartData["to"])
          : null;
      notes = cartData["notes"];
      shippingCost = shippingPrice ?? 50;
      _routeInformation = cartData['routeInformation'] == null
          ? null
          : RouteInformation(
              polyline: cartData['routeInformation']['polyline'],
              distance: RideDistance.fromJson(
                cartData['routeInformation']['distance'],
              ),
              duration: RideDuration.fromJson(
                cartData['routeInformation']['duration'],
              ),
            );
    }
  }

  Map<String, dynamic> toFirebaseFormattedJson() {
    final Map<String, dynamic> items = {};
    cartItems.forEach((CartItem cartItem) {
      items[cartItem.idInCart!] = cartItem.toFirebaseFunctionFormattedJson();
    });

    return <String, dynamic>{
      "orderType": OrderType.Restaurant.toFirebaseFormatString(),
      "routeInformation": _routeInformation?.toJson(),
      "serviceProviderId": restaurant?.info.id,
      "quantity": quantity(),
      "cost": totalCost().toInt(),
      "itemsCost": itemsCost().toInt(),
      "shippingCost": shippingCost,
      "items": items,
      "notes": notes,
      "to": toLocation?.toFirebaseFormattedJson(),
      "paymentType": paymentType.toFirebaseFormatString()
    };
  }

  int quantity() {
    if (cartItems.length == 0) return 0;
    return cartItems.fold(
        0, (int sum, CartItem cartItem) => sum + cartItem.quantity);
  }

  num itemsCost() {
    if (cartItems.length == 0) return 0;
    return cartItems.fold<num>(
        0, (num sum, CartItem cartItem) => sum + cartItem.totalCost());
  }

  num totalCost() {
    if (shippingCost != null) {
      return itemsCost() + shippingCost!;
    } else {
      return itemsCost();
    }
  }

  void addItem(CartItem cartItem) {
    if (cartItem.idInCart == null) {
      cartItem.idInCart = getRandomString(5);
    } else {
      final int index = cartItems.indexWhere(
          (CartItem element) => element.idInCart == cartItem.idInCart);
      cartItems.removeAt(index);
    }
    cartItems.add(CartItem.clone(cartItem));
  }

  void incrementItem(String id, int quantity) {
    final CartItem? item = getItem(id);
    if (item != null) item.quantity += quantity;
  }

  void deleteItem(String itemId) {
    cartItems.removeWhere((CartItem cartItem) => cartItem.idInCart == itemId);
  }

  CartItem? getItem(String id) {
    return cartItems
        .firstWhereOrNull((CartItem cartItem) => cartItem.idInCart == id);
  }

  void setCartNotes(String? notes) => this.notes = notes;
}

class CartItem {
  String restaurantId;
  String? idInCart;
  Item item;
  int quantity;
  String? notes;
  //optionId and list of choices for that option
  Map<String, List<Choice>> chosenChoices = <String, List<Choice>>{};

  CartItem(this.item, this.restaurantId,
      {this.idInCart, this.quantity = 1, this.notes}) {
    item.options.forEach((Option option) {
      chosenChoices[option.id] = <Choice>[];
    });
  }

  factory CartItem.fromData({
    required dynamic itemData,
    required Item item,
    required Restaurant restaurant,
    required String itemIdInCart,
  }) {
    final CartItem cartItem = CartItem(
      item,
      restaurant.info.id,
      idInCart: itemIdInCart,
      quantity: itemData["quantity"],
      notes: itemData["notes"],
    );

    itemData["choices"]?.forEach((optionId, optionData) {
      if (item.findOption(optionId) != null) {
        cartItem.chosenChoices[optionId] = <Choice>[];
        optionData["choices"]?.forEach((dynamic choiceData) {
          final Choice? choice = item
              .findOption(optionId)!
              .findChoice(convertToLanguageMap(choiceData["name"]));
          if (choice != null) cartItem.chosenChoices[optionId]!.add(choice);
        });
      }
    });

    return cartItem;
  }

  Map<String, dynamic> toFirebaseFunctionFormattedJson() {
    final Map<String, dynamic> json = <String, dynamic>{
      "id": item.id,
      "quantity": quantity,
      "totalCost": totalCost(),
      "costPerOne": costPerOne(),
      "name": item.name.toFirebaseFormat(),
      "image": item.image,
      "chosenChoices": {},
      "notes": notes
    };

    chosenChoices.forEach((String optionId, List<Choice> choices) {
      final List data = [];
      choices.forEach((Choice choice) {
        data.add(choice.toJson());
      });

      json["chosenChoices"][optionId] = <String, dynamic>{};
      json["chosenChoices"][optionId]["optionName"] =
          item.findOption(optionId)?.name.toFirebaseFormat();
      json["chosenChoices"][optionId]["choices"] = data;
    });

    return json;
  }

  factory CartItem.clone(CartItem cartItem) {
    final CartItem newCartItem = CartItem(
      cartItem.item,
      cartItem.restaurantId,
      idInCart: cartItem.idInCart,
      quantity: cartItem.quantity,
      notes: cartItem.notes,
    );
    cartItem.chosenChoices.forEach((String optionId, List<Choice> choices) {
      newCartItem.chosenChoices[optionId] = <Choice>[...choices]; // hard copy
    });
    return newCartItem;
  }

  void setNewChoices(
      {required String optionId, required List<Choice> newChoices}) {
    chosenChoices[optionId] = newChoices;
  }

  num costPerOne() {
    num costPerOne = item.cost;
    // if(chosenChoices.length > item.options
    chosenChoices.forEach((String optionId, List<Choice> choices) {
      final Option? option = item.findOption(optionId);
      if (option != null) {
        if (choices.length > option.freeChoice) {
          costPerOne +=
              (choices.length - option.freeChoice) * option.costPerExtra;
        }
        choices.forEach((Choice choice) {
          costPerOne += choice.cost;
        });
      }
    });
    return costPerOne;
  }

  num totalCost() {
    // return 0;

    return quantity * costPerOne();
  }
}

String getRandomString(int length) {
  const String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();
  return String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
