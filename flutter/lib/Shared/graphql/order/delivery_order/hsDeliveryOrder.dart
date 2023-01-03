import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/DeliveryAdminApp/models/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/order/delivery_order/__generated/delivery_order.graphql.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as locModel;
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();

Stream<List<DeliveryOrder>> listen_on_delivery_orders() {
  return _hasuraDb.graphQLClient
      .subscribe$listen_on_delivery_orders(
    Options$Subscription$listen_on_delivery_orders(
        fetchPolicy: FetchPolicy.noCache),
  )
      .map<List<DeliveryOrder>>(
          (QueryResult<Subscription$listen_on_delivery_orders> event) {
    List<DeliveryOrder> _o = [];

    if (event.hasException) {
      mezDbgPrint(
          "[AAA] listen_on_delivery_orders :: FAILED WITH EXCEPTION ===> ${event.exception}");
    }
    final List<Subscription$listen_on_delivery_orders$delivery_order?>?
        ordersData = event.parsedData?.delivery_order;
    if (ordersData != null) {
      ordersData.forEach((orderData) {
        if (orderData != null)
          _o.add(
            DeliveryOrder(
              id: orderData.id,
              pickupLocation: locModel.Location(
                orderData.pickup_address,
                orderData.pickup_gps.toLocationData(),
              ),
              dropoffLocation: locModel.Location(
                orderData.dropoff_address,
                orderData.dropoff_gps.toLocationData(),
              ),
              deliveryDriverType:
                  orderData.delivery_driver_type?.toDeliveryDriverType() ??
                      DeliveryDriverType.Delivery_driver,
              chatWithCustomerId: orderData.chat_with_customer_id,
              paymentType: orderData.payment_type.toPaymentType(),
              status: orderData.status.toDeliveryOrderStatus(),
              customerId: orderData.customer_id,
              deliveryCost: orderData.delivery_cost,
              packageCost: orderData.package_cost,
              orderTime: DateTime.parse(orderData.order_time),
              actualArrivalAtDropoffTime: DateTime.tryParse(
                  orderData.actual_arrival_at_dropoff_time ?? ""),
              estimatedArrivalAtDropoffTime: DateTime.tryParse(
                  orderData.estimated_arrival_at_dropoff_time ?? ""),
              actualArrivalAtPickupTime: DateTime.tryParse(
                  orderData.actual_arrival_at_pickup_time ?? ""),
              estimatedArrivalAtPickupTime: DateTime.tryParse(
                  orderData.estimated_arrival_at_pickup_time ?? ""),
              actualPkgReadyTime:
                  DateTime.tryParse(orderData.actual_package_ready_time ?? ""),
              actualDeliveredTime:
                  DateTime.tryParse(orderData.actual_delivered_time ?? ""),
              cancellationTime:
                  DateTime.tryParse(orderData.cancellation_time ?? ""),
              chatWithServiceProviderId:
                  orderData.chat_with_service_provider_id,
              currentGps: orderData.current_gps?.toLocationData(),
              deliveryDriverId: orderData.delivery_driver_id,
              deliveryServiceType:
                  orderData.delivery_driver_type?.toDeliveryProviderType(),
              estimatedPkgReadyTime: DateTime.tryParse(
                  orderData.estimated_package_ready_time ?? ""),
              routeInformation: orderData.trip_polyline != null &&
                      orderData.trip_distance != null &&
                      orderData.trip_duration != null
                  ? RouteInformation(
                      polyline: orderData.trip_polyline!,
                      distance: RideDistance(
                        orderData.trip_distance.toString(),
                        orderData.trip_distance!,
                      ),
                      duration: RideDuration(
                        orderData.trip_duration.toString(),
                        orderData.trip_duration!,
                      ),
                    )
                  : null,
              serviceProviderId: orderData.service_provider_id,
              stripePaymentId: orderData.stripe_payment_id,
              moreInfo: DeliveryOrderInfo(
                customerImage: orderData.customer.user.image,
                customerName: orderData.customer.user.name,
                serviceProviderAddress: orderData.restaurant?.location_text,
                serviceProviderImage: orderData.restaurant?.image,
                serviceProviderName: orderData.restaurant?.name,
                deliveryDriverImage: orderData.delivery_driver?.user.image,
                deliveryDriverName: orderData.delivery_driver?.user.name,
              ),
            ),
          );
      });
      return _o;
    } else {
      throw Exception(
          "🚨🚨🚨🚨 listen_on_restaurant_order_by_id exception ${event.exception}");
    }
  });
}
