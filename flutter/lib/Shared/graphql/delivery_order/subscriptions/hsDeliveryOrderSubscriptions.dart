import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/__generated/delivery_order.graphql.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/hsDeliveryOrderModels.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrderStatus.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/User.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();

Stream<DeliveryOrderVariables?> listen_on_driver_order_variables(
    {required int orderId}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_on_driver_order_variables(
          Options$Subscription$listen_on_driver_order_variables(
              variables:
                  Variables$Subscription$listen_on_driver_order_variables(
                      orderId: orderId)))
      .map<DeliveryOrderVariables?>(
          (QueryResult<Subscription$listen_on_driver_order_variables> event) {
    if (event.parsedData?.delivery_order_by_pk != null) {
      final Subscription$listen_on_driver_order_variables$delivery_order_by_pk
          orderData = event.parsedData!.delivery_order_by_pk!;
      if (Get.find<HasuraDb>()
          .dataConsumption
          .containsKey("listen_on_driver_order_variables")) {
        Get.find<HasuraDb>()
                .dataConsumption["listen_on_driver_order_variables"]![0] +=
            event.data.toString().length;
        Get.find<HasuraDb>()
            .dataConsumption["listen_on_driver_order_variables"]![1] += 1;
      } else {
        Get.find<HasuraDb>()
            .dataConsumption["listen_on_driver_order_variables"] = <int>[
          event.data.toString().length,
          1
        ];
      }
      mezlog(orderData.counter_offers);
      return DeliveryOrderVariables(
        status: orderData.status.toDeliveryOrderStatus(),
        packageReady: orderData.package_ready,
        counterOffers: orderData.counter_offers
            ?.map<int, cModels.CounterOffer>((String id, value) {
          return MapEntry(
              int.parse(id),
              cModels.CounterOffer(
                price: value["price"],
                status: value["status"].toString().toCounterOfferStatus(),
                time: value["time"],
                name: value["name"],
                image: value["image"],
                expiryTime: value["expiryTime"],
              ));
        }),
        estimatedArrivalAtDropoff:
            (orderData.estimated_arrival_at_dropoff_time != null)
                ? DateTime.parse(orderData.estimated_arrival_at_dropoff_time!)
                : null,
        estimatedArrivalAtPickup:
            (orderData.estimated_arrival_at_pickup_time != null)
                ? DateTime.parse(orderData.estimated_arrival_at_pickup_time!)
                : null,
        cancellationTime: (orderData.cancellation_time != null)
            ? DateTime.parse(orderData.cancellation_time!)
            : null,
        estimatedPackageReadyTime:
            (orderData.estimated_package_ready_time != null)
                ? DateTime.parse(orderData.estimated_package_ready_time!)
                : null,
        scheduleTime: (orderData.schedule_time != null)
            ? DateTime.tryParse(orderData.schedule_time!)
            : null,
        driverInfo: (orderData.delivery_driver != null)
            ? UserInfo(
                hasuraId: orderData.delivery_driver!.user.id,
                name: orderData.delivery_driver!.user.name,
                image: orderData.delivery_driver!.user.image)
            : null,
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
      if (Get.find<HasuraDb>()
          .dataConsumption
          .containsKey("listen_on_current_driver_orders")) {
        Get.find<HasuraDb>()
                .dataConsumption["listen_on_current_driver_orders"]![0] +=
            event.data.toString().length;
        Get.find<HasuraDb>()
            .dataConsumption["listen_on_current_driver_orders"]![1] += 1;
      } else {
        Get.find<HasuraDb>()
            .dataConsumption["listen_on_current_driver_orders"] = <int>[
          event.data.toString().length,
          1
        ];
      }
      mezDbgPrint(
          "listen_on_current_driver_orders: ${Get.find<HasuraDb>().dataConsumption["listen_on_current_driver_orders"]}");
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
      if (Get.find<HasuraDb>()
          .dataConsumption
          .containsKey("listen_on_open_driver_orders")) {
        Get.find<HasuraDb>()
                .dataConsumption["listen_on_open_driver_orders"]![0] +=
            event.data.toString().length;
        Get.find<HasuraDb>()
            .dataConsumption["listen_on_open_driver_orders"]![1] += 1;
      } else {
        Get.find<HasuraDb>().dataConsumption["listen_on_open_driver_orders"] =
            <int>[event.data.toString().length, 1];
      }
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
      if (Get.find<HasuraDb>()
          .dataConsumption
          .containsKey("listen_on_current_dvcompany_orders")) {
        Get.find<HasuraDb>()
                .dataConsumption["listen_on_current_dvcompany_orders"]![0] +=
            event.data.toString().length;
        Get.find<HasuraDb>()
            .dataConsumption["listen_on_current_dvcompany_orders"]![1] += 1;
      } else {
        Get.find<HasuraDb>()
            .dataConsumption["listen_on_current_dvcompany_orders"] = <int>[
          event.data.toString().length,
          1
        ];
      }
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
      if (Get.find<HasuraDb>()
          .dataConsumption
          .containsKey("listen_order_driver_location")) {
        Get.find<HasuraDb>()
                .dataConsumption["listen_order_driver_location"]![0] +=
            event.data.toString().length;
        Get.find<HasuraDb>()
            .dataConsumption["listen_order_driver_location"]![1] += 1;
      } else {
        Get.find<HasuraDb>().dataConsumption["listen_order_driver_location"] =
            <int>[event.data.toString().length, 1];
      }
      final Geography data = event
          .parsedData!.delivery_order_by_pk!.delivery_driver!.current_location!;
      return LatLng(data.latitude, data.longitude);
    }
    return null;
  });
}

Stream<OrderCosts?> listen_on_driver_order_costs({required int orderId}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_driver_order_prices(
          Options$Subscription$listen_driver_order_prices(
              variables: Variables$Subscription$listen_driver_order_prices(
                  orderId: orderId)))
      .map((QueryResult<Subscription$listen_driver_order_prices> event) {
    mezDbgPrint("Event =======>$event");

    if (event.parsedData?.delivery_order_by_pk != null) {
      if (Get.find<HasuraDb>()
          .dataConsumption
          .containsKey("listen_on_driver_order_costs")) {
        Get.find<HasuraDb>()
                .dataConsumption["listen_on_driver_order_costs"]![0] +=
            event.data.toString().length;
        Get.find<HasuraDb>()
            .dataConsumption["listen_on_driver_order_costs"]![1] += 1;
      } else {
        Get.find<HasuraDb>().dataConsumption["listen_on_driver_order_costs"] =
            <int>[event.data.toString().length, 1];
      }
      mezDbgPrint(
          "listen_on_driver_order_costs: ${Get.find<HasuraDb>().dataConsumption["listen_on_driver_order_costs"]}");
      final Subscription$listen_driver_order_prices$delivery_order_by_pk data =
          event.parsedData!.delivery_order_by_pk!;
      return OrderCosts(
          deliveryCost: data.delivery_cost.toDouble(),
          refundAmmount: null,
          tax: data.tax,
          orderItemsCost: data.package_cost_comp,
          totalCost: data.total_cost);
    }
    return null;
  });
}

Future<CustDeliveryOffersListVariables?> get_dv_order_offers(
    {required int orderId}) async {
  QueryResult<Query$getOrderOffers> res = await _hasuraDb.graphQLClient
      .query$getOrderOffers(Options$Query$getOrderOffers(
          variables: Variables$Query$getOrderOffers(orderId: orderId)));
  if (res.hasException) {
    throwError(res.exception);
  }
  if (res.parsedData?.delivery_order_by_pk != null) {
    return CustDeliveryOffersListVariables(
      customerOffer: res.parsedData?.delivery_order_by_pk?.customer_offer,
      offers: res.parsedData?.delivery_order_by_pk?.counter_offers
          ?.map<int, cModels.CounterOffer>((String id, value) {
        return MapEntry(
            int.parse(id),
            cModels.CounterOffer(
              price: value["price"],
              status: value["status"].toString().toCounterOfferStatus(),
              time: value["time"],
              name: value["name"],
              image: value["image"],
              expiryTime: value["expiryTime"],
            ));
      }),
      notifiedDrivers: res.parsedData?.delivery_order_by_pk?.notified_drivers
          ?.map<int, bool>((key, value) {
        return MapEntry<int, bool>(int.parse(key), value as bool);
      }),
    );
  }
  return null;
}

Stream<CustDeliveryOffersListVariables?> listen_on_dv_order_offers(
    {required int orderId}) {
  return _hasuraDb.graphQLClient
      .subscribe$listenOnOrderOffers(Options$Subscription$listenOnOrderOffers(
          variables:
              Variables$Subscription$listenOnOrderOffers(orderId: orderId)))
      .map<CustDeliveryOffersListVariables?>(
          (QueryResult<Subscription$listenOnOrderOffers> event) {
    if (event.hasException) {
      throwError(event.exception);
    }
    mezDbgPrint(
        "CustDeliveryOffersListVariables 🔴=========>${event.parsedData?.delivery_order_by_pk?.toJson()}");
    if (event.parsedData?.delivery_order_by_pk != null) {
      return CustDeliveryOffersListVariables(
        customerOffer: null,
        offers: event.parsedData?.delivery_order_by_pk?.counter_offers
            ?.map<int, cModels.CounterOffer>((String id, value) {
          return MapEntry<int, cModels.CounterOffer>(
              int.parse(id),
              cModels.CounterOffer(
                price: value["price"],
                status: value["status"].toString().toCounterOfferStatus(),
                time: value["time"],
                name: value["name"],
                image: value["image"],
                expiryTime: value["expiryTime"],
              ));
        }),
        notifiedDrivers: event
            .parsedData!.delivery_order_by_pk!.notified_drivers
            ?.map<int, bool>((key, value) {
          return MapEntry<int, bool>(int.parse(key), value as bool);
        }),
      );
    } else
      return null;
  });
}
