import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class HomeRentalController {
  RxList<HomeRentalWithBusiness> homeRentalData = <HomeRentalWithBusiness>[].obs;
  RxList<BusinessCardView> agencyRentalData = <BusinessCardView>[].obs;

  ScrollController get homeScrollController => _homeScrollController;
  ScrollController _homeScrollController = ScrollController();
  bool _fetchingHomeData = false;
  int _fetchHomeSize = 10;
  int _fetchHomeOffset = 0;

  ScrollController get agencyScrollController => _homeScrollController;
  ScrollController _agencyScrollController = ScrollController();
  bool _fetchingAgencyData = false;
  int _fetchAgencySize = 10;
  int _fetchAgencyOffset = 0;

  void init() {
    initOrders();
  }

  Future<void> initOrders() async {
    await fetchHomeRentals();
    await fetchHomeAgency();

    // TODO : scroll on different tabs

    _homeScrollController.onBottomReach(fetchHomeRentals, sensitivity: 200);

    _agencyScrollController.onBottomReach(fetchHomeAgency, sensitivity: 200);
  }

  Future<void> fetchHomeRentals() async {
    if (_fetchingHomeData) {
      return;
    }
    try {
      _fetchingHomeData = true;
      final List<HomeRentalWithBusiness> newData = await get_home_rentals(
        distance: 100000,
        fromLocation: Location(lat: 15.8.toDouble(), lng: -97.toDouble()),
        withCache: true,
        limit: _fetchHomeSize,
        offset: _fetchHomeOffset,
      );
      mezDbgPrint("get_home_rentals ${newData.length}");
      homeRentalData.value += newData;
      _fetchHomeOffset += _fetchHomeSize;
    } finally {
      _fetchingHomeData = false;
    }
  }

  Future<void> fetchHomeAgency() async {
    if (_fetchingAgencyData) {
      return;
    }
    try {
      _fetchingAgencyData = true;
      final List<BusinessCardView> newData =
          await get_business_by_rental_category1(
        category1: RentalCategory1.Home,
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
