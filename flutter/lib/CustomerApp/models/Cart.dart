import 'dart:math';

import 'package:collection/collection.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class Cart {
  List<CartItem> cartItems = <CartItem>[];
  Location? toLocation;
  Restaurant? restaurant;
  String? notes;
  PaymentType paymentType = PaymentType.Cash;
  final num shippingCost = 40;

  Cart({this.restaurant});

  Cart.fromCartData(dynamic cartData, this.restaurant) {
    mezDbgPrint("@sa@d@: Cart.fromCartData ===> $cartData");
    if (restaurant != null) {
      cartData["items"]?.forEach((dynamic itemId, dynamic itemData) {
        final Item? item = restaurant!.findItemById(itemData["id"]);
        if (item == null) return;
        final CartItem cartItem = CartItem(item, restaurant!.info.id,
            id: itemId,
            quantity: itemData["quantity"],
            notes: itemData["notes"]);
        itemData["options"]?["chosenOneOptions"]
            .forEach((dynamic chooseOneOptionId, dynamic data) {
          final ChooseOneOptionListItem? chosenOneOptionListItem = item
              .findChooseOneOption(chooseOneOptionId)
              ?.findChooseOneOptionListItem(data["chosenOptionId"]);
          mezDbgPrint(chosenOneOptionListItem?.toJson());
          if (chosenOneOptionListItem != null)
            cartItem.setNewChooseOneItem(
                chooseOneOptionId: chooseOneOptionId,
                newChooseOneOptionListItem: chosenOneOptionListItem); //id
        });

        itemData["options"]?["chosenManyOptions"]
            ?.forEach((dynamic id, dynamic data) {
          cartItem.setNewChooseManyItem(
              chooseManyOptionId: id, newVal: data["chosenValue"]);
        });
        cartItems.add(cartItem);
      });
      toLocation = cartData["to"] != null
          ? Location.fromFirebaseData(cartData["to"])
          : null;
      notes = cartData["notes"];
    }
  }

  int quantity() {
    if (cartItems.length == 0) return 0;
    return cartItems.fold(0, (sum, cartItem) => sum + cartItem.quantity);
  }

  num itemsCost() {
    if (cartItems.length == 0) return 0;
    return cartItems.fold<num>(
      0,
      (sum, cartItem) => sum + cartItem.totalCost(),
    );
  }

  num totalCost() {
    return itemsCost() + shippingCost;
  }

  void addItem(CartItem cartItem) {
    if (cartItem.id == null) {
      cartItem.id = getRandomString(5);
    } else {
      final int index =
          cartItems.indexWhere((CartItem element) => element.id == cartItem.id);
      cartItems.removeAt(index);
    }
    cartItems.add(CartItem.clone(cartItem));
  }

  void incrementItem(String id, int quantity) {
    final CartItem? item = getItem(id);
    if (item != null) item.quantity += quantity;
  }

  void deleteItem(String itemId) {
    final int index =
        cartItems.indexWhere((CartItem element) => element.id == itemId);
    cartItems.removeAt(index);
  }

  CartItem? getItem(String id) {
    return cartItems.firstWhereOrNull((CartItem element) => element.id == id);
  }

  void setCartNotes(String? notes) => this.notes = notes;

  Map<String, dynamic> toFirebaseFormattedJson() {
    final Map<String, dynamic> items = <String, dynamic>{};
    cartItems.forEach((CartItem element) {
      items[element.id!] = element.toFirebaseFunctionFormattedJson();
    });

    return <String, dynamic>{
      "orderType": OrderType.Restaurant.toFirebaseFormatString(),
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
}

class CartChooseOneItem {
  ChooseOneOption optionDetails;
  ChooseOneOptionListItem chosenOptionDetails;

  CartChooseOneItem({
    required this.optionDetails,
    required this.chosenOptionDetails,
  });
}

class CartChooseManyItem {
  ChooseManyOption optionDetails;
  bool chosen;

  CartChooseManyItem({required this.optionDetails, required this.chosen});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "optionDetails": optionDetails.toJson(),
      "chosen": chosen,
    };
  }
}

class CartItem {
  String restaurantId;
  String? id;
  Item item;
  int quantity;
  String? notes;
  List<CartChooseOneItem> cartChooseOneItems = <CartChooseOneItem>[];
  List<CartChooseManyItem> cartChooseManyItems = <CartChooseManyItem>[];

  CartItem(this.item, this.restaurantId,
      {this.id, this.quantity = 1, this.notes}) {
    item.chooseOneOptions.forEach((ChooseOneOption chooseOneOption) {
      cartChooseOneItems.add(CartChooseOneItem(
          optionDetails: chooseOneOption,
          chosenOptionDetails: chooseOneOption.chooseOneOptionListItems[0]));
    });
    item.chooseManyOptions.forEach((ChooseManyOption chooseManyOption) {
      cartChooseManyItems.add(CartChooseManyItem(
          optionDetails: chooseManyOption,
          chosen: chooseManyOption.selectedByDefault));
    });
  }

  CartItem.fromData(this.item, this.restaurantId, this.id, this.quantity,
      this.notes, this.cartChooseOneItems, this.cartChooseManyItems);

  factory CartItem.clone(CartItem cartItem) {
    final CartItem newCartItem = CartItem(
      cartItem.item,
      cartItem.restaurantId,
      id: cartItem.id,
      quantity: cartItem.quantity,
      notes: cartItem.notes,
    );
    cartItem.cartChooseOneItems.forEach((CartChooseOneItem cartChooseOneItem) {
      newCartItem.setNewChooseOneItem(
          chooseOneOptionId: cartChooseOneItem.optionDetails.id,
          newChooseOneOptionListItem: cartChooseOneItem.chosenOptionDetails);
    });
    cartItem.cartChooseManyItems
        .forEach((CartChooseManyItem cartChooseManyItem) {
      newCartItem.setNewChooseManyItem(
          chooseManyOptionId: cartChooseManyItem.optionDetails.id,
          newVal: cartChooseManyItem.chosen);
    });
    return newCartItem;
  }

  void setNewChooseOneItem(
      {required String chooseOneOptionId,
      required ChooseOneOptionListItem newChooseOneOptionListItem}) {
    final int index = cartChooseOneItems.indexWhere(
      (CartChooseOneItem chooseOneItem) =>
          chooseOneItem.optionDetails.id == chooseOneOptionId,
    );

    if (index != -1) {
      cartChooseOneItems[index].chosenOptionDetails =
          newChooseOneOptionListItem;
    }
  }

  void setNewChooseManyItem(
      {required String chooseManyOptionId, required bool newVal}) {
    final int index = cartChooseManyItems.indexWhere(
      (CartChooseManyItem cartChooseManyItem) =>
          cartChooseManyItem.optionDetails.id == chooseManyOptionId,
    );
    if (index != -1) {
      cartChooseManyItems[index].chosen = newVal;
    }
  }

  CartChooseOneItem? findChooseOneItemById(String id) {
    return cartChooseOneItems.firstWhereOrNull(
      (CartChooseOneItem chooseOneItem) =>
          chooseOneItem.chosenOptionDetails.id == id,
    );
  }

  CartChooseManyItem? findChooseManyItemById(String id) {
    return cartChooseManyItems
        .firstWhereOrNull((CartChooseManyItem chooseManyItem) {
      return chooseManyItem.optionDetails.id == id;
    });
  }

  num costPerOne() {
    num costPerOne = item.cost;
    cartChooseOneItems.forEach((CartChooseOneItem cartChooseOneItem) {
      costPerOne += cartChooseOneItem.chosenOptionDetails.cost;
    });
    cartChooseManyItems.forEach((CartChooseManyItem cartChooseManyItem) {
      if (cartChooseManyItem.chosen)
        costPerOne += cartChooseManyItem.optionDetails.cost;
    });
    return costPerOne;
  }

  num totalCost() {
    // return 0;
    return quantity * costPerOne();
  }

  Map<String, dynamic> toFirebaseFunctionFormattedJson() {
    final Map<String, dynamic> json = <String, dynamic>{
      "id": item.id,
      "quantity": quantity,
      "totalCost": totalCost(),
      "costPerOne": costPerOne(),
      "name": item.name.toFirebaseFormat(),
      "image": item.image,
      "options": <String, dynamic>{
        "chosenOneOptions": <String, dynamic>{},
        "chosenManyOptions": <String, dynamic>{},
      },
      "notes": notes
    };
    cartChooseOneItems.forEach((CartChooseOneItem cartChooseOneItem) {
      json["options"]["chosenOneOptions"]
          [cartChooseOneItem.optionDetails.id] = <String, dynamic>{
        "chosenOptionId": cartChooseOneItem.chosenOptionDetails.id,
        "chosenOptionName":
            cartChooseOneItem.chosenOptionDetails.name.toFirebaseFormat(),
        "name": cartChooseOneItem.optionDetails.name.toFirebaseFormat(),
        "chosenOptionCost": cartChooseOneItem.chosenOptionDetails.cost
      };
    });

    cartChooseManyItems.forEach((CartChooseManyItem cartChooseManyItem) {
      json["options"]["chosenManyOptions"]
          [cartChooseManyItem.optionDetails.id] = <String, dynamic>{
        "chosenValue": cartChooseManyItem.chosen,
        "name": cartChooseManyItem.optionDetails.name.toFirebaseFormat(),
        "chosenValueCost": cartChooseManyItem.optionDetails.cost
      };
    });
    return json;
  }
}

String getRandomString(int length) {
  final String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();
  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => _chars.codeUnitAt(
        _rnd.nextInt(_chars.length),
      ),
    ),
  );
}
