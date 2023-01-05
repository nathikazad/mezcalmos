import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/DeliveryApp/models/utilities/DeliveryAction.dart';
import 'package:mezcalmos/DeliveryApp/models/utilities/DeliveryOrderStatus.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class DeliveryOrder {
  int id;
  ServiceProviderType? serviceProviderType;
  int? serviceOrderId;
  ServiceInfo serviceInfo;
  UserInfo customerInfo;
  DeliveryDirection deliveryDirection;
  DeliveryOrderStatus status;
  RouteInformation? routeInformation;
  DateTime orderTime;
  num deliveryCost;
  num packageCost;
  Location pickupLocation;
  Location dropoffLocation;
  LatLng? driverLocation;
  int chatWithCustomerId;
  int? chatWithServiceProviderId;
  PaymentType paymentType;
  DateTime? estimatedArrivalAtDropoffTime;
  DateTime? estimatedArrivalAtPickupTime;
  DateTime? estimatedPackageReadyTime;
  String? stripePaymentId;
  DeliveryOrder({
    required this.id,
    required this.serviceInfo,
    required this.customerInfo,
    required this.driverLocation,
    required this.deliveryDirection,
    required this.routeInformation,
    required this.orderTime,
    required this.status,
    required this.serviceProviderType,
    required this.deliveryCost,
    required this.packageCost,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.chatWithCustomerId,
    required this.chatWithServiceProviderId,
    required this.paymentType,
    this.estimatedArrivalAtDropoffTime,
    this.serviceOrderId,
    this.estimatedArrivalAtPickupTime,
    this.estimatedPackageReadyTime,
    this.stripePaymentId,
  });

  DeliveryOrder copyWith({
    int? id,
    ServiceInfo? serviceInfo,
    UserInfo? customerInfo,
    ServiceProviderType? serviceProviderType,
    DeliveryDirection? deliveryDirection,
    RouteInformation? routeInformation,
    DateTime? orderTime,
    num? deliveryCost,
    num? packageCost,
    Location? pickupLocation,
    LatLng? driverLocation,
    Location? dropoffLocation,
    int? chatWithCustomerId,
    int? chatWithServiceProviderId,
    PaymentType? paymentType,
    DateTime? estimatedArrivalAtDropoffTime,
    DateTime? estimatedArrivalAtPickupTime,
    DateTime? estimatedPackageReadyTime,
    String? stripePaymentId,
  }) {
    return DeliveryOrder(
      id: id ?? this.id,
      serviceInfo: serviceInfo ?? this.serviceInfo,
      status: status ?? status,
      driverLocation: driverLocation ?? this.driverLocation,
      serviceProviderType: serviceProviderType ?? this.serviceProviderType,
      customerInfo: customerInfo ?? this.customerInfo,
      deliveryDirection: deliveryDirection ?? this.deliveryDirection,
      routeInformation: routeInformation ?? this.routeInformation,
      orderTime: orderTime ?? this.orderTime,
      deliveryCost: deliveryCost ?? this.deliveryCost,
      packageCost: packageCost ?? this.packageCost,
      pickupLocation: pickupLocation ?? this.pickupLocation,
      dropoffLocation: dropoffLocation ?? this.dropoffLocation,
      chatWithCustomerId: chatWithCustomerId ?? this.chatWithCustomerId,
      chatWithServiceProviderId:
          chatWithServiceProviderId ?? this.chatWithServiceProviderId,
      paymentType: paymentType ?? this.paymentType,
      estimatedArrivalAtDropoffTime:
          estimatedArrivalAtDropoffTime ?? this.estimatedArrivalAtDropoffTime,
      estimatedArrivalAtPickupTime:
          estimatedArrivalAtPickupTime ?? this.estimatedArrivalAtPickupTime,
      estimatedPackageReadyTime:
          estimatedPackageReadyTime ?? this.estimatedPackageReadyTime,
      stripePaymentId: stripePaymentId ?? this.stripePaymentId,
    );
  }

  @override
  String toString() {
    return 'DeliveryOrder(id: $id, serviceInfo: $serviceInfo, customerInfo: $customerInfo, deliveryDirection: $deliveryDirection, routeInformation: $routeInformation, orderTime: $orderTime, deliveryCost: $deliveryCost, packageCost: $packageCost, pickupLocation: $pickupLocation, dropoffLocation: $dropoffLocation, chatWithCustomerId: $chatWithCustomerId, chatWithServiceProviderId: $chatWithServiceProviderId, paymentType: $paymentType, estimatedArrivalAtDropoffTime: $estimatedArrivalAtDropoffTime, estimatedArrivalAtPickupTime: $estimatedArrivalAtPickupTime, estimatedPackageReadyTime: $estimatedPackageReadyTime, stripePaymentId: $stripePaymentId)';
  }

  @override
  bool operator ==(covariant DeliveryOrder other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.serviceInfo == serviceInfo &&
        other.customerInfo == customerInfo &&
        other.deliveryDirection == deliveryDirection &&
        other.routeInformation == routeInformation &&
        other.orderTime == orderTime &&
        other.deliveryCost == deliveryCost &&
        other.packageCost == packageCost &&
        other.pickupLocation == pickupLocation &&
        other.dropoffLocation == dropoffLocation &&
        other.chatWithCustomerId == chatWithCustomerId &&
        other.chatWithServiceProviderId == chatWithServiceProviderId &&
        other.paymentType == paymentType &&
        other.estimatedArrivalAtDropoffTime == estimatedArrivalAtDropoffTime &&
        other.estimatedArrivalAtPickupTime == estimatedArrivalAtPickupTime &&
        other.estimatedPackageReadyTime == estimatedPackageReadyTime &&
        other.stripePaymentId == stripePaymentId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        serviceInfo.hashCode ^
        customerInfo.hashCode ^
        deliveryDirection.hashCode ^
        routeInformation.hashCode ^
        orderTime.hashCode ^
        deliveryCost.hashCode ^
        packageCost.hashCode ^
        pickupLocation.hashCode ^
        dropoffLocation.hashCode ^
        chatWithCustomerId.hashCode ^
        chatWithServiceProviderId.hashCode ^
        paymentType.hashCode ^
        estimatedArrivalAtDropoffTime.hashCode ^
        estimatedArrivalAtPickupTime.hashCode ^
        estimatedPackageReadyTime.hashCode ^
        stripePaymentId.hashCode;
  }

  bool inProcess() {
    return status != DeliveryOrderStatus.CancelledByCustomer &&
        status != DeliveryOrderStatus.CancelledByDeliverer &&
        status != DeliveryOrderStatus.CancelledByServiceProvider;
  }

  bool isScheduled() {
    // TODO implemnt scheduling
    return false;
  }

  bool isCanceled() {
    return status == DeliveryOrderStatus.CancelledByCustomer ||
        status == DeliveryOrderStatus.CancelledByDeliverer ||
        status == DeliveryOrderStatus.CancelledByServiceProvider;
  }
}
