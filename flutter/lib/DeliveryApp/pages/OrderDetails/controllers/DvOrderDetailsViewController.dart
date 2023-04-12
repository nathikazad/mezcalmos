import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/courier_order/hsCourierOrder.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/queries/hsDleiveryOrderQuerries.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/subscriptions/hsDeliveryOrderSubscriptions.dart';
import 'package:mezcalmos/Shared/graphql/review/hsReview.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Courier/CourierOrderItem.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class DvOrderDetailsViewController {
  HasuraDb _hasuraDb = Get.find<HasuraDb>();
  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();
  TextEditingController openOrderPriceText = TextEditingController();
  TextEditingController openOrderReasonText = TextEditingController();
  GlobalKey<FormState> updatePriceFormKey = GlobalKey<FormState>();
  StreamSubscription<OrderCosts?>? orderCostsStream;
  String? subscriptionId;

  RxnNum customerOrdersCount = RxnNum();
  RxnNum customerReview = RxnNum();
  RxnNum serviceOrdersCount = RxnNum();
  RxnNum serviceReview = RxnNum();

  late int orderId;
  Rxn<DeliveryOrder> order = Rxn();
  //Rxn<ChangePriceRequest> changePriceRequest;
  RxnNum tax = RxnNum();
  final Rxn<imPicker.XFile> newBillFile = Rxn();
  final Rxn<String> newBillUrl = Rxn();
  final RxBool billLoading = RxBool(false);
  Rxn<OrderCosts> _orderCosts = Rxn();
  OrderCosts? get orderCosts =>
      (isCourier) ? _orderCosts.value : order.value?.costs;
  Rxn<List<CourierOrdeItem>> items = Rxn();
  TextEditingController costText = TextEditingController();
  TextEditingController taxText = TextEditingController();
// getters //

  bool get showEditPrice {
    return (order.value?.orderType == OrderType.Courier ||
            order.value?.orderType == OrderType.Laundry) &&
        order.value?.isDriverAssigned == true &&
        order.value?.status == DeliveryOrderStatus.OrderReceived;
  }

  bool get isCourier => order.value?.orderType == OrderType.Courier;

  bool get taxSetted => _orderCosts.value?.tax != null;
  // methods //
  Future<void> init({required int orderId}) async {
    this.orderId = orderId;
    order.value =
        await get_driver_order_by_id(orderId: orderId, withCache: false);

    subscriptionId = _hasuraDb.createSubscription(start: () {
      orderCostsStream = listen_on_driver_order_costs(orderId: orderId)
          .listen((OrderCosts? event) {
        if (event != null) {
          mezDbgPrint(
              "Stream triggred from order controller ✅✅✅✅✅✅✅✅✅ =====>${event.totalCost} ");
          _orderCosts.value = event;
        }
      });
    }, cancel: () {
      orderCostsStream?.cancel();
      orderCostsStream = null;
    });

    if (order.value != null) {
      unawaited(_fetchOrdersCountAndReviews());
    }
    if (order.value != null && order.value!.orderType == OrderType.Courier) {
      unawaited(_fetchOrderItems(orderId));
      unawaited(_fetchOrderBill(orderId));
    }
  }

  Future<void> _fetchOrderItems(int orderId) async {
    items.value =
        await get_courier_order_items(orderId: orderId, withCache: false);
    items.refresh();
  }

  Future<void> _fetchOrderBill(int orderId) async {
    newBillUrl.value =
        await get_courier_bill_order_image(orderId: orderId, withCache: false);
    newBillUrl.refresh();
  }

  Future<void> _fetchOrdersCountAndReviews() async {
    serviceOrdersCount.value = await fetch_delivery_orders_count(
        entityId: order.value!.serviceProvider.hasuraId,
        serviceProviderType: order.value!.orderType.toServiceProviderType());
    customerOrdersCount.value = await fetch_delivery_orders_count(
        entityId: order.value!.customer.hasuraId,
        serviceProviderType: ServiceProviderType.Customer);
    customerReview.value = await get_service_review_average(
        serviceId: order.value!.customer.hasuraId,
        serviceProviderType: ServiceProviderType.Customer);
    serviceReview.value = await get_service_review_average(
        serviceId: order.value!.serviceProvider.hasuraId,
        serviceProviderType: order.value!.orderType.toServiceProviderType());
  }

  Future<void> markItemAvailable(
      {required int itemId, required bool isAvailable}) async {
    await update_courier_order_item(itemId: itemId, available: isAvailable);
    await _fetchOrderItems(orderId);
  }

  // void editCost({required int itemId}) {
  //   editableItemsIds.add(itemId);
  //   editableItemsControllers.add(TextEditingController());
  // }

  Future<void> saveCost({required int itemId, required int index}) async {
    await update_courier_order_item(
        itemId: itemId, actualCost: num.tryParse(costText.text));
    await _fetchOrderItems(orderId);
  }

  Future<void> editTax() async {
    if (num.tryParse(taxText.text) != null) {
      tax.value = await update_courier_order_tax(
          orderId: orderId, tax: num.parse(taxText.text));
    }
  }

  Future<void> editImage(context) async {
    // if (MezEnv.appLaunchMode == AppLaunchMode.stage) {
    //   newBillUrl.value = await update_courier_order_bill(
    //       orderId: orderId,
    //       imageUrl:
    //           "https://i.pinimg.com/originals/77/fc/85/77fc858e6e30f9cd44b492c4811f96c0.jpg");
    // } else {
    final imPicker.ImageSource? _from = await imagePickerChoiceDialog(context);

    if (_from != null) {
      billLoading.value = true;

      final imPicker.XFile? _res =
          await imagePicker(picker: _imagePicker, source: _from);

      try {
        if (_res != null) {
          newBillFile.value = _res;
          if (newBillFile.value != null) {
            String imageUrl = await uploadImgToFbStorage(
                compressLevel: 50,
                imageFile: newBillFile.value!,
                pathPrefix: "bills/delivery/$orderId");
            newBillUrl.value = await update_courier_order_bill(
                orderId: orderId, imageUrl: imageUrl);
          }
        }
        billLoading.value = false;
      } catch (e) {
        billLoading.value = false;
        mezDbgPrint(
            "[+] MEZEXCEPTION => ERROR HAPPEND WHILE BROWING - SELECTING THE IMAGE !\nMore Details :\n$e ");
      }
    }
    // }
  }

  Future<void> requestPriceChange(BuildContext context) async {
    if (updatePriceFormKey.currentState?.validate() == true) {
      try {
        ChangePriceReqResponse res =
            await CloudFunctions.delivery2_changeDeliveryPrice(
                deliveryOrderId: order.value!.orderId,
                newPrice: double.parse(openOrderPriceText.text),
                reason: openOrderReasonText.text);

        if (res.success == false) {
          mezDbgPrint(res.error);
          mezDbgPrint("ERRORRRR ========>${res.unhandledError}");
          showErrorSnackBar(errorText: res.error.toString());
        } else {
          showSavedSnackBar(
              title: "Sended", subtitle: "Price change request sended");
          Navigator.pop(context);
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
  }

  void dispose() {
    if (subscriptionId != null) _hasuraDb.cancelSubscription(subscriptionId!);
  }
}
