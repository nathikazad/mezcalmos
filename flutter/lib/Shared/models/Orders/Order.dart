import 'package:mezcalmos/Shared/cloudFunctions/model.dart'
    as cloudFunctionModels;
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

abstract class Order {
  int orderId;
  OrderType orderType;
  int? serviceProviderId;
  PaymentType paymentType;
  DateTime orderTime;
  UserInfo customer;
  UserInfo? serviceProvider;
  MezLocation to;
  num cost;
  RouteInformation? routeInformation;
  StripeOrderPaymentInfo? stripePaymentInfo;
  num? totalCostBeforeShipping;
  num? totalCost;
  num? refundAmount;
  num? costToCustomer;
  int chatId;

  Order({
    required this.chatId,
    required this.orderId,
    required this.orderType,
    this.serviceProviderId,
    required this.paymentType,
    required this.orderTime,
    required this.cost,
    required this.customer,
    this.serviceProvider,
    required this.to,
    this.routeInformation,
    this.stripePaymentInfo,
    this.totalCostBeforeShipping,
    this.totalCost,
    this.refundAmount,
    this.costToCustomer,
  });
  bool isIncoming() {
    switch (orderType) {
      case OrderType.Restaurant:
        return (this as RestaurantOrder).status ==
            RestaurantOrderStatus.OrderReceived;
      case OrderType.Laundry:
        return (this as LaundryOrder).status ==
            LaundryOrderStatus.OrderReceived;
      case OrderType.Taxi:
        return (this as TaxiOrder).status == TaxiOrdersStatus.LookingForTaxi ||
            (this as TaxiOrder).status ==
                TaxiOrdersStatus.LookingForTaxiScheduled;

      default:
        return false;
    }
  }

  bool inProcess();

  bool isCanceled();

  String driverDatabaseAddress() {
    switch (orderType) {
      case OrderType.Laundry:
        switch ((this as LaundryOrder).getCurrentPhase()) {
          case LaundryOrderPhase.Dropoff:
            return "dropoffDriver";
          case LaundryOrderPhase.Pickup:
            return "pickupDriver";
          case LaundryOrderPhase.Neither:
            return "dropoffDriver";
        }
      case OrderType.Restaurant:
        return "dropoffDriver";
      default:
        return "driver";
    }
  }
// Order.orderFromData(dynamic orderId, dynamic orderData){
}

// ignore: constant_identifier_names
enum OrderType {
  Taxi,
  Restaurant,
  Laundry,
  Water,
}

extension ParseOrderTypeToString on OrderType {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }

  cloudFunctionModels.OrderType toCloudFunctionsModel() {
    switch (this) {
      case OrderType.Laundry:
        return cloudFunctionModels.OrderType.Laundry;
      case OrderType.Restaurant:
        return cloudFunctionModels.OrderType.Restaurant;
      case OrderType.Taxi:
        return cloudFunctionModels.OrderType.Taxi;
      case OrderType.Water:
        return cloudFunctionModels.OrderType.Water;
    }
  }

  String toPlural() {
    switch (this) {
      case OrderType.Taxi:
        return "taxis";
      case OrderType.Restaurant:
        return "restaurants";
      case OrderType.Laundry:
        return "laundries";
      case OrderType.Water:
        return "waters";
    }
  }
}

extension ParseStringToOrderType on String {
  OrderType toOrderType() {
    return OrderType.values.firstWhere(
        (OrderType e) => e.toFirebaseFormatString().toLowerCase() == this);
  }
}

abstract class DeliverableOrder extends Order {
  DeliveryDriverUserInfo? dropoffDriver;
  int? serviceProviderDropOffDriverChatId;
  int? customerDropOffDriverChatId;
  DateTime? estimatedPickupFromServiceProviderTime;
  DateTime? estimatedDropoffAtCustomerTime;
  num? dropOffShippingCost;
  bool notifiedOperator;
  bool notifiedAdmin;
  DeliverableOrder(
      {required super.orderId,
      required super.chatId,
      super.serviceProviderId,
      required super.paymentType,
      required super.orderTime,
      required super.cost,
      super.serviceProvider,
      required super.customer,
      required super.to,
      required super.orderType,
      this.dropoffDriver,
      required this.serviceProviderDropOffDriverChatId,
      required this.customerDropOffDriverChatId,
      this.estimatedPickupFromServiceProviderTime,
      this.estimatedDropoffAtCustomerTime,
      super.routeInformation,
      this.notifiedAdmin = false,
      this.notifiedOperator = false,
      super.totalCostBeforeShipping,
      super.totalCost,
      super.refundAmount,
      super.costToCustomer,
      this.dropOffShippingCost});
}

abstract class TwoWayDeliverableOrder extends DeliverableOrder {
  DeliveryDriverUserInfo? pickupDriver;
  int? serviceProviderPickupDriverChatId;
  int? customerPickupDriverChatId;
  DateTime? estimatedPickupFromCustomerTime;
  DateTime? estimatedDropoffAtServiceProviderTime;
  num? pickupShippingCost;
  TwoWayDeliverableOrder(
      {required super.orderId,
      required super.chatId,
      super.serviceProviderId,
      required super.paymentType,
      required super.orderTime,
      required super.cost,
      super.serviceProvider,
      required super.customer,
      required super.to,
      required super.orderType,
      super.routeInformation,
      super.dropoffDriver,
      required super.serviceProviderDropOffDriverChatId,
      required super.customerDropOffDriverChatId,
      this.pickupDriver,
      required this.serviceProviderPickupDriverChatId,
      required this.customerPickupDriverChatId,
      super.estimatedPickupFromServiceProviderTime,
      super.estimatedDropoffAtCustomerTime,
      this.estimatedPickupFromCustomerTime,
      this.estimatedDropoffAtServiceProviderTime,
      super.totalCostBeforeShipping,
      super.totalCost,
      super.refundAmount,
      super.costToCustomer,
      super.dropOffShippingCost,
      super.notifiedAdmin,
      super.notifiedOperator});
}
