import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'dart:math';

import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class CartItem {
  String restaurantId;
  String? id;
  Item item;
  Map<String, String> _chosenOneOptions = {};
  Map<String, bool> _chosenManyOptions = {};
  int quantity;
  String? notes;
  Map<String, String> get chosenOneOptions => _chosenOneOptions;
  Map<String, bool> get chosenManyOptions => _chosenManyOptions;

  CartItem(this.item, this.restaurantId, {this.quantity = 1}) {
    this.item.chooseOneOptions.forEach((chooseOneOption) {
      _chosenOneOptions[chooseOneOption.id!] =
          chooseOneOption.chooseOneOptionListItems[0].id!;
    });
    this.item.chooseManyOptions.forEach((chooseManyOption) {
      _chosenManyOptions[chooseManyOption.id!] =
          chooseManyOption.selectedByDefault;
    });
  }
  CartItem.withData(this.item, this.restaurantId, this.id, this.quantity,
      this.notes, this._chosenOneOptions, this._chosenManyOptions);

  factory CartItem.clone(CartItem cartItem) {
    return CartItem.withData(
      cartItem.item,
      cartItem.restaurantId,
      cartItem.id,
      cartItem.quantity,
      cartItem.notes,
      cartItem._chosenOneOptions,
      cartItem._chosenManyOptions,
    );
  }

  num costPerOne() {
    num costPerOne = this.item.cost;
    this.item.chooseOneOptions.forEach((chooseOneOption) {
      String chosenId = _chosenOneOptions[chooseOneOption.id]!;
      costPerOne += chooseOneOption.findChooseOneOptionListItem(chosenId)!.cost;
    });
    this.item.chooseManyOptions.forEach((chooseManyOption) {
      if (_chosenManyOptions[chooseManyOption.id] ?? false)
        costPerOne += chooseManyOption.cost;
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
      "name": this.item.name,
      "image": this.item.image,
      "options": {"chosenOneOptions": {}, "chosenManyOptions": {}},
      "notes": notes
    };
    this.item.chooseOneOptions.forEach((e) {
      ChooseOneOption? chooseOneOption = this.item.findChooseOneOption(e.id!);
      ChooseOneOptionListItem? chooseOneOptionListItem = chooseOneOption
          ?.findChooseOneOptionListItem(this._chosenOneOptions[e.id]!);
      json["options"]["chosenOneOptions"][e.id] = {
        "chosenOptionId": this._chosenOneOptions[e.id],
        "chosenOptionName": chooseOneOptionListItem?.name,
        "name": chooseOneOption?.name,
        "chosenOptionCost": chooseOneOptionListItem?.cost ?? 0
      };
    });

    this.item.chooseManyOptions.forEach((e) {
      ChooseManyOption? chooseManyOption =
          this.item.findChooseManyOption(e.id!);
      if (this.chosenManyOptions[e.id] ?? false) {
        json["options"]["chosenManyOptions"][e.id] = {
          "chosenValue": this.chosenManyOptions[e.id],
          "name": chooseManyOption?.name,
          "chosenValueCost": chooseManyOption?.cost ?? 0
        };
      }
    });

    return json;
  }
}

class Cart {
  List<CartItem> items = [];
  Location? toLocation;
  Restaurant? restaurant;
  String? notes;
  PaymentType paymentType = PaymentType.Cash;
  Cart({this.restaurant});
  Cart.fromCartData(dynamic cartData, this.restaurant) {
    cartData["items"]?.forEach((dynamic itemId, dynamic itemData) {
      Map<String, String> chosenOneOptions = {};
      itemData["options"]["chosenOneOptions"]
          .forEach((dynamic id, dynamic data) {
        chosenOneOptions[id] = data["chosenOptionId"];
      });
      Map<String, bool> chosenManyOptions = {};
      itemData["options"]["chosenManyOptions"]
          .forEach((dynamic id, dynamic data) {
        chosenManyOptions[id] = data["chosenValue"];
      });
      Item item = this.restaurant!.findItemById(itemData["id"]);
      CartItem cartItem = CartItem.withData(
          item,
          restaurant!.id!,
          itemId,
          itemData["quantity"],
          itemData["notes"],
          chosenOneOptions,
          chosenManyOptions);
      this.items.add(cartItem);
    });
  }
  int quantity() {
    if (this.items.length == 0) return 0;
    return this.items.fold(0, (sum, cartItem) => sum + cartItem.quantity);
  }

  num totalCost() {
    if (this.items.length == 0) return 0;
    return this.items.fold(0, (sum, cartItem) => sum + cartItem.totalCost());
  }

  void addItem(CartItem cartItem) {
    if (cartItem.id == null) {
      cartItem.id = getRandomString(5);
    } else {
      int index = this.items.indexWhere((element) => element.id == cartItem.id);
      this.items.removeAt(index);
    }
    this.items.add(CartItem.clone(cartItem));
  }

  void incrementItem(String id, int quantity) {
    CartItem item = getItem(id);
    item.quantity += quantity;
  }

  void deleteItem(String itemId) {
    int index = this.items.indexWhere((element) => element.id == itemId);
    this.items.removeAt(index);
  }

  CartItem getItem(String id) {
    return this.items.firstWhere((element) => element.id == id);
  }

  Map<String, dynamic> toFirebaseFormattedJson() {
    Map<String, dynamic> items = {};
    this.items.forEach((element) {
      items[element.id!] = element.toFirebaseFunctionFormattedJson();
    });

    mezDbgPrint("+ from model REST ID ==> ${restaurant?.id}");
    return <String, dynamic>{
      "orderType": OrderType.Restaurant.toFirebaseFormatString(),
      "serviceProviderId": restaurant?.id,
      "quantity": this.quantity(),
      "cost": this.totalCost(),
      "items": items,
      "notes": notes,
      "to": this.toLocation?.toFirebaseFormattedJson(),
      "paymentType": paymentType.toFirebaseFormatString()
    };
  }
}

String getRandomString(int length) {
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  return String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
