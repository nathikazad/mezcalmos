import 'package:mezcalmos/Shared/models/Orders/Order.dart';

String adminNode(String uid) {
  return 'deliveryAdmins/info/$uid';
}

String adminNotificationInfoNode(String uid) {
  return adminNode(uid) + '/notificationInfo';
}

String adminAppVersionNode(String uid) {
  return adminNode(uid) + '/versionNumber';
}

String notificationsNode(String uid) {
  return 'notifications/deliveryAdmin/$uid';
}

enum OrderState { Open, InProcess, Past }

extension ParseOrderStatesToString on OrderState {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToOrderState on String {
  OrderState toPaymentType() {
    return OrderState.values.firstWhere(
        (e) => e.toFirebaseFormatString().toLowerCase() == this.toLowerCase());
  }
}

String orderNode(
    {required OrderType orderType,
    required OrderState orderState,
    String? orderId}) {
  String address =
      'orders/${orderState.toFirebaseFormatString()}/${orderType.toFirebaseFormatString()}';
  if (orderId != null) {
    address += '/$orderId';
  }
  return address;
}

String restaurantInProcessOrdersNode() {
  return orderNode(
      orderState: OrderState.InProcess, orderType: OrderType.Restaurant);
}

String restaurantPastOrdersNode() {
  return orderNode(
      orderState: OrderState.Past, orderType: OrderType.Restaurant);
}

String laundryInProcessOrdersNode() {
  return orderNode(
      orderState: OrderState.InProcess, orderType: OrderType.Laundry);
}

String laundryPastOrdersNode() {
  return orderNode(orderState: OrderState.Past, orderType: OrderType.Laundry);
}

String taxiOpenOrdersNode() {
  return orderNode(orderState: OrderState.Open, orderType: OrderType.Taxi);
}

String taxiInProcessOrdersNode() {
  return orderNode(orderState: OrderState.InProcess, orderType: OrderType.Taxi);
}

String taxiPastOrdersNode() {
  return orderNode(orderState: OrderState.Past, orderType: OrderType.Taxi);
}
