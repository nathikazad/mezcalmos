import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/courier_order/__generated/courier_order.graphql.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Courier/CourierOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Courier/CourierOrderItem.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryAction.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryDriverType.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();

Future<CourierOrder?> get_courier_order_by_id({required int orderId}) async {
  QueryResult<Query$get_courier_order_by_id> res =
      await _hasuraDb.graphQLClient.query$get_courier_order_by_id(
    Options$Query$get_courier_order_by_id(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Query$get_courier_order_by_id(orderId: orderId),
    ),
  );

  if (res.parsedData?.delivery_courier_order_by_pk == null) {
    throwError(res.exception);
  } else {
    Query$get_courier_order_by_id$delivery_courier_order_by_pk orderData =
        res.parsedData!.delivery_courier_order_by_pk!;
    StripeOrderPaymentInfo? _paymentInfo;
    if (orderData.stripe_info != null) {
      _paymentInfo = StripeOrderPaymentInfo.fromJson(orderData.stripe_info);
    }
    return CourierOrder(
      orderType: OrderType.Courier,
      id: orderData.id,
      scheduleTime: (orderData.delivery_order.schedule_time != null)
          ? DateTime.tryParse(orderData.delivery_order.schedule_time!)
          : null,
      deliveryDirection:
          orderData.delivery_order.direction.toDeliveryDirection(),
      customerInfo: UserInfo(
          hasuraId: orderData.delivery_order.customer.user.id,
          image: orderData.delivery_order.customer.user.image,
          name: orderData.delivery_order.customer.user.name),
      routeInformation: (orderData.delivery_order.trip_duration != null &&
              orderData.delivery_order.trip_distance != null &&
              orderData.delivery_order.trip_polyline != null)
          ? RouteInformation(
              duration: RideDuration(
                  orderData.delivery_order.trip_duration.toString(),
                  orderData.delivery_order.trip_duration!),
              distance: RideDistance(
                  orderData.delivery_order.trip_distance.toString(),
                  orderData.delivery_order.trip_distance!),
              polyline: orderData.delivery_order.trip_polyline!)
          : null,
      driverInfo: (orderData.delivery_order.delivery_driver != null)
          ? UserInfo(
              hasuraId: orderData.delivery_order.delivery_driver!.user.id,
              name: orderData.delivery_order.delivery_driver!.user.name,
              image: orderData.delivery_order.delivery_driver!.user.image)
          : null,
      driverLocation: (orderData.delivery_order.delivery_driver != null &&
              orderData.delivery_order.delivery_driver?.current_location !=
                  null)
          ? LatLng(
              orderData
                  .delivery_order.delivery_driver!.current_location!.latitude,
              orderData
                  .delivery_order.delivery_driver!.current_location!.longitude)
          : null,
      orderTime: DateTime.parse(orderData.order_time),
      status: orderData.delivery_order.status.toDeliveryOrderStatus(),
      serviceProviderType: orderData.delivery_order.service_provider_type
          .toServiceProviderType(),
      deliveryCost: orderData.delivery_order.delivery_cost,
      estimatedArrivalAtDropoffTime:
          (orderData.delivery_order.estimated_arrival_at_dropoff_time != null)
              ? DateTime.parse(
                  orderData.delivery_order.estimated_arrival_at_dropoff_time!)
              : null,
      estimatedArrivalAtPickupTime:
          (orderData.delivery_order.estimated_arrival_at_pickup_time != null)
              ? DateTime.parse(
                  orderData.delivery_order.estimated_arrival_at_pickup_time!)
              : null,
      estimatedPackageReadyTime:
          (orderData.delivery_order.estimated_package_ready_time != null)
              ? DateTime.parse(
                  orderData.delivery_order.estimated_package_ready_time!)
              : null,
      packageCost: orderData.delivery_order.package_cost,
      pickupLocation: (orderData.delivery_order.pickup_address != null &&
              orderData.delivery_order.pickup_gps != null)
          ? MezLocation(orderData.delivery_order.pickup_address!,
              orderData.delivery_order.pickup_gps!.toLocationData())
          : null,
      dropoffLocation: MezLocation(orderData.delivery_order.dropoff_address,
          orderData.delivery_order.dropoff_gps.toLocationData()),
      chatWithCustomerId: orderData.delivery_order.chat_with_customer_id,
      chatWithServiceProviderId:
          orderData.delivery_order.chat_with_service_provider_id,
      paymentType: orderData.payment_type.toPaymentType(),
      packageReady: orderData.delivery_order.package_ready,
      stripeOrderPaymentInfo: _paymentInfo,
      serviceInfo: ServiceInfo(
          location: MezLocation.fromHasura(
              orderData.delivery_order.delivery_company!.details!.location.gps,
              orderData
                  .delivery_order.delivery_company!.details!.location.address
                  .toString()),
          hasuraId: orderData.delivery_order.delivery_company!.id,
          image: orderData.delivery_order.delivery_company!.details!.image,
          name: orderData.delivery_order.delivery_company!.details!.name),
      items: orderData.items
          .map((Query$get_courier_order_by_id$delivery_courier_order_by_pk$items
                  item) =>
              CourierOrdeItem(
                  unavailable: item.unavailable,
                  orderId: orderId,
                  actualCost: item.actual_cost,
                  id: item.id,
                  name: item.name,
                  image: item.image,
                  notes: item.notes,
                  estCost: item.estimated_cost))
          .toList(),
      serviceOrderId: null,
      deliveryCompany: ServiceInfo(
          location: MezLocation.fromHasura(
              orderData.delivery_order.delivery_company!.details!.location.gps,
              orderData
                  .delivery_order.delivery_company!.details!.location.address
                  .toString()),
          hasuraId: orderData.delivery_order.delivery_company!.id,
          image: orderData.delivery_order.delivery_company!.details!.image,
          name: orderData.delivery_order.delivery_company!.details!.name),
    );
  }

  return null;
}

Stream<CourierOrder?> listen_on_courier_order_by_id({required int orderId}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_on_courier_order_by_id(
          Options$Subscription$listen_on_courier_order_by_id(
              variables: Variables$Subscription$listen_on_courier_order_by_id(
                  orderId: orderId)))
      .map<CourierOrder?>(
          (QueryResult<Subscription$listen_on_courier_order_by_id> event) {
    if (event.parsedData?.delivery_courier_order_by_pk != null) {
      Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk
          orderData = event.parsedData!.delivery_courier_order_by_pk!;
      StripeOrderPaymentInfo? _paymentInfo;
      if (orderData.stripe_info != null) {
        _paymentInfo = StripeOrderPaymentInfo.fromJson(orderData.stripe_info);
      }
      return CourierOrder(
        orderType: OrderType.Courier,
        changePriceRequest:
            (orderData.delivery_order.change_price_request != null)
                ? ChangePriceRequest.fromMap(
                    orderData.delivery_order.change_price_request)
                : null,
        scheduleTime: (orderData.delivery_order.schedule_time != null)
            ? DateTime.tryParse(orderData.delivery_order.schedule_time!)
            : null,
        id: orderData.id,
        deliveryDirection:
            orderData.delivery_order.direction.toDeliveryDirection(),
        customerInfo: UserInfo(
            hasuraId: orderData.delivery_order.customer.user.id,
            image: orderData.delivery_order.customer.user.image,
            name: orderData.delivery_order.customer.user.name),
        routeInformation: (orderData.delivery_order.trip_duration != null &&
                orderData.delivery_order.trip_distance != null &&
                orderData.delivery_order.trip_polyline != null)
            ? RouteInformation(
                duration: RideDuration(
                    orderData.delivery_order.trip_duration.toString(),
                    orderData.delivery_order.trip_duration!),
                distance: RideDistance(
                    orderData.delivery_order.trip_distance.toString(),
                    orderData.delivery_order.trip_distance!),
                polyline: orderData.delivery_order.trip_polyline!)
            : null,
        driverInfo: (orderData.delivery_order.delivery_driver != null)
            ? UserInfo(
                hasuraId: orderData.delivery_order.delivery_driver!.user.id,
                name: orderData.delivery_order.delivery_driver!.user.name,
                image: orderData.delivery_order.delivery_driver!.user.image)
            : null,
        orderTime: DateTime.parse(orderData.order_time),
        status: orderData.delivery_order.status.toDeliveryOrderStatus(),
        serviceProviderType: orderData.delivery_order.service_provider_type
            .toServiceProviderType(),
        deliveryCost: orderData.delivery_order.delivery_cost,
        estimatedArrivalAtDropoffTime:
            (orderData.delivery_order.estimated_arrival_at_dropoff_time != null)
                ? DateTime.parse(
                    orderData.delivery_order.estimated_arrival_at_dropoff_time!)
                : null,
        estimatedArrivalAtPickupTime:
            (orderData.delivery_order.estimated_arrival_at_pickup_time != null)
                ? DateTime.parse(
                    orderData.delivery_order.estimated_arrival_at_pickup_time!)
                : null,
        estimatedPackageReadyTime:
            (orderData.delivery_order.estimated_package_ready_time != null)
                ? DateTime.parse(
                    orderData.delivery_order.estimated_package_ready_time!)
                : null,
        packageCost: orderData.actual_items_cost?.toDouble() ??
            orderData.delivery_order.package_cost,
        pickupLocation: (orderData.delivery_order.pickup_address != null &&
                orderData.delivery_order.pickup_gps != null)
            ? MezLocation(orderData.delivery_order.pickup_address!,
                orderData.delivery_order.pickup_gps!.toLocationData())
            : null,
        dropoffLocation: MezLocation(orderData.delivery_order.dropoff_address,
            orderData.delivery_order.dropoff_gps.toLocationData()),
        chatWithCustomerId: orderData.delivery_order.chat_with_customer_id,
        chatWithServiceProviderId:
            orderData.delivery_order.chat_with_service_provider_id,
        paymentType: orderData.payment_type.toPaymentType(),
        packageReady: orderData.delivery_order.package_ready,
        stripeOrderPaymentInfo: _paymentInfo,
        serviceInfo: ServiceInfo(
            location: MezLocation.fromHasura(
                orderData
                    .delivery_order.delivery_company!.details!.location.gps,
                orderData
                    .delivery_order.delivery_company!.details!.location.address
                    .toString()),
            hasuraId: orderData.delivery_order.delivery_company!.id,
            image: orderData.delivery_order.delivery_company!.details!.image,
            name: orderData.delivery_order.delivery_company!.details!.name),
        items: orderData.items
            .map(
                (Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items
                        item) =>
                    CourierOrdeItem(
                        unavailable: item.unavailable,
                        orderId: orderId,
                        actualCost: item.actual_cost,
                        id: item.id,
                        name: item.name,
                        image: item.image,
                        notes: item.notes,
                        estCost: item.estimated_cost))
            .toList(),
        serviceOrderId: null,
        deliveryCompany: ServiceInfo(
            location: MezLocation.fromHasura(
                orderData
                    .delivery_order.delivery_company!.details!.location.gps,
                orderData
                    .delivery_order.delivery_company!.details!.location.address
                    .toString()),
            hasuraId: orderData.delivery_order.delivery_company!.id,
            image: orderData.delivery_order.delivery_company!.details!.image,
            name: orderData.delivery_order.delivery_company!.details!.name),
        driverLocation: null,
      );
    }
    return null;
  });
}

Stream<OrderCosts?> listen_on_courier_order_costs({required orderId}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_or_courier_order_prices(
          Options$Subscription$listen_or_courier_order_prices(
              variables: Variables$Subscription$listen_or_courier_order_prices(
                  orderId: orderId)))
      .map((QueryResult<Subscription$listen_or_courier_order_prices> event) {
    mezDbgPrint("Event =======>$event");
    if (event.parsedData?.delivery_courier_order != null &&
        event.parsedData?.delivery_courier_order.isNotEmpty == true) {
      Subscription$listen_or_courier_order_prices$delivery_courier_order data =
          event.parsedData!.delivery_courier_order.first;
      return OrderCosts(
          deliveryCost: data.delivery_order.delivery_cost.toDouble(),
          refundAmmount: data.refund_amount,
          stripeFess: data.stripe_fees,
          tax: data.tax,
          orderItemsCost: data.actual_items_cost,
          totalCost: data.total_cost);
    }
    return null;
  });
}

Future<List<CourierOrdeItem>?> get_courier_order_items(
    {required int orderId, bool withCache = true}) async {
  QueryResult<Query$get_courier_order_items_by_id> res =
      await _hasuraDb.graphQLClient.query$get_courier_order_items_by_id(
          Options$Query$get_courier_order_items_by_id(
              fetchPolicy:
                  withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
              variables: Variables$Query$get_courier_order_items_by_id(
                  orderId: orderId)));
  if (res.parsedData?.delivery_courier_order == null ||
      res.parsedData!.delivery_courier_order.isEmpty) {
    throwError(res.exception);
  } else {
    return res.parsedData!.delivery_courier_order.first.items
        .map<CourierOrdeItem>(
            (Query$get_courier_order_items_by_id$delivery_courier_order$items
                    item) =>
                CourierOrdeItem(
                    unavailable: item.unavailable,
                    orderId: orderId,
                    actualCost: item.actual_cost,
                    id: item.id,
                    name: item.name,
                    image: item.image,
                    notes: item.notes,
                    estCost: item.estimated_cost))
        .toList();
  }
  return null;
}

Future<CourierOrdeItem?> update_courier_order_item(
    {required int itemId, num? actualCost, bool? available}) async {
  QueryResult<Mutation$updateCourierOrderItem> res = await _hasuraDb
      .graphQLClient
      .mutate$updateCourierOrderItem(Options$Mutation$updateCourierOrderItem(
          variables: Variables$Mutation$updateCourierOrderItem(
              id: itemId,
              data: Input$delivery_courier_order_item_set_input(
                actual_cost: actualCost?.toDouble(),
                unavailable: available,
              ))));
  if (res.parsedData?.update_delivery_courier_order_item_by_pk == null) {
    throwError(res.exception);
  } else {
    Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk
        data = res.parsedData!.update_delivery_courier_order_item_by_pk!;
    return CourierOrdeItem(
        unavailable: data.unavailable,
        orderId: data.order_id,
        actualCost: data.actual_cost,
        id: data.id,
        name: data.name,
        image: data.image,
        notes: data.notes,
        estCost: data.estimated_cost);
  }
  return null;
}

Future<double?> update_courier_order_tax(
    {required int orderId, required num tax}) async {
  QueryResult<Mutation$updateCourierOrder> res =
      await _hasuraDb.graphQLClient.mutate$updateCourierOrder(
    Options$Mutation$updateCourierOrder(
      variables: Variables$Mutation$updateCourierOrder(
          deliveryOrderId: orderId,
          data: Input$delivery_courier_order_set_input(tax: tax.toDouble())),
    ),
  );
  if (res.parsedData?.update_delivery_courier_order == null ||
      res.parsedData!.update_delivery_courier_order!.returning.isEmpty) {
    throwError(res.exception);
  } else {
    return res.parsedData!.update_delivery_courier_order!.returning.first.tax;
  }
  return null;
}

Future<String?> update_courier_order_bill(
    {required int orderId, required String imageUrl}) async {
  QueryResult<Mutation$updateCourierOrder> res =
      await _hasuraDb.graphQLClient.mutate$updateCourierOrder(
    Options$Mutation$updateCourierOrder(
      variables: Variables$Mutation$updateCourierOrder(
          deliveryOrderId: orderId,
          data: Input$delivery_courier_order_set_input(bill_image: imageUrl)),
    ),
  );
  if (res.parsedData?.update_delivery_courier_order == null ||
      res.parsedData!.update_delivery_courier_order!.returning.isEmpty) {
    throwError(res.exception);
  } else {
    return res
        .parsedData!.update_delivery_courier_order!.returning.first.bill_image;
  }
  return null;
}
