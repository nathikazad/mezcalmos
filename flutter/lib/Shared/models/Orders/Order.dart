abstract class Order {
  String orderId;
  OrderType orderType;
  String? serviceProviderId;
  PaymentType paymentType;
  DateTime orderTime;
  num cost;
  Order(
      {required this.orderId,
      required this.orderType,
      this.serviceProviderId,
      required this.paymentType,
      required this.orderTime,
      required this.cost});
  bool inProcess();
  // Order.orderFromData(dynamic orderId, dynamic orderData){

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
