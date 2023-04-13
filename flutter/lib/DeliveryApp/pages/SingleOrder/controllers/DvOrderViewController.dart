import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/DvOrderView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModel;
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/mutations/hsDeliveryOrderMutations.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/queries/hsDleiveryOrderQuerries.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/subscriptions/hsDeliveryOrderSubscriptions.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryAction.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

class DvOrderViewcontroller {
  // instances //

  DeliveryAuthController deliveryAuthAuthController =
      Get.find<DeliveryAuthController>();
  HasuraDb hasuraDb = Get.find<HasuraDb>();
  // vars //
  Rxn<DeliveryOrder> _order = Rxn();
  DeliveryOrderStatus? _statusSnapshot;
  RxBool isSettingPickUpTime = false.obs;
  RxBool isSettingDropoffTime = false.obs;

  // getters //
  DeliveryOrderStatus get orderStatus {
    return _order.value!.status;
  }

  bool get isLaundryPickup {
    return order.orderType == OrderType.Laundry &&
        order.deliveryDirection == DeliveryDirection.FromCustomer;
  }

  bool get isCourier {
    return order.orderType == OrderType.Courier;
  }

  bool get showCustomerAddReviewButton {
    return order.status == DeliveryOrderStatus.OrderReceived &&
        order.customerReviewByDriver == null;
  }

  bool get showServiceAddReviewButton {
    return order.status == DeliveryOrderStatus.OrderReceived &&
        order.serviceReviewByDriver == null;
  }

  DeliveryOrder get order => _order.value!;
  bool get hasData => _order.value != null;
  bool get inPickupPhase =>
      _order.value!.deliveryDirection == DeliveryDirection.FromCustomer;
  bool get pickuSetted => _order.value?.estimatedArrivalAtPickup != null;
  bool get dropoffSetted => _order.value?.estimatedArrivalAtDropoff != null;
  DateTime? get pickupTime => _order.value?.estimatedArrivalAtPickup;
  DateTime? get dropoffTime => _order.value?.estimatedArrivalAtDropoff;

  // streams //
  StreamSubscription<DeliveryOrder?>? orderStream;
  String? subscriptionId;
  // map vars //

  // init
  Future<void> init({required int orderId}) async {
    MezRouter.registerReturnToViewCallback(DvOrderView.constructPath(orderId),
        () {
      clearNotifications(orderId);
    });
    clearNotifications(orderId);
    _order.value = await get_driver_order_by_id(orderId: orderId);
    mezDbgPrint(
        "TIME FROM QUERY ========>${_order.value?.estimatedArrivalAtDropoff}");

    if (_order.value == null) {
      mezDbgPrint(
          "🚨 Can't get order $orderId 🚨 DvRestaurantOrderViewController");
    } else {
      subscriptionId = hasuraDb.createSubscription(start: () {
        orderStream = listen_on_driver_order_by_id(orderId: orderId)
            .listen((DeliveryOrder? event) {
          if (event != null) {
            _order.value = null;
            _order.value = event;

            _order.refresh();
          }
        });
      }, cancel: () {
        orderStream?.cancel();
        orderStream = null;
      });
    }
    if (hasData) {
      mezDbgPrint("INIT MAP");
    }
  }

// Order status change methods

  Future<void> startPickup() async {
    return _callRestaurantCloudFunction(
      cModel.DeliveryOrderStatus.OnTheWayToPickup,
    );
  }

  Future<void> startDropoff() async {
    return _callRestaurantCloudFunction(
      cModel.DeliveryOrderStatus.OnTheWayToDropoff,
    );
  }

  Future<void> finishDelivery() async {
    return _callRestaurantCloudFunction(
      cModel.DeliveryOrderStatus.Delivered,
    );
  }

  Future<void> atPickup() async {
    return _callRestaurantCloudFunction(
      cModel.DeliveryOrderStatus.AtPickup,
    );
  }

  Future<void> atDropoff() async {
    return _callRestaurantCloudFunction(
      cModel.DeliveryOrderStatus.AtDropoff,
    );
  }

  Future<void> _callRestaurantCloudFunction(
      cModel.DeliveryOrderStatus status) async {
    mezDbgPrint("😇 Status called ==========>$status");
    try {
      ChangeDeliveryStatusResponse res =
          await CloudFunctions.delivery2_changeStatus(
        deliveryId: order.orderId,
        newStatus: status,
      );
      if (res.success == false) {
        mezDbgPrint(res.error);
        showErrorSnackBar(errorText: res.error.toString());
      }
    } on FirebaseFunctionsException catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
      showErrorSnackBar(errorText: e.message.toString());
    }
  }

// dispose
  void dispose() {
    mezDbgPrint("Called dispose 😔😔😔😔");

    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    _order.close();
  }

  Future<void> setDropoffTime(DateTime newTime) async {
    isSettingDropoffTime.value = true;
    mezDbgPrint("Setting dropOff time ======>>> ⏰⏰⏰⏰⏰⏰  ");
    try {
      await dv_update_est_dropoff_time(orderId: order.orderId, time: newTime);
    } catch (e, stk) {
      showErrorSnackBar();
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } finally {
      isSettingDropoffTime.value = false;
    }
  }

  Future<void> setPickupTime(DateTime newTime) async {
    isSettingPickUpTime.value = true;
    mezDbgPrint("Setting pickup time ======>>> ⏰⏰⏰⏰⏰⏰  ");
    try {
      await dv_update_est_pickup_time(orderId: order.orderId, time: newTime);
    } catch (e, stk) {
      showErrorSnackBar();
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } finally {
      isSettingPickUpTime.value = false;
    }
  }

  Future<void> acceptOpenOrder() async {
    try {
      AssignDriverResponse res = await CloudFunctions.delivery2_assignDriver(
          deliveryOrderId: order.orderId,
          deliveryDriverId:
              deliveryAuthAuthController.driver!.deliveryDriverId);
      if (res.success == false) {
        mezDbgPrint(res.error);
        showErrorSnackBar(errorText: res.error.toString());
      }
    } on FirebaseFunctionsException catch (e, stk) {
      showErrorSnackBar(errorText: e.message.toString());
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  void clearNotifications(int orderId) {
    Get.find<ForegroundNotificationsController>().clearAllOrderNotifications(
        orderType: OrderType.Courier, orderId: orderId);
  }

  Future<int?> addServiceReview(int reviewId) async {
    try {
      int? res = await dv_update_review_id(
          orderId: order.orderId,
          reviewId: reviewId,
          serviceProviderType: order.orderType.toServiceProviderType());
      if (res != null) {
        return res;
      }
    } on FirebaseFunctionsException catch (e, stk) {
      showErrorSnackBar(errorText: e.message.toString());
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    return null;
  }

  Future<int?> addCustomerReview(int reviewId) async {
    try {
      int? res = await dv_update_review_id(
          orderId: order.orderId,
          reviewId: reviewId,
          serviceProviderType: ServiceProviderType.Customer);
      if (res != null) {
        return res;
      }
    } on FirebaseFunctionsException catch (e, stk) {
      showErrorSnackBar(errorText: e.message.toString());
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    return null;
  }
}
