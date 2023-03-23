import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/courier_order/hsCourierOrder.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/queries/hsDleiveryOrderQuerries.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Courier/CourierOrderItem.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';

class DvOrderDetailsViewController {
  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();

  late int orderId;
  Rxn<DeliveryOrder> order = Rxn();
  RxnNum tax = RxnNum();
  final Rxn<File> newBillFile = Rxn();
  final Rxn<String> newBillUrl = Rxn();
  final RxBool billLoading = RxBool(false);
  Rxn<List<CourierOrdeItem>> items = Rxn();
  TextEditingController costText = TextEditingController();
  TextEditingController taxText = TextEditingController();
// getters //

  bool get taxSetted => tax.value != null;
  // methods //
  Future<void> init({required int orderId}) async {
    this.orderId = orderId;
    order.value = await get_driver_order_by_id(orderId: orderId);
    if (order.value != null && order.value!.orderType == OrderType.Courier) {
      unawaited(_fetchOrderItems(orderId));
    }
  }

  Future<void> _fetchOrderItems(int orderId) async {
    items.value =
        await get_courier_order_items(orderId: orderId, withCache: false);
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
    final imPicker.ImageSource? _from = await imagePickerChoiceDialog(context);

    if (_from != null) {
      billLoading.value = true;

      final imPicker.XFile? _res =
          await imagePicker(picker: _imagePicker, source: _from);

      try {
        if (_res != null) {
          newBillFile.value = File(_res.path);
          if (newBillFile.value != null) {
            String imageUrl = await Get.find<AuthController>()
                .uploadImgToFbStorage(
                    imageFile: newBillFile.value!,
                    isCompressed: false,
                    path: "bills/delivery/$orderId");
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
  }
}
