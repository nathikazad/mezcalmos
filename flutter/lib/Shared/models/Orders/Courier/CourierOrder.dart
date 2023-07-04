// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/models/Orders/Courier/CourierOrderItem.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';

class CourierOrder extends DeliveryOrder {
  List<CourierOrdeItem> items = [];

  String? billImage;

  CourierOrder(
      {required super.orderType,
      required super.paymentType,
      required super.deliveryOrderId,
      required super.orderTime,
      required super.costs,
      required super.packageReady,
      required super.serviceOrderId,
      required super.driverInfo,
      required super.status,
      super.review,
      required this.items,
      super.stripePaymentInfo,
      required super.scheduleTime,
      required super.estimatedArrivalAtDropoff,
      required super.estimatedArrivalAtPickup,
      required super.estimatedPackageReadyTime,
      required super.serviceProvider,
      required super.deliveryProviderType,
      required super.deliveryCompany,
      required super.deliveryDirection,
      required super.routeInformation,
      required super.orderId,
      required super.chatId,
      this.billImage,
      required super.customer,
      required super.dropOffLocation,
      required super.serviceProviderDriverChatId,
      required super.customerDriverChatId,
      required super.driverLocation,
      required super.pickupLocation});

  bool get canAddReview {
    return review == null && status == cModels.DeliveryOrderStatus.Delivered;
  }
}
