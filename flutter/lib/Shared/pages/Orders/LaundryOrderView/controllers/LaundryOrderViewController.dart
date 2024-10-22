import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/laundry/hsLaundry.dart';
import 'package:mezcalmos/Shared/graphql/laundry_order/hsLaundryOrder.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/pages/Orders/LaundryOrderView/LaundryOrderView.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['OrderView']['Components']['LaundryOpSetCategoryComponent'];

class LaundryOrderViewController {
  // instances //

  final MGoogleMapController mGoogleMapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );
  HasuraDb hasuraDb = Get.find<HasuraDb>();
  TextEditingController itemsWeightController = TextEditingController();

  // vars //
  Rxn<LaundryOrder> _order = Rxn();
  RxList<LaundryCostLineItem> laundryCategories = RxList.empty();
  Rxn<LaundryOrderCostLineItem> editableCategory = Rxn();
  Rxn<LaundryCostLineItem> selectedCategory = Rxn();
  cModels.RestaurantOrderStatus? _statusSnapshot;
  LaundryOrderPhase? _phaseSnapshot;
  late int laundryId;

  // getters //
  bool get hasData => _order.value != null;

  bool get isEditingCategory => editableCategory.value != null;

  LaundryOrder get order => _order.value!;

  cModels.LaundryOrderStatus get orderStatus {
    return _order.value!.status;
  }

  // streams //
  StreamSubscription<LaundryOrder?>? orderStream;
  String? subscriptionId;

  // init
  Future<void> init({required int orderId}) async {
    MezRouter.registerReturnToViewCallback(
        LaundryOrderView.constructPath(orderId), () {
      clearNotifications(orderId);
    });
    clearNotifications(orderId);

    try {
      _order.value =
          await get_laundry_order_by_id(orderId: orderId, withCache: false);
      if (_order.value != null) {
        laundryCategories.value = await get_laundry_categories(
            storeId: _order.value!.serviceProvider.hasuraId);
      }

      if (_order.value!.routeInformation != null) {
        mGoogleMapController.decodeAndAddPolyline(
            encodedPolylineString: _order.value!.routeInformation!.polyline);
      }
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    if (_order.value == null) {
      mezDbgPrint("🚨 Can't get order $orderId 🚨 ROpOrderViewController");
    } else {
      subscriptionId = hasuraDb.createSubscription(start: () {
        orderStream = listen_on_laundry_order_by_id(orderId: orderId)
            .listen((LaundryOrder? event) {
          if (event != null) {
            mezDbgPrint(
                "Stream triggred from order controller ✅✅✅✅✅✅✅✅✅ =====> $event");
            _order.value = null;
            _order.value = event;
          }
        });
      }, cancel: () {
        orderStream?.cancel();
        orderStream = null;
      });
    }
  }

  void editCategory({required categoryId}) {
    editableCategory.value = _order.value!.costsByType?.lineItems.firstWhere(
        (LaundryOrderCostLineItem element) => element.id == categoryId);
    selectedCategory.value = laundryCategories.firstWhere(
        (LaundryCostLineItem element) =>
            element.id == editableCategory.value!.id);

    itemsWeightController.text =
        editableCategory.value?.weight.toString() ?? "";
  }

  Future<int?> addNewCategory(LaundryOrderCostLineItem newCostLineItem) async {
    int? res = await add_laundry_order_category(
        categoryId: newCostLineItem.id,
        orderId: order.orderId,
        weightInKilo: newCostLineItem.weight.toDouble());
    return res;
  }

  Future<int?> updateCategory(LaundryOrderCostLineItem newCostLineItem) async {
    mezDbgPrint("NEW COST LINE ++++++🥰");
    mezDbgPrint(newCostLineItem.toFirebaseFormat());
    int? res = await update_laundry_order_category(
        cat: newCostLineItem, orderId: order.orderId);

    return res;
  }

  Future<int?> deleteCategory() async {
    if (order.costsByType!.lineItems.length > 1) {
      int? res = await delete_laundry_order_category(
          catId: editableCategory.value!.id);
      return res;
    } else {
      customSnackBar(
        title: "${_i18n()["error"]}",
        subTitle: "${_i18n()["deleteLast"]}",
        backgroundColor: Colors.grey.shade800,
      );
      return null;
    }
  }

  void closeEditMode() {
    editableCategory.value = null;
    selectedCategory.value = null;
    itemsWeightController.clear();
  }

// Order status change methods
  Future<ServerResponse> addReview({
    required int orderId,
    required int serviceId,
    required String comment,
    required cModels.OrderType orderType,
    required num rate,
  }) async {
    final HttpsCallable cancelOrder =
        FirebaseFunctions.instance.httpsCallable('restaurant-addReview');
    try {
      final HttpsCallableResult<dynamic> response =
          await cancelOrder.call(<String, dynamic>{
        "orderId": orderId,
        "serviceProviderId": serviceId,
        "rating": rate,
        "comment": comment,
        "orderType": orderType.toFirebaseFormatString(),
      });
      mezDbgPrint(response.toString());
      print(response.data);
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<void> cancelOrder() async {
    try {
      cModels.ChangeLaundryStatusResponse res =
          await CloudFunctions.laundry3_cancelFromAdmin(orderId: order.orderId);
      showSavedSnackBar(
          title: "Cancelled", subtitle: "Order cancelled successfuly");
      if (res.success == false) {
        mezDbgPrint(res.error);
        showErrorSnackBar(errorText: res.error.toString());
      }
    } on FirebaseFunctionsException catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
      showErrorSnackBar(errorText: e.message.toString());
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  void dispose() {
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    _order.close();
  }

  void setCategory(LaundryCostLineItem newValue) {
    selectedCategory.value = newValue;
  }

  // delete item

// first  function that get's triggred when clicking save/edit items weight , works as wrapper of sub functions
  Future<void> saveItemsWeight() async {
    if (selectedCategory.value == null) {
      handlingNoCategoryError();
    } else if (num.tryParse(itemsWeightController.text) == null) {
      handlingWeightNotValid();
    } else {
      await handlingNewOrderWeight();
    }
  }

// handling when the weight and category is well formated and go throught the process of editing or adding new items weight
  Future<void> handlingNewOrderWeight() async {
    LaundryOrderCostLineItem newCostLineItem = _constructCategory();

    final LaundryOrderCostLineItem? _tempCatgeory = order.costsByType?.lineItems
        .firstWhereOrNull((LaundryOrderCostLineItem element) =>
            element.name.getTranslation(userLanguage) ==
            newCostLineItem.name.getTranslation(userLanguage));
    if (_tempCatgeory != null && !isEditingCategory) {
      handlingCategroryAlreadySelected();
    } else if (_tempCatgeory != null &&
        isEditingCategory &&
        _tempCatgeory.name != editableCategory.value!.name) {
      handlingCategroryAlreadySelected();
    } else {
      await settingNewOrderWeight(newCostLineItem);
    }
  }

  LaundryOrderCostLineItem _constructCategory() {
    final LaundryOrderCostLineItem newCostLineItem = LaundryOrderCostLineItem(
        id: isEditingCategory
            ? editableCategory.value!.id
            : selectedCategory.value!.id,
        weight: num.parse(itemsWeightController.text),
        name: selectedCategory.value!.name,
        cost: selectedCategory.value!.cost);
    return newCostLineItem;
  }

// final function that will trigger the order controller with setting the final order cost items
  Future<void> settingNewOrderWeight(
      LaundryOrderCostLineItem newCostLineItem) async {
    int? res;
    if (isEditingCategory) {
      res = await update_laundry_order_category(
          cat: newCostLineItem, orderId: order.orderId);
    } else {
      res = await add_laundry_order_category(
          categoryId: newCostLineItem.id,
          orderId: order.orderId,
          weightInKilo: newCostLineItem.weight.toDouble());
    }
    if (res != null) {
      closeEditMode();
      await MezRouter.back();
    }
  }

// Showing snackbar saying that the this category already selected
  void handlingCategroryAlreadySelected() {
    customSnackBar(
      title: "${_i18n()["error"]}",
      subTitle: "${_i18n()["categoryExistError"]}",
      backgroundColor: Colors.grey.shade800,
      padding: EdgeInsets.all(16),
    );
  }

// Showing snackbar saying that the order weight is not valid
  void handlingWeightNotValid() {
    customSnackBar(
      title: "${_i18n()["error"]}",
      subTitle: "${_i18n()["itemsWeightError"]}",
      backgroundColor: Colors.grey.shade800,
      padding: EdgeInsets.all(16),
    );
  }

// showing snackbar saying that no category is selected
  void handlingNoCategoryError() {
    customSnackBar(
      title: "${_i18n()["error"]}",
      subTitle: "${_i18n()["categoryError"]}",
      backgroundColor: Colors.grey.shade800,
      padding: EdgeInsets.all(16),
    );
  }

  Future<void> setLaundryEstTime(DateTime value) async {
    try {
      await set_laundry_est_ready_time(
          orderId: order.orderId,
          deliveryOrderId: order.deliveryOrderId,
          time: value);
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  Future<void> sertOrderReady() async {
    try {
      cModels.ChangeLaundryStatusResponse res =
          await CloudFunctions.laundry3_readyForDeliveryOrder(
              orderId: _order.value!.orderId);
      if (res.success == false) {
        mezDbgPrint(res.error);
        showErrorSnackBar(errorText: res.error.toString());
      }
    } on FirebaseFunctionsException catch (e, stk) {
      showErrorSnackBar(errorText: e.message.toString());
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } catch (e, stk) {
      showErrorSnackBar();
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  void clearNotifications(int orderId) {
    Get.find<ForegroundNotificationsController>().clearAllOrderNotifications(
        orderType: cModels.OrderType.Courier, orderId: orderId);
  }
}
