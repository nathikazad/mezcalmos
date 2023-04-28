import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/BusinessApp/controllers/BusinessOpAuthController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/controllers/ServicesViewsController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class BsHomeRentalViewController extends ServicesViewsController {
  @override
  String get imagesUploadFolder => "Business/HomeRentals/Images";

  @override
  List<TimeUnit> get timeUnits => List.unmodifiable([
        TimeUnit.PerHour,
        TimeUnit.PerDay,
        TimeUnit.PerWeek,
        TimeUnit.PerMonth,
      ]);

  @override
  Future<void> init() async {
    //  mezDbgPrint("INIT home rental view");
  }

  @override
  Future<void> fetchData() async {}
  @override
  Future<void> save() async {
    if (formKey.currentState?.validate() == true) {
      final List<String> _imagesUrls = await uploadItemsImages();

      Rental rental = Rental(
          homeType: "apartment",
          category1: RentalCategory1.Home,
          gpsLocation: Location(address: "adress", lat: 15.855, lng: -97.06020),
          details: BusinessItemDetails(
              id: 0,
              name: {
                Language.EN: nameController.text,
                Language.ES: nameController.text
              },
              description: {
                Language.EN: descriptionController.text,
                Language.ES: descriptionController.text
              },
              image: _imagesUrls,
              businessId: Get.find<BusinessOpAuthController>().companyId!,
              available: isAvailable.value,
              cost: priceTimeUnitMap.value.map(
                  (TextEditingController key, TimeUnit value) =>
                      MapEntry(value, double.parse(key.text)))));
      mezDbgPrint(
          "Create rental with this payload : ${rental.toFirebaseFormattedJson()}");
      try {
        int? res = await add_one_home_rental(rental: rental);
        if (res != null) {
          showSavedSnackBar();
          shouldRefetch = true;
        }
      } on OperationException catch (e) {
        mezDbgPrint(" 🛑  OperationException : ${e.graphqlErrors[0].message}");
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
