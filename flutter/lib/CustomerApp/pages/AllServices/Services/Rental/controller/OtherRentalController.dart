import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/controller/AssetController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/SubServiceController.dart';

class OtherRentalController {
  RxList<Rental> homeRentalData = <Rental>[].obs;
  RxList<BusinessCardView> agencyRentalData = <BusinessCardView>[].obs;
  late Rx<RentalCategory1> category1;
  RxList<RentalCategory2> category2 = <RentalCategory2>[].obs;

  OtherRentalController({
    required RentalViewEnum viewName,
  }) {
    mezDbgPrint("INSIDE $viewName");
    if (viewName == RentalViewEnum.Vehicle) {
      category1 = RentalCategory1.Vehicle.obs;
      category2.value = <RentalCategory2>[
        RentalCategory2.Car,
        RentalCategory2.Motorcycle
      ];
    } else {
      category1 = RentalCategory1.Surf.obs;
      category2.value = <RentalCategory2>[];
    }
  }

  ScrollController get assetScrollController => _assetScrollController;
  ScrollController _assetScrollController = ScrollController();
  bool _fetchingAssetData = false;
  int _fetchAssetSize = 10;
  int _fetchAssetOffset = 0;

  ScrollController get agencyScrollController => _assetScrollController;
  ScrollController _agencyScrollController = ScrollController();
  bool _fetchingAgencyData = false;
  int _fetchAgencySize = 10;
  int _fetchAgencyOffset = 0;

  void init() {
    initOtherRentals();
  }

  Future<void> initOtherRentals() async {
    await fetchOtherRentals();
    await fetchOtherAgency();
    
    // TODO : scroll on different tabs

    _assetScrollController.onBottomReach(fetchOtherRentals, sensitivity: 200);

    _agencyScrollController.onBottomReach(fetchOtherAgency, sensitivity: 200);
  }

  Future<void> fetchOtherRentals() async {
    if (_fetchingAssetData) {
      return;
    }
    try {
      _fetchingAssetData = true;
      final List<Rental> newData = await get_rental_by_category(
        category1: category1.value,
        categories2: category2,
        distance: 100000,
        fromLocation: Location(lat: 15.8.toDouble(), lng: -97.toDouble()),
        withCache: true,
        limit: _fetchAssetSize,
        offset: _fetchAssetOffset,
      );
      mezDbgPrint("get_rental_by_category ${newData.length}");
      homeRentalData.value += newData;
      _fetchAssetOffset += _fetchAssetSize;
    } finally {
      _fetchingAssetData = false;
    }
  }

  Future<void> fetchOtherAgency() async {
    if (_fetchingAgencyData) {
      return;
    }
    try {
      _fetchingAgencyData = true;
      final List<BusinessCardView> newData =
          await get_business_by_rental_category1(
        category1: category1.value,
        distance: 100000,
        withCache: true,
        fromLocation: Location(lat: 15.8.toDouble(), lng: -97.toDouble()),
        limit: _fetchAgencySize,
        offset: _fetchAgencyOffset,
      );
      mezDbgPrint("get_business_by_rental_category1 ${newData.length}");
      agencyRentalData.value += newData;
      _fetchAgencyOffset += _fetchAgencySize;
    } finally {
      _fetchingAgencyData = false;
    }
  }

  void dispose() {
    // homeRentalData.close();
  }
}
