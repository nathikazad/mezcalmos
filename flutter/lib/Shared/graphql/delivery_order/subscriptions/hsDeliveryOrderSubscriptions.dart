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
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/ChangePriceRequest.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryAction.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrderStatus.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart';
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
    if (event.parsedData?.delivery_order_by_pk != null) {
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
        orderId: orderData.id,
        scheduleTime: (orderData.schedule_time != null)
            ? DateTime.tryParse(orderData.schedule_time!)
            : null,
        packageReady: orderData.package_ready,

        orderType: orderData.order_type.toOrderType(),
        stripePaymentInfo: _paymentInfo,
        serviceOrderId: orderData.restaurant_order?.id,
        deliveryCompany: _getDeliveryCompany(orderData)!,
        serviceProvider: _getServiceInfo(orderData)!,
        customer: UserInfo(
            hasuraId: orderData.customer.user.id,
            image: orderData.customer.user.image,
            name: orderData.customer.user.name),
        deliveryDirection: orderData.direction.toDeliveryDirection(),
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
        orderTime: DateTime.parse(orderData.order_time),
        driverInfo: (orderData.delivery_driver != null)
            ? UserInfo(
                hasuraId: orderData.delivery_driver!.user.id,
                name: orderData.delivery_driver!.user.name,
                image: orderData.delivery_driver!.user.image,
                language: null)
            : null,
        estimatedArrivalAtDropoff:
            (orderData.estimated_arrival_at_dropoff_time != null)
                ? DateTime.parse(orderData.estimated_arrival_at_dropoff_time!)
                : null,

        estimatedArrivalAtPickup:
            (orderData.estimated_arrival_at_pickup_time != null)
                ? DateTime.parse(orderData.estimated_arrival_at_pickup_time!)
                : null,
        estimatedPackageReadyTime:
            (orderData.estimated_package_ready_time != null)
                ? DateTime.parse(orderData.estimated_package_ready_time!)
                : null,
        status: orderData.status.toDeliveryOrderStatus(),
        deliveryProviderType:
            orderData.service_provider_type.toServiceProviderType(),
        // deliveryCost: orderData.delivery_cost,
        // packageCost: orderData.package_cost_comp ?? 0,
        driverLocation: null,
        pickupLocation: (orderData.pickup_address != null)
            ? MezLocation(
                orderData.pickup_address!,
                orderData.pickup_gps?.toLocationData() ??
                    MezLocation.buildLocationData(0, 0))
            : null,
        customerReviewByDriver: (orderData.customer_review_by_driver != null)
            ? Review(
                comment: orderData.customer_review_by_driver!.note,
                rating: orderData.customer_review_by_driver!.rating,
                toEntityId: orderData.customer_review_by_driver!.to_entity_id,
                toEntityType: orderData
                    .customer_review_by_driver!.to_entity_type
                    .toServiceProviderType(),
                fromEntityId:
                    orderData.customer_review_by_driver!.from_entity_id,
                fromEntityType: orderData
                    .customer_review_by_driver!.from_entity_type
                    .toServiceProviderType(),
                reviewTime: DateTime.parse(
                  orderData.customer_review_by_driver!.created_at,
                ))
            : null,
        serviceReviewByDriver: (orderData.service_provider_review_by_driver !=
                null)
            ? Review(
                comment: orderData.service_provider_review_by_driver!.note,
                rating: orderData.service_provider_review_by_driver!.rating,
                toEntityId:
                    orderData.service_provider_review_by_driver!.to_entity_id,
                toEntityType: orderData
                    .service_provider_review_by_driver!.to_entity_type
                    .toServiceProviderType(),
                fromEntityId:
                    orderData.service_provider_review_by_driver!.from_entity_id,
                fromEntityType: orderData
                    .service_provider_review_by_driver!.from_entity_type
                    .toServiceProviderType(),
                reviewTime: DateTime.parse(
                  orderData.service_provider_review_by_driver!.created_at,
                ))
            : null,
        dropOffLocation: MezLocation(
            orderData.dropoff_address, orderData.dropoff_gps.toLocationData()),
        customerDriverChatId: orderData.chat_with_customer_id,
        serviceProviderDriverChatId: orderData.chat_with_service_provider_id,
        paymentType: orderData.payment_type.toPaymentType(),
        chatId: orderData.chat_with_customer_id,
        costs: OrderCosts(
            deliveryCost: orderData.delivery_cost,
            refundAmmount: null,
            tax: null,
            orderItemsCost: orderData.package_cost_comp,
            totalCost: orderData.total_cost),
        deliveryOrderId: orderData.id,
      );
    }
    return null;
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
          totalCost: orderData.total_cost,
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
          totalCost: orderData.total_cost,
        );
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
          totalCost: orderData.total_cost,
        );
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

Stream<OrderCosts?> listen_on_driver_order_costs({required orderId}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_driver_order_prices(
          Options$Subscription$listen_driver_order_prices(
              variables: Variables$Subscription$listen_driver_order_prices(
                  orderId: orderId)))
      .map((QueryResult<Subscription$listen_driver_order_prices> event) {
    mezDbgPrint("Event =======>$event");

    Get.find<HasuraDb>().dataConsumption["listen_on_driver_order_costs"] = event
            .data
            .toString()
            .length +
        (Get.find<HasuraDb>().dataConsumption["listen_on_driver_order_costs"] ??
            0);
    // table
    // name_of_subscription, date, total_size, user_id

    if (event.parsedData?.delivery_order_by_pk != null) {
      Subscription$listen_driver_order_prices$delivery_order_by_pk data =
          event.parsedData!.delivery_order_by_pk!;
      return OrderCosts(
          deliveryCost: data.delivery_cost.toDouble(),
          refundAmmount: null,
          changePriceRequest: (data.change_price_request != null)
              ? ChangePriceRequest.fromMap(data.change_price_request)
              : null,
          tax: data.tax,
          orderItemsCost: data.package_cost_comp,
          totalCost: data.total_cost);
    }
    return null;
  });
}
