import 'package:location/location.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as locModel;
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

extension DeliveryOrderParser on String {
  DeliveryOrderStatus toDeliveryOrderStatus() {
    return DeliveryOrderStatus.values.firstWhere(
      (element) =>
          element.toString().split('.').last.toLowerCase() == toLowerCase(),
    );
  }

  DeliveryServiceType toDeliveryProviderType() {
    return DeliveryServiceType.values.firstWhere(
      (element) =>
          element.toString().split('.').last.toLowerCase() == toLowerCase(),
    );
  }

  DeliveryDriverType toDeliveryDriverType() {
    return DeliveryDriverType.values.firstWhere(
      (element) =>
          element.toString().split('.').last.toLowerCase() == toLowerCase(),
    );
  }
}

extension DeliveryServiceTypeParser on DeliveryServiceType {
  String toHasuraString() {
    return toString().split('.').last.toLowerCase();
  }
}

enum DeliveryOrderStatus {
  orderReceived,
  packageReady,
  atPickup,
  onTheWayToDropoff,
  atDropoff,
  delivered,
  cancelledByCustomer,
  cancelledByDeliverer,
  cancelledByServiceProvider
}

enum DeliveryServiceType { restaurant, delivery_company, delivery_operator }

class DeliveryOrderInfo {
  final String? serviceProviderName;
  final String? serviceProviderAddress;
  final String? serviceProviderImage;
  final String? customerName;
  final String? customerImage;
  final String? deliveryDriverName;
  final String? deliveryDriverImage;
  final String? orderNotes =
      "Please call the concierge and tell'em this is for saad.";

  DeliveryOrderInfo({
    this.serviceProviderName,
    this.serviceProviderAddress,
    this.serviceProviderImage,
    this.customerName,
    this.customerImage,
    this.deliveryDriverName,
    this.deliveryDriverImage,
    // this.orderNote,
  });
}

class DeliveryOrder {
  final int id;
  final locModel.Location pickupLocation;
  final locModel.Location dropoffLocation;
  final DeliveryDriverType deliveryDriverType;
  final int? deliveryDriverId;
  final int? chatWithServiceProviderId;
  final int chatWithCustomerId;
  final PaymentType paymentType;
  final int? stripePaymentId;
  final DateTime? estimatedPkgReadyTime;
  final DateTime? actualPkgReadyTime;
  final DateTime? estimatedArrivalAtPickupTime;
  final DateTime? actualArrivalAtPickupTime;
  final DateTime? estimatedArrivalAtDropoffTime;
  final DateTime? actualArrivalAtDropoffTime;
  final DateTime? actualDeliveredTime;
  final DeliveryOrderStatus status;
  final int? driverReviewByServiceProviderId;
  final int? driverReviewByCustomerId;
  final int? serviceProviderReviewByDriverId;
  final int? customerReviewByDriverId;
  final int customerId;
  final int? serviceProviderId;
  final DeliveryServiceType? deliveryServiceType;
  final RouteInformation? routeInformation;
  final num deliveryCost;
  final num packageCost;
  final LocationData? currentGps;
  final DateTime orderTime;
  final DateTime? cancellationTime;
  final DeliveryOrderInfo moreInfo;

  DeliveryOrder({
    required this.id,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.deliveryDriverType,
    this.deliveryDriverId,
    this.chatWithServiceProviderId,
    required this.chatWithCustomerId,
    required this.paymentType,
    this.stripePaymentId,
    this.estimatedPkgReadyTime,
    this.actualPkgReadyTime,
    this.estimatedArrivalAtPickupTime,
    this.actualArrivalAtPickupTime,
    this.estimatedArrivalAtDropoffTime,
    this.actualArrivalAtDropoffTime,
    this.actualDeliveredTime,
    required this.status,
    this.driverReviewByServiceProviderId,
    this.driverReviewByCustomerId,
    this.serviceProviderReviewByDriverId,
    this.customerReviewByDriverId,
    required this.customerId,
    this.serviceProviderId,
    this.deliveryServiceType,
    this.routeInformation,
    required this.deliveryCost,
    required this.packageCost,
    required this.orderTime,
    this.cancellationTime,
    this.currentGps,
    required this.moreInfo,
  });

  bool get isInProcess => <DeliveryOrderStatus>[
        DeliveryOrderStatus.atDropoff,
        DeliveryOrderStatus.atPickup,
        DeliveryOrderStatus.onTheWayToDropoff,
        DeliveryOrderStatus.orderReceived,
        DeliveryOrderStatus.packageReady
      ].contains(status);
  num get totalCost => packageCost + deliveryCost;
}
