import 'package:mezcalmos/CustomerApp/models/restaurant.dart';
import 'dart:math';

class CartItem {
  String restaurantId;
  String? id;
  Item item;
  Map<String, String> _chosenOneOptions = {};
  Map<String, bool> _chosenManyOptions = {};
  num costPerOne = 0;
  num totalCost = 0;
  int quantity;
  Map<String, String> get chosenOneOptions => _chosenOneOptions;
  Map<String, bool> get chosenManyOptions => _chosenManyOptions;

  CartItem(this.item, this.restaurantId, {this.quantity = 1}) {
    this.costPerOne = this.item.cost;

    this.item.chooseOneOptions.forEach((chooseOneOption) {
      _chosenOneOptions[chooseOneOption.id!] =
          chooseOneOption.chooseOneOptionListItems[0].id!;
      this.costPerOne += chooseOneOption.chooseOneOptionListItems[0].cost;
    });
    this.item.chooseManyOptions.forEach((chooseManyOption) {
      _chosenManyOptions[chooseManyOption.id!] =
          chooseManyOption.selectedByDefault;
      if (chooseManyOption.selectedByDefault)
        this.costPerOne += chooseManyOption.cost;
    });
    this.totalCost = this.item.cost * this.quantity;
  }
  CartItem.withData(
      this.item,
      this.restaurantId,
      this.id,
      this.quantity,
      this.costPerOne,
      this.totalCost,
      this._chosenOneOptions,
      this._chosenManyOptions);

  factory CartItem.clone(CartItem cartItem) {
    return CartItem.withData(
        cartItem.item,
        cartItem.restaurantId,
        cartItem.id,
        cartItem.quantity,
        cartItem.costPerOne,
        cartItem.totalCost,
        cartItem._chosenOneOptions,
        cartItem._chosenManyOptions);
  }

  void calculateCost() {
    this.costPerOne = this.item.cost;
    this.item.chooseOneOptions.forEach((chooseOneOption) {
      String chosenId = _chosenOneOptions[chooseOneOption.id]!;
      this.costPerOne += chooseOneOption.chooseOneOptionListItems
          .firstWhere((element) => element.id == chosenId)
          .cost;
    });
    this.item.chooseManyOptions.forEach((chooseManyOption) {
      if (_chosenManyOptions[chooseManyOption.id]!)
        this.costPerOne += chooseManyOption.cost;
    });
    this.totalCost = this.quantity * this.costPerOne;
  }

  Map<String, dynamic> toFirebaseFunctionFormattedJson() {
    Map<String, dynamic> json = <String, dynamic>{
      "id": this.item.id,
      "quantity": this.quantity,
      "totalCost": this.totalCost,
      "costPerOne": this.costPerOne,
      "name": this.item.name,
      "image": this.item.image,
      "options": {"chosenOneOptions": {}, "chosenManyOptions": {}},
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
      json["options"]["chosenManyOptions"][e.id] = {
        "chosenValue": this.chosenManyOptions[e.id],
        "name": chooseManyOption?.name,
        "chosenValueCost": chooseManyOption?.cost ?? 0
      };
    });

    return json;
  }
}

class Cart {
  List<CartItem> items = [];
  Restaurant restaurant;
  Cart(this.restaurant);
  Cart.fromCartData(dynamic cartData, this.restaurant) {
    cartData["items"].forEach((dynamic itemId, dynamic itemData) {
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
      Item item = this.restaurant.findItemById(itemData["id"]);
      CartItem cartItem = CartItem.withData(
          item,
          restaurant.id!,
          itemId,
          itemData["quantity"],
          itemData["costPerOne"],
          itemData["totalCost"],
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
    return this.items.fold(0, (sum, cartItem) => sum + cartItem.totalCost);
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
    item.calculateCost();
  }

  CartItem getItem(String id) {
    return this.items.firstWhere((element) => element.id == id);
  }

  Map<String, dynamic> toFirebaseFormattedJson() {
    Map<String, dynamic> items = {};
    this.items.forEach((element) {
      items[element.id!] = element.toFirebaseFunctionFormattedJson();
    });
    return <String, dynamic>{
      "orderType": "restaurant",
      "serviceProviderId": restaurant.id,
      "quantity": this.quantity(),
      "cost": this.totalCost(),
      "items": items
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
