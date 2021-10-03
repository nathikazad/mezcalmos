import 'package:mezcalmos/CustomerApp/models/restaurant.dart';

class CartItem {
  String restaurantId;
  Item item;
  Map<String, String> chosenOneOptions = {};
  Map<String, bool> chosenManyOptions = {};
  num cost = 0;
  int quantity;
  CartItem(this.item, this.restaurantId, {this.quantity = 1}) {
    this.cost = this.item.cost;
    this.item.chooseOneOptions.forEach((chooseOneOption) {
      chosenOneOptions[chooseOneOption.id!] =
          chooseOneOption.chooseOneOptionListItems[0].id!;
    });
    this.item.chooseManyOptions.forEach((chooseManyOption) {
      chosenManyOptions[chooseManyOption.id!] =
          chooseManyOption.selectedByDefault;
    });
  }
  void calculateCost() {
    this.cost = this.item.cost;
    this.item.chooseOneOptions.forEach((chooseOneOption) {
      String chosenId = chosenOneOptions[chooseOneOption.id]!;
      this.cost += chooseOneOption.chooseOneOptionListItems
          .firstWhere((element) => element.id == chosenId)
          .cost;
    });
    this.item.chooseManyOptions.forEach((chooseManyOption) {
      if (chosenManyOptions[chooseManyOption.id]!)
        this.cost += chooseManyOption.cost;
    });
    this.cost *= this.quantity;
  }

  Map<String, dynamic> toFirebaseFunctionFormattedJson() {
    Map<String, dynamic> json = <String, dynamic>{
      "restaurantId": this.restaurantId,
      "itemId": this.item.id,
      "quantity": this.quantity,
      "options": {"chooseOne": {}, "chooseMany": {}},
    };
    this.item.chooseOneOptions.forEach((e) {
      json["options"]["chooseOne"][e.id] = this.chosenOneOptions[e.id];
    });

    this.item.chooseManyOptions.forEach((e) {
      json["options"]["chooseMany"][e.id] = this.chosenManyOptions[e.id];
    });

    return json;
  }
}

      // restaurantId: restaurantUser.id,
      // itemId: itemOneId,
      // options: {
      //   chooseOne: {
      //     meat: "fish",
      //     cheese: "mozarella"
      //   },
      //   chooseMany: {
      //     lettuce: true,
      //     tomato: true,
      //     avocado: false
      //   },