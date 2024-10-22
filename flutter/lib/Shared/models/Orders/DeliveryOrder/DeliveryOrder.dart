// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/models/User.dart' as user;
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class DeliveryOrder extends DeliverableOrder {
  int? serviceOrderId;

  DeliveryOrderStatus status;

  bool packageReady;

  //bool driverAssigned;
  DeliveryOrder(
      {required super.orderType,
      required super.paymentType,
      required super.deliveryOrderId,
      required super.orderTime,
      super.stripePaymentInfo,
      super.customerReviewByDriver,
      super.serviceReviewByDriver,
      required super.costs,
      required this.packageReady,
      required this.serviceOrderId,
      required this.status,
      required super.scheduleTime,
      required super.estimatedArrivalAtDropoff,
      required super.estimatedArrivalAtPickup,
      required super.estimatedPackageReadyTime,
      super.cancellationTime,
      required super.serviceProvider,
      required super.deliveryProviderType,
      required super.driverInfo,
      required super.deliveryCompany,
      required super.deliveryDirection,
      required super.routeInformation,
      required super.orderId,
      required super.chatId,
      super.review,
      required super.customer,
      required super.dropOffLocation,
      required super.serviceProviderDriverChatId,
      required super.customerDriverChatId,
      required super.driverLocation,
      required super.pickupLocation});

  bool get isPickUpTimeSetted => estimatedArrivalAtPickup != null;
  bool get isDropOffTimeSetted => estimatedArrivalAtDropoff != null;

  bool get isDriverAssigned => driverInfo != null;
  bool get isDeliveryCostSetted =>
      driverInfo != null &&
      costs.deliveryCost != null &&
      costs.deliveryCost! > 0;
  bool get isCourier => orderType == OrderType.Courier;
  bool get isTimeSetted => isCourier
      ? isDropOffTimeSetted
      : (isPickUpTimeSetted && isDropOffTimeSetted);
  bool get inPickUpPhase =>
      status == DeliveryOrderStatus.OrderReceived ||
      status == DeliveryOrderStatus.OnTheWayToPickup ||
      status == DeliveryOrderStatus.AtPickup;
  bool get inDeliveryPhase =>
      status == DeliveryOrderStatus.OnTheWayToDropoff ||
      status == DeliveryOrderStatus.AtDropoff;
  bool get driverCanReviewService {
    return status == DeliveryOrderStatus.Delivered &&
        serviceReviewByDriver == null &&
        deliveryProviderType == ServiceProviderType.DeliveryCompany &&
        (orderType == OrderType.Restaurant || orderType == OrderType.Laundry);
  }

  bool get driverCanReviewCustomer {
    return status == DeliveryOrderStatus.Delivered &&
        customerReviewByDriver == null;
  }

  @override
  bool operator ==(covariant DeliveryOrder other) {
    if (identical(this, other)) return true;

    return other.orderId == orderId;
  }

  bool inProcess() {
    return status != DeliveryOrderStatus.CancelledByCustomer &&
        status != DeliveryOrderStatus.CancelledByDeliverer &&
        status != DeliveryOrderStatus.Delivered &&
        status != DeliveryOrderStatus.CancelledByServiceProvider;
  }

  @override
  bool isCanceled() {
    return status == DeliveryOrderStatus.CancelledByCustomer ||
        status == DeliveryOrderStatus.CancelledByDeliverer ||
        status == DeliveryOrderStatus.CancelledByServiceProvider;
  }

  bool get isInProcess => <DeliveryOrderStatus>[
        DeliveryOrderStatus.AtPickup,
        DeliveryOrderStatus.AtDropoff,
        DeliveryOrderStatus.OnTheWayToDropoff,
        DeliveryOrderStatus.OnTheWayToDropoff
      ].contains(status);

  bool get orderWithDriver {
    return status == DeliveryOrderStatus.OnTheWayToDropoff ||
        status == DeliveryOrderStatus.OnTheWayToPickup ||
        status == DeliveryOrderStatus.AtDropoff ||
        status == DeliveryOrderStatus.AtPickup;
  }

  bool get haveAtLeastOneEstTime {
    return estimatedArrivalAtDropoff != null ||
        estimatedArrivalAtPickup != null ||
        estimatedPackageReadyTime != null;
  }

  // static void copyTo(DeliveryOrder from, DeliveryOrder to) {
  //   to.driverInfo = from.driverInfo;
  //   to.costs = from.costs;
  //   to.status = from.status;
  //   to.estimatedArrivalAtDropoff = ;
  //   to.estimatedArrivalAtDropoff = ;
  //   to.estimatedArrivalAtDropoff = ;
  // }

  @override
  String toString() => super.toString();
}

//define a class for delivery order times
class DeliveryOrderVariables {
  DateTime? estimatedArrivalAtPickup;
  DateTime? estimatedArrivalAtDropoff;
  DateTime? estimatedPackageReadyTime;
  DateTime? scheduleTime;
  DateTime? cancellationTime;
  DeliveryOrderStatus status;
  user.UserInfo? driverInfo;
  bool packageReady;
  DeliveryOrderVariables(
      {required this.status,
      required this.packageReady,
      this.estimatedArrivalAtPickup,
      this.estimatedArrivalAtDropoff,
      this.estimatedPackageReadyTime,
      this.scheduleTime,
      this.cancellationTime,
      this.driverInfo});
}
