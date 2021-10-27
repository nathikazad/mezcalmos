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

extension ParseOrderTypeToString on OrderType {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

OrderType convertOrderTypeStringToEnum(String orderType) {
  return OrderType.values.firstWhere((e) => e.toShortString() == orderType);
}



enum PaymentType { Cash, Card }
extension ParsePaymentTypeToString on PaymentType {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

PaymentType convertPaymentType(String paymentType) {
  return PaymentType.values.firstWhere((e) => e.toShortString() == paymentType);
}
