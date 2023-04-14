import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/controller/AssetController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/SubServiceController.dart';

class OtherRentalController {
  RxList<RentalWithBusiness> homeRentalData = <RentalWithBusiness>[].obs;
  RxList<MinimalBusiness> agencyRentalData = <MinimalBusiness>[].obs;
  late Rx<RentalCategory1> category1;
  RxMap<RentalCategory2, bool> category2 = {
    RentalCategory2.Motorcycle: true,
    RentalCategory2.Car: true,
  }.obs;
  RxString filterString = "All".obs;

  OtherRentalController({
    required RentalViewEnum viewName,
  }) {
    mezDbgPrint("INSIDE $viewName");
    if (viewName == RentalViewEnum.Vehicle) {
      category1 = RentalCategory1.Vehicle.obs;
      category2.value = {
        RentalCategory2.Motorcycle: true,
        RentalCategory2.Car: true,
      }.obs;
      filterString.value = "All";
    } else {
      category1 = RentalCategory1.Surf.obs;
      category2.value = {
        RentalCategory2.Motorcycle: false,
        RentalCategory2.Car: false,
      }.obs;
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

  void changeVehicleFilter({
    required Map<RentalCategory2, bool> value,
  }) {
    category2.value = value;
    if (!value.containsValue(false)) {
      filterString.value = "All";
    } else {
      filterString.value = value.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key.name)
          .toList()
          .join("");
    }

    fetchOtherRentals(filterRequest: true);
  }

  Future<void> fetchOtherRentals({bool filterRequest = false}) async {
    if (_fetchingAssetData) {
      return;
    }
    try {
      _fetchingAssetData = true;
      // resetting offset coz of filtering
      if (filterRequest) {
        _fetchAssetOffset = 0;
      }
      final List<RentalWithBusiness> newData = await get_rental_by_category(
        category1: category1.value,
        categories2: category2.entries
            .where((entry) => entry.value)
            .map((entry) => entry.key)
            .toList(),
        distance: 100000,
        fromLocation: Location(lat: 15.8.toDouble(), lng: -97.toDouble()),
        withCache: true,
        limit: _fetchAssetSize,
        offset: _fetchAssetOffset,
      );
      mezDbgPrint("get_rental_by_category ${newData.length}");
      if (filterRequest) {
        // not adding data into list just placing all the new data only
        homeRentalData.value = newData;
      } else {
        homeRentalData.value += newData;
      }
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
      final List<MinimalBusiness> newData =
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
