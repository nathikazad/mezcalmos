import 'package:mezcalmos/Shared/models/Orders/Courier/CourierOrderItem.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';

class CourierOrder extends DeliveryOrder {
  List<CourierOrdeItem> items = [];
  CourierOrder(
      {required super.orderType,
      required super.id,
      required super.deliveryCompany,
      required super.serviceInfo,
      required super.customerInfo,
      required super.driverLocation,
      required super.estimatedArrivalAtDropoffTime,
      required super.estimatedArrivalAtPickupTime,
      required super.estimatedPackageReadyTime,
      required super.serviceOrderId,
      required super.deliveryDirection,
      required super.routeInformation,
      required super.orderTime,
      required super.status,
      required super.serviceProviderType,
      required super.deliveryCost,
      required super.packageCost,
      required super.pickupLocation,
      required super.dropoffLocation,
      required super.chatWithCustomerId,
      required super.chatWithServiceProviderId,
      required super.paymentType,
      required super.driverInfo,
      required this.items,
      required super.stripeOrderPaymentInfo,
      required super.packageReady});
}
