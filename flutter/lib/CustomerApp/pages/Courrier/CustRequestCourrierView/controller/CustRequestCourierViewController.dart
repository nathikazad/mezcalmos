import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/CourierItem.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModel;
import 'package:mezcalmos/Shared/graphql/delivery_company/hsDeliveryCompany.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

class CustRequestCourierViewController {
  PageController pageController = PageController(initialPage: 0);

  RxList<CourierItem> items = RxList.empty();
  RxList<TextEditingController> itemsNames = RxList.empty();
  RxList<TextEditingController> itemsNotes = RxList.empty();
  RxList<TextEditingController> itemsEstCosts = RxList.empty();
  Rxn<MezLocation> fromLoc = Rxn();
  Rxn<MezLocation> toLoc = Rxn();
  Rxn<DateTime> deliveryTime = Rxn();
  Rxn<DeliveryCompany> company = Rxn();
  RxInt currentPage = RxInt(0);
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  late int courierId;
  Future<void> init({required int courierId}) async {
    this.courierId = courierId;
    company.value = await get_delivery_company(companyId: courierId);
    // unawaited(get_delivery_company(companyId: courierId)
    //     .then((DeliveryCompany? value) => company.value = value));

    addNewEmptyItem();
  }

  void addNewEmptyItem() {
    items.add(CourierItem(name: "", estCost: 0));
    itemsNames.add(TextEditingController());
    itemsNotes.add(TextEditingController());
    itemsEstCosts.add(TextEditingController());
  }

  void removeItem(int index) {
    items.removeAt(index);
    itemsNames.removeAt(index);
    itemsEstCosts.removeAt(index);
    itemsNotes.removeAt(index);
  }

  void handleBack() {
    if (currentPage == 0) {
      MezRouter.back();
    } else {
      pageController
          .animateToPage(currentPage.value - 1,
              duration: Duration(milliseconds: 500), curve: Curves.easeInOut)
          .whenComplete(() => currentPage.value = pageController.page!.toInt());
    }
  }

  Future<num?> handleNext() async {
    if (currentPage == 0) {
      if (fromKey.currentState?.validate() == true) {
        unawaited(pageController
            .animateToPage(currentPage.value + 1,
                duration: Duration(milliseconds: 500), curve: Curves.easeInOut)
            .whenComplete(
                () => currentPage.value = pageController.page!.toInt()));
      }
    } else {
      // call cloud func
      try {
        cModel.CreateCourierResponse res =
            await CloudFunctions.delivery2_createCourierOrder(
                toLocation: cModel.Location(
                    lat: toLoc.value!.position.latitude!,
                    lng: toLoc.value!.position.latitude!,
                    address: toLoc.value!.address),
                items: items
                    .map((CourierItem element) => cModel.CourierItem(
                        name: element.name,
                        estimatedCost: element.estCost,
                        notes: element.notes))
                    .toList(),
                deliveryCompanyId: company.value!.info.hasuraId,
                deliveryCost: 50,
                customerAppType: cModel.CustomerAppType.Native,
                tripDistance: 0,
                tripDuration: 0,
                tripPolyline: "tripPolyline");
        return res.orderId;
      } on FirebaseFunctionsException catch (e, stk) {
        showErrorSnackBar(errorText: e.message.toString());
        mezDbgPrint(e);
        mezDbgPrint(stk);
      }
    }
    return null;
  }
}
