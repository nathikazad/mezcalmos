class RestaurantOrder extends Order {
  RestaurantOrderStatus restaurantOrderStatus;
  int quantity;
  List<RestaurantOrderItem> items = [];
  dynamic from;
  RestaurantOrder(
      {required String orderId,
      required this.restaurantOrderStatus,
      required this.quantity,
      required String serviceProviderId,
      required PaymentType paymentType,
      required DateTime orderTime,
      required num cost})
      : super(
            orderId: orderId,
            orderType: OrderType.Restaurant,
            serviceProviderId: serviceProviderId,
            paymentType: paymentType,
            orderTime: orderTime,
            cost: cost);
  factory RestaurantOrder.fromData(dynamic id, dynamic data) {
    RestaurantOrder restaurantOrder = RestaurantOrder(
        orderId: id,
        restaurantOrderStatus:
            convertRestaurantOrderStatusStringToEnum(data["status"]),
        quantity: data["quantity"],
        serviceProviderId: id,
        paymentType: convertPaymentType(data["paymentType"]),
        orderTime: DateTime.parse(data["orderTime"]),
        cost: data["cost"]);
    data["items"].forEach((dynamic itemId, dynamic itemData) {
      RestaurantOrderItem restaurantOrderItem = RestaurantOrderItem(
          costPerOne: itemData["costPerOne"],
          totalCost: itemData["totalCost"],
          idInCart: itemId,
          idInRestaurant: itemData["id"],
          name: itemData["name"],
          image: itemData["image"],
          quantity: itemData["quantity"]);
      itemData["options"]["chosenManyOptions"]
          .forEach((dynamic id, dynamic data) {
        restaurantOrderItem.chooseManyOptions.add(ChooseManyOption(
            optionId: id,
            optionName: data["name"],
            chosenValueCost: data["chosenValueCost"],
            chosenOptionValue: data["chosenValue"]));
      });
      itemData["options"]["chosenOneOptions"]
          .forEach((dynamic id, dynamic data) {
        restaurantOrderItem.chooseOneOptions.add(ChooseOneOption(
            optionId: id,
            optionName: data["name"],
            chosenOptionId: data["chosenOptionId"],
            chosenOptionCost: data["chosenOptionCost"],
            chosenOptionName: data["chosenOptionName"]));
      });
      restaurantOrder.items.add(restaurantOrderItem);
    });
    return restaurantOrder;
  }

  @override
  bool inProcess() {
    return restaurantOrderStatus == RestaurantOrderStatus.PreparingOrder ||
        restaurantOrderStatus == RestaurantOrderStatus.ReadyForPickup ||
        restaurantOrderStatus == RestaurantOrderStatus.OnTheWay;
  }
}

class RestaurantOrderItem {
  num costPerOne;
  num totalCost;
  String idInCart;
  String idInRestaurant;
  String name;
  String image;
  int quantity;
  List<ChooseManyOption> chooseManyOptions = [];
  List<ChooseOneOption> chooseOneOptions = [];
  RestaurantOrderItem(
      {required this.costPerOne,
      required this.totalCost,
      required this.idInCart,
      required this.idInRestaurant,
      required this.name,
      required this.image,
      required this.quantity});
}

class ChooseOneOption {
  String optionId;
  String optionName;
  String chosenOptionId;
  String chosenOptionName;
  num chosenOptionCost;
  ChooseOneOption(
      {required this.optionId,
      required this.optionName,
      required this.chosenOptionId,
      required this.chosenOptionCost,
      required this.chosenOptionName});
}

class ChooseManyOption {
  String optionId;
  String optionName;
  bool chosenOptionValue;
  num chosenValueCost;
  ChooseManyOption(
      {required this.optionId,
      required this.optionName,
      required this.chosenValueCost,
      required this.chosenOptionValue});
}

abstract class Order {
  String orderId;
  OrderType orderType;
  String serviceProviderId;
  PaymentType paymentType;
  DateTime orderTime;
  num cost;
  Order(
      {required this.orderId,
      required this.orderType,
      required this.serviceProviderId,
      required this.paymentType,
      required this.orderTime,
      required this.cost});
  bool inProcess();
  // Order.orderFromData(dynamic orderId, dynamic orderData){

}

enum RestaurantOrderStatus {
  PreparingOrder,
  ReadyForPickup,
  OnTheWay,
  Delivered,
  Cancelled
}
List<String> restaurantOrderStatusAsStrings = [
  "preparingOrder",
  "readyForPickup",
  "onTheWay",
  "delivered",
  "cancelled"
];
List<RestaurantOrderStatus> restaurantOrderStatusAsEnum = [
  RestaurantOrderStatus.PreparingOrder,
  RestaurantOrderStatus.ReadyForPickup,
  RestaurantOrderStatus.OnTheWay,
  RestaurantOrderStatus.Delivered,
  RestaurantOrderStatus.Cancelled
];

RestaurantOrderStatus convertRestaurantOrderStatusStringToEnum(
    String orderStatus) {
  return restaurantOrderStatusAsEnum[
      restaurantOrderStatusAsStrings.indexOf(orderStatus)];
}

String convertRestaurantOrderStatusEnumToString(
    RestaurantOrderStatus orderStatus) {
  return restaurantOrderStatusAsStrings[
      restaurantOrderStatusAsEnum.indexOf(orderStatus)];
}

enum OrderType { Taxi, Restaurant, Laundry, Water }
List<String> orderTypeAsStrings = ["taxi", "restaurant", "laundry", "water"];
List<OrderType> orderTypeAsEnum = [
  OrderType.Taxi,
  OrderType.Restaurant,
  OrderType.Laundry,
  OrderType.Water
];

OrderType convertOrderTypeStringToEnum(String orderType) {
  return orderTypeAsEnum[orderTypeAsStrings.indexOf(orderType)];
}

String convertOrderTypeEnumToString(OrderType orderType) {
  return orderTypeAsStrings[orderTypeAsEnum.indexOf(orderType)];
}

enum PaymentType { Cash, Card }
PaymentType convertPaymentType(String paymentType) {
  if (paymentType == "cash") return PaymentType.Cash;
  if (paymentType == "card") return PaymentType.Card;
  throw Error();
}
