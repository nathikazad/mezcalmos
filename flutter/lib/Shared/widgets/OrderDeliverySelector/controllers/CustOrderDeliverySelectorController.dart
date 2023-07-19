import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Courrier/CustCourierServiceView/CustCourierServiceView.dart';
import 'package:mezcalmos/Shared/graphql/delivery_company/hsDeliveryCompany.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';

class CustOrderDeliverySelectorController {
  RxList<DeliveryCompany> deliveryCompanies = RxList.empty();
  RxList<int> selectedCompanies = RxList.empty();
  RxBool isFetchingCompanies = RxBool(false);

  double minDeliveryPrice = 40;

  double maxDeliveryPrice = 200;

  RxDouble estDeliveryPrice = RxDouble(40);
  num? distance;
  late ValueChanged<List<int>> _onSelectionUpdate;
  late ValueChanged<double> _onEstDeliveryPriceChange;

  void init(
      {num? distance,
      required ValueChanged<List<int>> onSelectionUpdate,
      required ValueChanged<double> onEstDeliveryPriceChange}) {
    this.distance = distance;
    _onSelectionUpdate = onSelectionUpdate;
    _onEstDeliveryPriceChange = onEstDeliveryPriceChange;
    mezDbgPrint("Distance $distance");

    _fetchCompanies();
  }

  Future<void> _fetchCompanies() async {
    try {
      isFetchingCompanies.value = true;
      List<DeliveryCompany>? _companies = await get_dv_companies(isOpen: true);
      if (_companies != null) {
        deliveryCompanies.clear();
        selectedCompanies.clear();
        deliveryCompanies.addAll(_companies);
        selectedCompanies.value = deliveryCompanies
            .map((DeliveryCompany element) => element.info.hasuraId)
            .toList();
        _onSelectionUpdate.call(selectedCompanies);
        CalculateEstimatedCost();
      }
    } catch (e) {
      showErrorSnackBar();
      mezlog("🔴 error =====>$e");

      // TODO
    } finally {
      isFetchingCompanies.value = false;
    }
  }

  void selectCompany({required int id}) {
    if (selectedCompanies.contains(id)) {
      selectedCompanies.remove(id);
    } else {
      selectedCompanies.add(id);
    }

    _onSelectionUpdate.call(selectedCompanies);
  }

  void navigateToCourierServiceView(int id) {
    // ignore: unawaited_futures
    CustCourierServiceView.navigate(
      companyId: id,
    );
  }

  void CalculateEstimatedCost() {
    double _maxDeliveryPrice = 0;

    if (distance == null) {
      mezDbgPrint(
          "Distance is null. Skipping calculating min and max costs 🥲");
      return;
    }

    for (DeliveryCompany company in deliveryCompanies) {
      if (company.deliveryCost != null) {
        final double deliveryCost = company.deliveryCost!.costPerKm * distance!;
        mezDbgPrint(
            "🛵 Delivery cost from ${company.info.hasuraId} => $deliveryCost");

        if (deliveryCost > _maxDeliveryPrice &&
            deliveryCost > company.deliveryCost!.minimumCost) {
          mezDbgPrint(" ✅ Setting est cost to => $deliveryCost");
          _maxDeliveryPrice = deliveryCost;
        } else if (company.deliveryCost!.minimumCost > _maxDeliveryPrice) {
          mezDbgPrint(
              "👋 Delivery cost $deliveryCost is less than company min cost: ${company.deliveryCost!.minimumCost}. Setting min cost...");
          _maxDeliveryPrice = company.deliveryCost!.minimumCost;
        }
      } else {
        mezDbgPrint("Company ${company.info.hasuraId} delivery costs is null");
      }
    }

    if (_maxDeliveryPrice == 0) {
      mezDbgPrint("🔴 Max Delivery Cost is 0 ===> Setting to 40");
      _maxDeliveryPrice = 40;
    }
    if (_maxDeliveryPrice > 200 || _maxDeliveryPrice < 40) {
      mezDbgPrint(
          "Calculated delivery price is out of range 40-200 => $_maxDeliveryPrice, setting to 40...");
      _maxDeliveryPrice = 40;
    }

    estDeliveryPrice.value = _maxDeliveryPrice;
    _onEstDeliveryPriceChange.call(estDeliveryPrice.value);
  }
}
