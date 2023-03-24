import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/__generated/delivery_order.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryAction.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrderStatus.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();
Stream<DeliveryOrder?> listen_on_driver_order_by_id({required int orderId}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_on_driver_order(
    Options$Subscription$listen_on_driver_order(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Subscription$listen_on_driver_order(
        orderId: orderId,
      ),
    ),
  )
      .map<DeliveryOrder?>(
          (QueryResult<Subscription$listen_on_driver_order> event) {
    final Subscription$listen_on_driver_order$delivery_order_by_pk orderData =
        event.parsedData!.delivery_order_by_pk!;
    StripeOrderPaymentInfo? _paymentInfo;
    if (orderData.restaurant_order?.stripe_info != null) {
      _paymentInfo = StripeOrderPaymentInfo.fromJson(
          orderData.restaurant_order!.stripe_info);
    }
    if (orderData.laundry_pickup_order?.stripe_info != null) {
      _paymentInfo = StripeOrderPaymentInfo.fromJson(
          orderData.restaurant_order!.stripe_info);
    }
    if (orderData.laundry_delivery_order?.stripe_info != null) {
      _paymentInfo = StripeOrderPaymentInfo.fromJson(
          orderData.restaurant_order!.stripe_info);
    }
    return DeliveryOrder(
        scheduleTime: (orderData.schedule_time != null)
            ? DateTime.tryParse(orderData.schedule_time!)
            : null,
        id: orderData.id,
        packageReady: orderData.package_ready,
        orderType: orderData.order_type.toOrderType(),
        stripeOrderPaymentInfo: _paymentInfo,
        serviceOrderId: orderData.restaurant_order?.id,
        deliveryCompany: _getDeliveryCompany(orderData)!,
        serviceInfo: _getServiceInfo(orderData)!,
        deliveryDirection: orderData.direction.toDeliveryDirection(),
        customerInfo: UserInfo(
            hasuraId: orderData.customer.user.id,
            image: orderData.customer.user.image,
            name: orderData.customer.user.name),
        routeInformation: (orderData.trip_duration != null &&
                orderData.trip_distance != null &&
                orderData.trip_polyline != null)
            ? RouteInformation(
                duration: RideDuration(orderData.trip_duration.toString(),
                    orderData.trip_duration!),
                distance: RideDistance(orderData.trip_distance.toString(),
                    orderData.trip_distance!),
                polyline: orderData.trip_polyline!)
            : null,
        driverInfo: (orderData.delivery_driver != null)
            ? UserInfo(
                hasuraId: orderData.delivery_driver!.user.id,
                name: orderData.delivery_driver!.user.name,
                image: orderData.delivery_driver!.user.image)
            : null,
        driverLocation: (orderData.delivery_driver != null &&
                orderData.delivery_driver?.current_location != null)
            ? LatLng(orderData.delivery_driver!.current_location!.latitude,
                orderData.delivery_driver!.current_location!.longitude)
            : null,
        orderTime: DateTime.parse(orderData.order_time),
        status: orderData.status.toDeliveryOrderStatus(),
        serviceProviderType:
            orderData.service_provider_type.toServiceProviderType(),
        deliveryCost: orderData.delivery_cost,
        estimatedArrivalAtDropoffTime:
            (orderData.estimated_arrival_at_dropoff_time != null)
                ? DateTime.parse(orderData.estimated_arrival_at_dropoff_time!)
                : null,
        estimatedArrivalAtPickupTime:
            (orderData.estimated_arrival_at_pickup_time != null)
                ? DateTime.parse(orderData.estimated_arrival_at_pickup_time!)
                : null,
        estimatedPackageReadyTime: (orderData.estimated_package_ready_time != null)
            ? DateTime.parse(orderData.estimated_package_ready_time!)
            : null,
        packageCost: orderData.package_cost_comp ?? 0,
        pickupLocation:
            (orderData.pickup_address != null && orderData.pickup_gps != null)
                ? MezLocation(orderData.pickup_address!, orderData.pickup_gps!.toLocationData())
                : null,
        dropoffLocation: MezLocation(orderData.dropoff_address, orderData.dropoff_gps.toLocationData()),
        chatWithCustomerId: orderData.chat_with_customer_id,
        chatWithServiceProviderId: orderData.chat_with_service_provider_id,
        paymentType: orderData.payment_type.toPaymentType());
  });
}

Stream<List<MinimalOrder>?> listen_on_current_driver_orders(
    {required int driverId}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_on_inprocess_driver_orders(
    Options$Subscription$listen_on_inprocess_driver_orders(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Subscription$listen_on_inprocess_driver_orders(
          driverId: driverId),
    ),
  )
      .map<List<MinimalOrder>?>(
          (QueryResult<Subscription$listen_on_inprocess_driver_orders> event) {
    final List<Subscription$listen_on_inprocess_driver_orders$delivery_order>?
        ordersData = event.parsedData?.delivery_order;
    if (ordersData != null) {
      final List<MinimalOrder> orders = ordersData.map(
          (Subscription$listen_on_inprocess_driver_orders$delivery_order
              orderData) {
        return MinimalOrder(
          id: orderData.id,
          orderType: orderData.order_type.toOrderType(),
          toAdress: orderData.dropoff_address,
          orderTime: DateTime.parse(orderData.order_time),
          title: orderData.customer.user.name!,
          image: orderData.customer.user.image,
          deliveryCost: orderData.delivery_cost,
          status:
              orderData.status.toDeliveryOrderStatus().toMinimalOrderStatus(),
          totalCost: orderData.package_cost_comp ?? 0,
        );
      }).toList();
      return orders;
    }
    return null;
  });
}

Stream<List<MinimalOrder>?> listen_on_open_driver_orders(
    {required int driverId, bool inProcess = true}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_open_driver_orders(
    Options$Subscription$listen_open_driver_orders(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Subscription$listen_open_driver_orders(
          in_process: inProcess),
    ),
  )
      .map<List<MinimalOrder>?>(
          (QueryResult<Subscription$listen_open_driver_orders> event) {
    List<Subscription$listen_open_driver_orders$delivery_order>? ordersData =
        event.parsedData?.delivery_order;
    if (ordersData != null) {
      final List<MinimalOrder> orders = ordersData.map(
          (Subscription$listen_open_driver_orders$delivery_order orderData) {
        return MinimalOrder(
            id: orderData.id,
            orderType: orderData.order_type.toOrderType(),
            toAdress: orderData.dropoff_address,
            orderTime: DateTime.parse(orderData.order_time),
            title: orderData.customer.user.name!,
            image: orderData.customer.user.image,
            deliveryCost: orderData.delivery_cost,
            status:
                orderData.status.toDeliveryOrderStatus().toMinimalOrderStatus(),
            totalCost:
                orderData.package_cost_comp ?? 0 + orderData.delivery_cost);
      }).toList();
      return orders;
    }
    return null;
  });
}

Stream<List<MinimalOrder>?> listen_on_current_dvcompany_orders(
    {required int companyId}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_delivery_company_current_orders(
    Options$Subscription$listen_delivery_company_current_orders(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Subscription$listen_delivery_company_current_orders(
          companyId: companyId),
    ),
  )
      .map<List<MinimalOrder>?>(
          (QueryResult<Subscription$listen_delivery_company_current_orders>
              event) {
    final List<
            Subscription$listen_delivery_company_current_orders$delivery_order>?
        ordersData = event.parsedData?.delivery_order;
    if (ordersData != null) {
      final List<MinimalOrder> orders = ordersData.map(
          (Subscription$listen_delivery_company_current_orders$delivery_order
              orderData) {
        return MinimalOrder(
            id: orderData.id,
            orderType: orderData.order_type.toOrderType(),
            toAdress: orderData.dropoff_address,
            orderTime: DateTime.parse(orderData.order_time),
            title: orderData.customer.user.name!,
            image: orderData.customer.user.image,
            deliveryCost: orderData.delivery_cost,
            status:
                orderData.status.toDeliveryOrderStatus().toMinimalOrderStatus(),
            totalCost:
                orderData.package_cost_comp ?? 0 + orderData.delivery_cost);
      }).toList();
      return orders;
    }
    return null;
  });
}

Stream<LatLng?> listen_order_driver_location({required int orderId}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_on_order_driver_location(
          Options$Subscription$listen_on_order_driver_location(
              variables: Variables$Subscription$listen_on_order_driver_location(
                  orderId: orderId)))
      .map<LatLng?>(
          (QueryResult<Subscription$listen_on_order_driver_location> event) {
    if (event.parsedData?.delivery_order_by_pk?.delivery_driver
            ?.current_location !=
        null) {
      Geography data = event
          .parsedData!.delivery_order_by_pk!.delivery_driver!.current_location!;
      return LatLng(data.latitude, data.longitude);
    }
    return null;
  });
}

UserInfo? _getDeliveryCompany<T>(
    Subscription$listen_on_driver_order$delivery_order_by_pk orderData) {
  mezDbgPrint(
      "ORDER SERVICE PROVIDER TYPE ===========>>>>>>>>>${orderData.service_provider_type.toString()}");
  final ServiceProviderType serviceProviderType =
      orderData.service_provider_type.toString().toServiceProviderType();
  switch (serviceProviderType) {
    case ServiceProviderType.DeliveryCompany:
      return UserInfo(
          hasuraId: orderData.delivery_company!.id,
          name: orderData.delivery_company!.details!.name,
          image: orderData.delivery_company!.details!.image);
    case ServiceProviderType.Restaurant:
      return UserInfo(
          hasuraId: orderData.restaurant!.id,
          name: orderData.restaurant!.details!.name,
          image: orderData.restaurant!.details!.image);
    case ServiceProviderType.Laundry:
      return UserInfo(
          hasuraId: orderData.laundry!.id,
          name: orderData.laundry!.details!.name,
          image: orderData.laundry!.details!.image);

    default:
  }
  return null;
}

ServiceInfo? _getServiceInfo(orderData) {
  final OrderType orderType = orderData.order_type.toString().toOrderType();
  switch (orderType) {
    case OrderType.Restaurant:
      return ServiceInfo(
          location: MezLocation.fromHasura(
              orderData.restaurant_order!.restaurant.details.location.gps,
              orderData.restaurant_order!.restaurant.details.location.address
                  .toString()),
          hasuraId: orderData.restaurant_order!.restaurant.id,
          image: orderData.restaurant_order!.restaurant.details.image,
          name: orderData.restaurant_order!.restaurant.details.name);
    case OrderType.Laundry:
      dynamic laundryOrder =
          orderData?.laundry_pickup_order ?? orderData?.laundry_delivery_order;
      return ServiceInfo(
          location: MezLocation.fromHasura(
              laundryOrder.store.details.location.gps,
              laundryOrder.store.details.location.address),
          hasuraId: laundryOrder.store.id,
          image: laundryOrder.store.details.image,
          name: laundryOrder.store.details.name);
    case OrderType.Courier:
      return ServiceInfo(
          location: MezLocation.fromHasura(
              orderData.delivery_company.details.location.gps,
              orderData.delivery_company.details.location.address),
          hasuraId: orderData.delivery_company.id,
          image: orderData.delivery_company.details.image,
          name: orderData.delivery_company.details.name);

    default:
  }
  return null;
}
