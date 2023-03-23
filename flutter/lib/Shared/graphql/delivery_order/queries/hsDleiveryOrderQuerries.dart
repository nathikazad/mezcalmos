import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/__generated/delivery_order.graphql.dart';
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

Future<DeliveryOrder?> get_driver_order_by_id({required int orderId}) async {
  final QueryResult<Query$get_driver_order> response =
      await _hasuraDb.graphQLClient.query$get_driver_order(
    Options$Query$get_driver_order(
      variables: Variables$Query$get_driver_order(orderId: orderId),
    ),
  );
  if (response.parsedData?.delivery_order_by_pk == null) {
    throwError(response.exception);
  }

  final Query$get_driver_order$delivery_order_by_pk orderData =
      response.parsedData!.delivery_order_by_pk!;
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
      id: orderData.id,
      scheduleTime: (orderData.schedule_time != null)
          ? DateTime.tryParse(orderData.schedule_time!)
          : null,
      packageReady: orderData.package_ready,
      orderType: orderData.order_type.toOrderType(),
      stripeOrderPaymentInfo: _paymentInfo,
      serviceOrderId: orderData.restaurant_order?.id,
      deliveryCompany: _getDeliveryCompany(orderData)!,
      serviceInfo: _getServiceInfo(orderData)!,
      customerInfo: UserInfo(
          hasuraId: orderData.customer.user.id,
          image: orderData.customer.user.image,
          name: orderData.customer.user.name),
      deliveryDirection: orderData.direction.toDeliveryDirection(),
      routeInformation: (orderData.trip_duration != null &&
              orderData.trip_distance != null &&
              orderData.trip_polyline != null)
          ? RouteInformation(
              duration: RideDuration(
                  orderData.trip_duration.toString(), orderData.trip_duration!),
              distance: RideDistance(
                  orderData.trip_distance.toString(), orderData.trip_distance!),
              polyline: orderData.trip_polyline!)
          : null,
      orderTime: DateTime.parse(orderData.order_time),
      driverInfo: (orderData.delivery_driver != null)
          ? UserInfo(
              hasuraId: orderData.delivery_driver!.user.id,
              name: orderData.delivery_driver!.user.name,
              image: orderData.delivery_driver!.user.image)
          : null,
      estimatedArrivalAtDropoffTime: (orderData.estimated_arrival_at_dropoff_time != null)
          ? DateTime.parse(orderData.estimated_arrival_at_dropoff_time!)
          : null,
      estimatedArrivalAtPickupTime: (orderData.estimated_arrival_at_pickup_time != null)
          ? DateTime.parse(orderData.estimated_arrival_at_pickup_time!)
          : null,
      estimatedPackageReadyTime: (orderData.estimated_package_ready_time != null)
          ? DateTime.parse(orderData.estimated_package_ready_time!)
          : null,
      status: orderData.status.toDeliveryOrderStatus(),
      serviceProviderType:
          orderData.service_provider_type.toServiceProviderType(),
      deliveryCost: orderData.delivery_cost,
      packageCost: orderData.package_cost,
      driverLocation:
          (orderData.delivery_driver != null && orderData.delivery_driver?.current_location != null)
              ? LatLng(orderData.delivery_driver!.current_location!.latitude,
                  orderData.delivery_driver!.current_location!.longitude)
              : null,
      pickupLocation: (orderData.pickup_address != null && orderData.pickup_gps != null)
          ? MezLocation(orderData.pickup_address!, orderData.pickup_gps!.toLocationData())
          : null,
      dropoffLocation: MezLocation(orderData.dropoff_address, orderData.dropoff_gps.toLocationData()),
      chatWithCustomerId: orderData.chat_with_customer_id,
      chatWithServiceProviderId: orderData.chat_with_service_provider_id,
      paymentType: orderData.payment_type.toPaymentType());
}

Future<List<MinimalOrder>?> get_current_driver_orders(
    {required int driverId}) async {
  final QueryResult<Query$get_inprocess_driver_orders> queryResult =
      await _hasuraDb.graphQLClient.query$get_inprocess_driver_orders(
    Options$Query$get_inprocess_driver_orders(
      fetchPolicy: FetchPolicy.networkOnly,
      variables:
          Variables$Query$get_inprocess_driver_orders(driverId: driverId),
    ),
  );
  if (queryResult.parsedData?.delivery_order != null) {
    final List<Query$get_inprocess_driver_orders$delivery_order> ordersData =
        queryResult.parsedData!.delivery_order;

    final List<MinimalOrder> orders = ordersData
        .map((Query$get_inprocess_driver_orders$delivery_order orderData) {
      return MinimalOrder(
          id: orderData.id,
          orderType: orderData.order_type.toOrderType(),
          toAdress: orderData.dropoff_address,
          orderTime: DateTime.parse(orderData.order_time),
          title: orderData.customer.user.name!,
          image: orderData.customer.user.image,
          status:
              orderData.status.toDeliveryOrderStatus().toMinimalOrderStatus(),
          totalCost: orderData.package_cost);
    }).toList();
    return orders;
  } else {
    throw Exception(
        "🚨 Getting min orders exceptions \n ${queryResult.exception}");
  }
}

Future<List<MinimalOrder>?> get_open_driver_orders(
    {required int driverId, bool inProcess = true}) async {
  final QueryResult<Query$get_open_driver_orders> queryResult =
      await _hasuraDb.graphQLClient.query$get_open_driver_orders(
    Options$Query$get_open_driver_orders(
        fetchPolicy: FetchPolicy.networkOnly,
        variables:
            Variables$Query$get_open_driver_orders(in_process: inProcess)),
  );
  if (queryResult.parsedData?.delivery_order != null) {
    List<Query$get_open_driver_orders$delivery_order> ordersData =
        queryResult.parsedData!.delivery_order;

    final List<MinimalOrder> orders =
        ordersData.map((Query$get_open_driver_orders$delivery_order orderData) {
      return MinimalOrder(
          id: orderData.id,
          orderType: orderData.order_type.toOrderType(),
          toAdress: orderData.dropoff_address,
          orderTime: DateTime.parse(orderData.order_time),
          title: orderData.customer.user.name!,
          image: orderData.customer.user.image,
          status:
              orderData.status.toDeliveryOrderStatus().toMinimalOrderStatus(),
          totalCost: orderData.package_cost);
    }).toList();
    return orders;
  } else {
    throw Exception(
        "🚨 Getting min orders exceptions \n ${queryResult.exception}");
  }
}

Future<List<MinimalOrder>?> get_past_driver_orders(
    {required int driverId}) async {
  final QueryResult<Query$get_past_driver_orders> queryResult =
      await _hasuraDb.graphQLClient.query$get_past_driver_orders(
    Options$Query$get_past_driver_orders(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Query$get_past_driver_orders(driverId: driverId),
    ),
  );
  if (queryResult.parsedData?.delivery_order != null) {
    final List<Query$get_past_driver_orders$delivery_order> ordersData =
        queryResult.parsedData!.delivery_order;

    final List<MinimalOrder> orders =
        ordersData.map((Query$get_past_driver_orders$delivery_order orderData) {
      return MinimalOrder(
          id: orderData.id,
          orderType: orderData.order_type.toOrderType(),
          toAdress: orderData.dropoff_address,
          orderTime: DateTime.parse(orderData.order_time),
          title: orderData.customer.user.name!,
          image: orderData.customer.user.image,
          status:
              orderData.status.toDeliveryOrderStatus().toMinimalOrderStatus(),
          totalCost: orderData.package_cost);
    }).toList();
    return orders;
  } else {
    throw Exception(
        "🚨 Getting min orders exceptions \n ${queryResult.exception}");
  }
}

Future<List<MinimalOrder>?> get_dvcompany_current_orders(
    {required int companyId}) async {
  final QueryResult<Query$get_delivery_company_inprocess_orders> queryResult =
      await _hasuraDb.graphQLClient.query$get_delivery_company_inprocess_orders(
    Options$Query$get_delivery_company_inprocess_orders(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Query$get_delivery_company_inprocess_orders(
          companyId: companyId),
    ),
  );
  if (queryResult.parsedData?.delivery_order != null) {
    final List<Query$get_delivery_company_inprocess_orders$delivery_order>
        ordersData = queryResult.parsedData!.delivery_order;

    final List<MinimalOrder> orders = ordersData.map(
        (Query$get_delivery_company_inprocess_orders$delivery_order orderData) {
      return MinimalOrder(
          id: orderData.id,
          toAdress: orderData.dropoff_address,
          orderType: orderData.order_type.toOrderType(),
          orderTime: DateTime.parse(orderData.order_time),
          title: orderData.customer.user.name!,
          image: orderData.customer.user.image,
          status:
              orderData.status.toDeliveryOrderStatus().toMinimalOrderStatus(),
          totalCost: orderData.package_cost);
    }).toList();
    return orders;
  } else {
    throw Exception(
        "🚨 Getting min orders exceptions \n ${queryResult.exception}");
  }
}

Future<List<MinimalOrder>?> get_dvcompany_past_orders(
    {required int companyId}) async {
  final QueryResult<Query$get_delivery_company_past_orders> queryResult =
      await _hasuraDb.graphQLClient.query$get_delivery_company_past_orders(
    Options$Query$get_delivery_company_past_orders(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Query$get_delivery_company_past_orders(
          companyId: companyId),
    ),
  );
  if (queryResult.parsedData?.delivery_order != null) {
    final List<Query$get_delivery_company_past_orders$delivery_order>
        ordersData = queryResult.parsedData!.delivery_order;

    final List<MinimalOrder> orders = ordersData
        .map((Query$get_delivery_company_past_orders$delivery_order orderData) {
      return MinimalOrder(
          id: orderData.id,
          orderType: orderData.order_type.toOrderType(),
          toAdress: orderData.dropoff_address,
          orderTime: DateTime.parse(orderData.order_time),
          title: orderData.customer.user.name!,
          image: orderData.customer.user.image,
          status:
              orderData.status.toDeliveryOrderStatus().toMinimalOrderStatus(),
          totalCost: orderData.package_cost);
    }).toList();
    return orders;
  } else {
    throw Exception(
        "🚨 Getting min orders exceptions \n ${queryResult.exception}");
  }
}

Future<DeliveryOrder?> get_pick_driver_order_by_id(
    {required int orderId}) async {
  final QueryResult<Query$get_pick_driver_order> response =
      await _hasuraDb.graphQLClient.query$get_pick_driver_order(
    Options$Query$get_pick_driver_order(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Query$get_pick_driver_order(orderId: orderId),
    ),
  );
  if (response.parsedData?.delivery_order_by_pk == null) {
    throwError(response.exception);
  }

  final Query$get_pick_driver_order$delivery_order_by_pk orderData =
      response.parsedData!.delivery_order_by_pk!;

  return DeliveryOrder(
      deliveryDirection: DeliveryDirection.FromCustomer,
      packageReady: false,
      scheduleTime: null,
      id: orderData.id,
      orderType: orderData.order_type.toOrderType(),
      stripeOrderPaymentInfo: null,
      serviceOrderId: null,
      deliveryCompany: UserInfo(
          hasuraId: orderData.service_provider_id, name: "", image: ""),
      serviceInfo: ServiceInfo(
          location: MezLocation.fromLocationData(
              MezLocation.buildLocationData(55, 55)),
          hasuraId: 1,
          image: "",
          name: ""),
      customerInfo: UserInfo(
          hasuraId: orderData.customer.user.id,
          image: orderData.customer.user.image,
          name: orderData.customer.user.name),
      //  deliveryDirection: orderData.,
      routeInformation: (orderData.trip_duration != null &&
              orderData.trip_distance != null &&
              orderData.trip_polyline != null)
          ? RouteInformation(
              duration: RideDuration(
                  orderData.trip_duration.toString(), orderData.trip_duration!),
              distance: RideDistance(
                  orderData.trip_distance.toString(), orderData.trip_distance!),
              polyline: orderData.trip_polyline!)
          : null,
      orderTime: DateTime.parse(orderData.order_time),
      driverInfo: (orderData.delivery_driver != null)
          ? UserInfo(
              hasuraId: orderData.delivery_driver!.user.id,
              name: orderData.delivery_driver!.user.name,
              image: orderData.delivery_driver!.user.image)
          : null,
      status: orderData.status.toDeliveryOrderStatus(),
      serviceProviderType:
          orderData.service_provider_type.toServiceProviderType(),
      deliveryCost: orderData.delivery_cost,
      packageCost: orderData.package_cost,
      driverLocation: (orderData.delivery_driver != null &&
              orderData.delivery_driver?.current_location != null)
          ? LatLng(orderData.delivery_driver!.current_location!.latitude,
              orderData.delivery_driver!.current_location!.longitude)
          : null,
      pickupLocation: (orderData.pickup_address != null && orderData.pickup_gps != null)
          ? MezLocation(
              orderData.pickup_address!, orderData.pickup_gps!.toLocationData())
          : null,
      dropoffLocation:
          MezLocation(orderData.dropoff_address, orderData.dropoff_gps.toLocationData()),
      chatWithCustomerId: 0,
      paymentType: orderData.payment_type.toPaymentType(),
      chatWithServiceProviderId: null,
      estimatedArrivalAtDropoffTime: null,
      estimatedArrivalAtPickupTime: null,
      estimatedPackageReadyTime: null);
}

Future<UserInfo?> get_order_driver_info({required int orderId}) async {
  QueryResult<Query$get_order_driver_info> res =
      await _hasuraDb.graphQLClient.query$get_order_driver_info(
    Options$Query$get_order_driver_info(
      variables: Variables$Query$get_order_driver_info(orderId: orderId),
    ),
  );
  if (res.parsedData?.delivery_order_by_pk == null) {
    throwError(res.exception);
  }
  if (res.parsedData!.delivery_order_by_pk!.delivery_driver != null) {
    Query$get_order_driver_info$delivery_order_by_pk$delivery_driver data =
        res.parsedData!.delivery_order_by_pk!.delivery_driver!;
    return UserInfo(
        hasuraId: data.user.id, name: data.user.name, image: data.user.image);
  }
  return null;
}

UserInfo? _getDeliveryCompany(
    Query$get_driver_order$delivery_order_by_pk orderData) {
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

ServiceInfo? _getServiceInfo(
    Query$get_driver_order$delivery_order_by_pk orderData) {
  final OrderType orderType = orderData.order_type.toString().toOrderType();
  mezDbgPrint("ORDER TYPE ======>${orderType.toString()}");
  mezDbgPrint(
      "ORDER RESTAURANT ======>${orderData.restaurant_order?.restaurant.toString()}");
  switch (orderType) {
    case OrderType.Restaurant:
      return ServiceInfo(
          location: MezLocation.fromHasura(
              orderData.restaurant_order!.restaurant.details!.location.gps,
              orderData.restaurant_order!.restaurant.details!.location.address
                  .toString()),
          hasuraId: orderData.restaurant_order!.restaurant.id,
          image: orderData.restaurant_order!.restaurant.details!.image,
          name: orderData.restaurant_order!.restaurant.details!.name);
    case OrderType.Laundry:
      dynamic laundryOrder =
          orderData.laundry_pickup_order ?? orderData.laundry_delivery_order;
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
              orderData.delivery_company!.details!.location.gps,
              orderData.delivery_company!.details!.location.address),
          hasuraId: orderData.delivery_company!.id,
          image: orderData.delivery_company!.details!.image,
          name: orderData.delivery_company!.details!.name);

    default:
  }
  return null;
}
