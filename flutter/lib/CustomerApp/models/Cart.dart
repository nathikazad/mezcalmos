import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'dart:math';
import 'package:collection/collection.dart';

class Cart {
  List<CartItem> cartItems = [];
  Location? toLocation;
  Restaurant? restaurant;
  String? notes;
  PaymentType paymentType = PaymentType.Cash;
  final num shippingCost = 40;
  Cart({this.restaurant});

  Cart.fromCartData(dynamic cartData, this.restaurant) {
    mezDbgPrint("@sa@d@: Cart.fromCartData ===> $cartData");
    if (this.restaurant != null) {
      cartData["items"]?.forEach((dynamic itemId, dynamic itemData) {
        Item? item = this.restaurant!.findItemById(itemData["id"]);
        if (item == null) return;
        CartItem cartItem = CartItem(item, restaurant!.info.id,
            id: itemId,
            quantity: itemData["quantity"],
            notes: itemData["notes"]);
        itemData["options"]?["chosenOneOptions"]
            .forEach((dynamic chooseOneOptionId, dynamic data) {
          ChooseOneOptionListItem? chosenOneOptionListItem = item
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
        this.cartItems.add(cartItem);
      });
      this.toLocation = cartData["to"] != null
          ? Location.fromFirebaseData(cartData["to"])
          : null;
      this.notes = cartData["notes"];
    }
  }
  int quantity() {
    if (this.cartItems.length == 0) return 0;
    return this.cartItems.fold(0, (sum, cartItem) => sum + cartItem.quantity);
  }

  num itemsCost() {
    if (this.cartItems.length == 0) return 0;
    return this
        .cartItems
        .fold<num>(0, (sum, cartItem) => sum + cartItem.totalCost());
  }

  num totalCost() {
    return itemsCost() + shippingCost;
  }

  void addItem(CartItem cartItem) {
    if (cartItem.id == null) {
      cartItem.id = getRandomString(5);
    } else {
      int index =
          this.cartItems.indexWhere((element) => element.id == cartItem.id);
      this.cartItems.removeAt(index);
    }
    this.cartItems.add(CartItem.clone(cartItem));
  }

  void incrementItem(String id, int quantity) {
    CartItem? item = getItem(id);
    if (item != null) item.quantity += quantity;
  }

  void deleteItem(String itemId) {
    int index = this.cartItems.indexWhere((element) => element.id == itemId);
    this.cartItems.removeAt(index);
  }

  CartItem? getItem(String id) {
    return this.cartItems.firstWhereOrNull((element) => element.id == id);
  }

  void setCartNotes(String? notes) => this.notes = notes;

  Map<String, dynamic> toFirebaseFormattedJson() {
    Map<String, dynamic> items = {};
    this.cartItems.forEach((element) {
      items[element.id!] = element.toFirebaseFunctionFormattedJson();
    });

    return <String, dynamic>{
      "orderType": OrderType.Restaurant.toFirebaseFormatString(),
      "serviceProviderId": restaurant?.info.id,
      "quantity": this.quantity(),
      "cost": this.totalCost().toInt(),
      "itemsCost": this.itemsCost().toInt(),
      "shippingCost": this.shippingCost,
      "items": items,
      "notes": notes,
      "to": this.toLocation?.toFirebaseFormattedJson(),
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

  Map toJson() {
    return {
      "optionDetails": this.optionDetails.toJson(),
      "chosen": this.chosen
    };
  }
}

class CartItem {
  String restaurantId;
  String? id;
  Item item;
  int quantity;
  String? notes;
  List<CartChooseOneItem> cartChooseOneItems = [];
  List<CartChooseManyItem> cartChooseManyItems = [];

  CartItem(this.item, this.restaurantId,
      {this.id, this.quantity = 1, this.notes}) {
    this.item.chooseOneOptions.forEach((chooseOneOption) {
      cartChooseOneItems.add(CartChooseOneItem(
          optionDetails: chooseOneOption,
          chosenOptionDetails: chooseOneOption.chooseOneOptionListItems[0]));
    });
    this.item.chooseManyOptions.forEach((chooseManyOption) {
      cartChooseManyItems.add(CartChooseManyItem(
          optionDetails: chooseManyOption,
          chosen: chooseManyOption.selectedByDefault));
    });
  }
  CartItem.fromData(this.item, this.restaurantId, this.id, this.quantity,
      this.notes, this.cartChooseOneItems, this.cartChooseManyItems);

  factory CartItem.clone(CartItem cartItem) {
    CartItem newCartItem = CartItem(
      cartItem.item,
      cartItem.restaurantId,
      id: cartItem.id,
      quantity: cartItem.quantity,
      notes: cartItem.notes,
    );
    cartItem.cartChooseOneItems.forEach((cartChooseOneItem) {
      newCartItem.setNewChooseOneItem(
          chooseOneOptionId: cartChooseOneItem.optionDetails.id,
          newChooseOneOptionListItem: cartChooseOneItem.chosenOptionDetails);
    });
    cartItem.cartChooseManyItems.forEach((cartChooseManyItem) {
      newCartItem.setNewChooseManyItem(
          chooseManyOptionId: cartChooseManyItem.optionDetails.id,
          newVal: cartChooseManyItem.chosen);
    });
    return newCartItem;
  }

  void setNewChooseOneItem(
      {required String chooseOneOptionId,
      required ChooseOneOptionListItem newChooseOneOptionListItem}) {
    int index = cartChooseOneItems.indexWhere(
        (chooseOneItem) => chooseOneItem.optionDetails.id == chooseOneOptionId);

    if (index != -1) {
      cartChooseOneItems[index].chosenOptionDetails =
          newChooseOneOptionListItem;
    }
  }

  void setNewChooseManyItem(
      {required String chooseManyOptionId, required bool newVal}) {
    int index = cartChooseManyItems.indexWhere((cartChooseManyItem) =>
        cartChooseManyItem.optionDetails.id == chooseManyOptionId);
    if (index != -1) {
      cartChooseManyItems[index].chosen = newVal;
    }
  }

  CartChooseOneItem? findChooseOneItemById(String id) {
    return cartChooseOneItems.firstWhereOrNull(
      (chooseOneItem) => chooseOneItem.chosenOptionDetails.id == id,
    );
  }

  CartChooseManyItem? findChooseManyItemById(String id) {
    return cartChooseManyItems.firstWhereOrNull((chooseManyItem) {
      return chooseManyItem.optionDetails.id == id;
    });
  }

  num costPerOne() {
    num costPerOne = this.item.cost;
    this.cartChooseOneItems.forEach((cartChooseOneItem) {
      costPerOne += cartChooseOneItem.chosenOptionDetails.cost;
    });
    this.cartChooseManyItems.forEach((cartChooseManyItem) {
      if (cartChooseManyItem.chosen)
        costPerOne += cartChooseManyItem.optionDetails.cost;
    });
    return costPerOne;
  }

  num totalCost() {
    // return 0;
    return this.quantity * costPerOne();
  }

  Map<String, dynamic> toFirebaseFunctionFormattedJson() {
    Map<String, dynamic> json = <String, dynamic>{
      "id": this.item.id,
      "quantity": this.quantity,
      "totalCost": this.totalCost(),
      "costPerOne": this.costPerOne(),
      "name": this.item.name.toFirebaseFormat(),
      "image": this.item.image,
      "options": {"chosenOneOptions": {}, "chosenManyOptions": {}},
      "notes": notes
    };
    this.cartChooseOneItems.forEach((cartChooseOneItem) {
      json["options"]["chosenOneOptions"]
          [cartChooseOneItem.optionDetails.id] = {
        "chosenOptionId": cartChooseOneItem.chosenOptionDetails.id,
        "chosenOptionName":
            cartChooseOneItem.chosenOptionDetails.name.toFirebaseFormat(),
        "name": cartChooseOneItem.optionDetails.name.toFirebaseFormat(),
        "chosenOptionCost": cartChooseOneItem.chosenOptionDetails.cost
      };
    });

    this.cartChooseManyItems.forEach((cartChooseManyItem) {
      json["options"]["chosenManyOptions"]
          [cartChooseManyItem.optionDetails.id] = {
        "chosenValue": cartChooseManyItem.chosen,
        "name": cartChooseManyItem.optionDetails.name.toFirebaseFormat(),
        "chosenValueCost": cartChooseManyItem.optionDetails.cost
      };
    });
    return json;
  }
}

String getRandomString(int length) {
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  return String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
