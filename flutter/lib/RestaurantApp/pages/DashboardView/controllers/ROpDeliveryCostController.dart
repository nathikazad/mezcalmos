import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/graphql/delivery_cost/hsDeliveryCost.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';

class ROpDeliveryCostController {
  ROpEditInfoController editInfoController;
  ROpDeliveryCostController({required this.editInfoController});
  // text inputs //
  TextEditingController freeKmRange = TextEditingController();
  TextEditingController minCost = TextEditingController();
  TextEditingController costPerKm = TextEditingController();
  TextEditingController distancePreview = TextEditingController();

  // obs //
  Rxn<DeliveryCost> deliveryCost = Rxn();
  RxBool isEditing = RxBool(false);
  RxnNum previewCost = RxnNum();

  // inti //
  Future<void> init() async {
    try {
      await fetchDeliveryCost();
    } on Exception catch (e, stk) {
      // TODO
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  Future<void> fetchDeliveryCost() async {
    deliveryCost.value = await get_delivery_cost(
        serviceProviderId: editInfoController.restaurantId, withCache: false);
    if (deliveryCost.value != null) {
      isEditing.value = true;
      freeKmRange.text = deliveryCost.value!.freeDeliveryKmRange.toString();
      minCost.text = deliveryCost.value!.minimumCost.toString();
      costPerKm.text = deliveryCost.value!.costPerKm.toString();
    }
  }

  Future<bool?> saveDeliveryCost() async {
    final bool? resp =
        isEditing.isTrue ? await _editDeliveryCost() : await _addDeliveryCost();
    return resp;
  }

  DeliveryCost _constructDeliveryCost() {
    return DeliveryCost(
        id: null,
        serviceProviderType: OrderType.Restaurant,
        serviceProviderId: editInfoController.restaurantId,
        minimumCost: double.parse(minCost.text),
        costPerKm: double.parse(costPerKm.text));
  }

  Future<bool?> _addDeliveryCost() async {
    try {
      final int? res =
          await add_delivery_cost(deliveryCost: _constructDeliveryCost());
      return res != null;
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    return null;
  }

  Future<bool?> _editDeliveryCost() async {
    try {
      final bool? res = await update_delivery_cost(
          deliveryCostId: deliveryCost.value!.id!,
          deliveryCost: _constructDeliveryCost());
      if (res == true) {}
      return res == true;
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    return null;
  }

  void calculatePreview() {
    final double dist = double.parse(distancePreview.text);
    final double kmCost = double.parse(costPerKm.text);
    final double min = double.parse(costPerKm.text);
    final double cost = dist * kmCost;
    previewCost.value = cost > min ? cost : min;
  }

  bool get canCalculate {
    return double.tryParse(costPerKm.text) != null &&
        double.tryParse(minCost.text) != null &&
        double.tryParse(costPerKm.text) != null;
  }

  void dispose() {
    costPerKm.clear();
    minCost.clear();
    freeKmRange.clear();
    distancePreview.clear();
    previewCost.close();
    deliveryCost.close();
  }
}
