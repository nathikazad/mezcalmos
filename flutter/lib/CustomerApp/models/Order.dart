class RestaurantOrder {
  RestaurantOrderStatus restaurantOrderStatus;
  int quantity;
  List<RestaurantOrderItem> items = [];
  dynamic from;
  List<RestaurantOrderItem> restaurantOrderItems = [];
  RestaurantOrder(this.restaurantOrderStatus, this.quantity);
}

class RestaurantOrderItem {
  num costPerOne;
  num totalCost;
  String itemIdInCart;
  String itemIdInRestaurant;
  String itemName;
  String itemImage;
  int quantity;
  List<ChooseManyOption> chooseManyOptions = [];
  List<ChooseOneOption> chooseOneOptions = [];
  RestaurantOrderItem(this.costPerOne, this.totalCost, this.itemIdInCart,
      this.itemIdInRestaurant, this.itemName, this.itemImage, this.quantity);
}

class ChooseOneOption {
  String optionId;
  String optionName;
  String chosenOptionId;
  String chosenOptionName;
  num chosenOptionCost;
  ChooseOneOption(this.optionId, this.optionName, this.chosenOptionId,
      this.chosenOptionCost, this.chosenOptionName);
}

class ChooseManyOption {
  String optionId;
  String optionName;
  bool chosenOptionValue;
  num chosenOptionName;
  ChooseManyOption(this.optionId, this.optionName, this.chosenOptionName,
      this.chosenOptionValue);
}

enum RestaurantOrderStatus { PreparingOrder, OnTheWay, Delivered }

class Order {
  String orderType;
  String serviceProviderId;
  PaymentType paymentType;
  DateTime orderTime;
  num cost;
  Order(this.orderType, this.serviceProviderId, this.paymentType,
      this.orderTime, this.cost);
}

enum OrderType { Taxi, Restaurant, Laundry, Water }
enum PaymentType { Cash, Card }
