import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/helpers/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

abstract class Order {
  String orderId;
  OrderType orderType;
  String? serviceProviderId;
  PaymentType paymentType;
  DateTime orderTime;
  UserInfo customer;
  UserInfo? serviceProvider;
  Location to;
  num cost;
  RouteInformation? routeInformation;
  StripePaymentInfo? stripePaymentInfo;
  num? totalCostBeforeShipping;
  num? totalCost;
  num? refundAmount;
  num? costToCustomer;

  Order({
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
            RestaurantOrderStatus.OrderReceieved;
      case OrderType.Laundry:
        return (this as LaundryOrder).status ==
            LaundryOrderStatus.OrderReceieved;
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
enum OrderType { Taxi, Restaurant, Laundry, Water }

extension ParseOrderTypeToString on OrderType {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
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
  String? serviceProviderDropOffDriverChatId;
  String? customerDropOffDriverChatId;
  DateTime? estimatedPickupFromServiceProviderTime;
  DateTime? estimatedDropoffAtCustomerTime;
  num? dropOffShippingCost;
  DeliverableOrder(
      {required String orderId,
      String? serviceProviderId,
      required PaymentType paymentType,
      required DateTime orderTime,
      required num cost,
      ServiceInfo? serviceProvider,
      required UserInfo customer,
      required Location to,
      required OrderType orderType,
      this.dropoffDriver,
      required this.serviceProviderDropOffDriverChatId,
      required this.customerDropOffDriverChatId,
      this.estimatedPickupFromServiceProviderTime,
      this.estimatedDropoffAtCustomerTime,
      RouteInformation? routeInformation,
      StripePaymentInfo? stripePaymentInfo,
      num? totalCostBeforeShipping,
      num? totalCost,
      num? refundAmount,
      num? costToCustomer,
      this.dropOffShippingCost})
      : super(
          orderId: orderId,
          orderType: orderType,
          serviceProviderId: serviceProviderId,
          paymentType: paymentType,
          orderTime: orderTime,
          cost: cost,
          customer: customer,
          serviceProvider: serviceProvider,
          to: to,
          routeInformation: routeInformation,
          stripePaymentInfo: stripePaymentInfo,
          totalCostBeforeShipping: totalCostBeforeShipping,
          totalCost: totalCost,
          refundAmount: refundAmount,
          costToCustomer: costToCustomer,
        );
}

abstract class TwoWayDeliverableOrder extends DeliverableOrder {
  DeliveryDriverUserInfo? pickupDriver;
  String? serviceProviderPickupDriverChatId;
  String? customerPickupDriverChatId;
  DateTime? estimatedPickupFromCustomerTime;
  DateTime? estimatedDropoffAtServiceProviderTime;
  num? pickupShippingCost;
  TwoWayDeliverableOrder(
      {required String orderId,
      String? serviceProviderId,
      required PaymentType paymentType,
      required DateTime orderTime,
      required num cost,
      ServiceInfo? serviceProvider,
      required UserInfo customer,
      required Location to,
      required OrderType orderType,
      RouteInformation? routeInformation,
      StripePaymentInfo? stripePaymentInfo,
      DeliveryDriverUserInfo? dropoffDriver,
      required String? serviceProviderDropOffDriverChatId,
      required String? customerDropOffDriverChatId,
      this.pickupDriver,
      required this.serviceProviderPickupDriverChatId,
      required this.customerPickupDriverChatId,
      DateTime? estimatedPickupFromServiceProviderTime,
      DateTime? estimatedDropoffAtCustomerTime,
      this.estimatedPickupFromCustomerTime,
      this.estimatedDropoffAtServiceProviderTime,
      num? totalCostBeforeShipping,
      num? totalCost,
      num? refundAmount,
      num? costToCustomer,
      num? dropoffShippingCost,
      this.pickupShippingCost})
      : super(
            orderId: orderId,
            orderType: orderType,
            serviceProviderId: serviceProviderId,
            paymentType: paymentType,
            orderTime: orderTime,
            cost: cost,
            customer: customer,
            serviceProvider: serviceProvider,
            to: to,
            routeInformation: routeInformation,
            dropoffDriver: dropoffDriver,
            serviceProviderDropOffDriverChatId:
                serviceProviderDropOffDriverChatId,
            customerDropOffDriverChatId: customerDropOffDriverChatId,
            estimatedPickupFromServiceProviderTime:
                estimatedPickupFromServiceProviderTime,
            estimatedDropoffAtCustomerTime: estimatedDropoffAtCustomerTime,
            totalCostBeforeShipping: totalCostBeforeShipping,
            totalCost: totalCost,
            refundAmount: refundAmount,
            costToCustomer: costToCustomer,
            dropOffShippingCost: dropoffShippingCost);
}
