import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/graphql/offer/hsOffer.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';

class CustDealsViewController {
  // instances //
  AuthController _authController = Get.find<AuthController>();
  Location? _fromLocation;
  // state vars //
  RxList<Offer> _offers = RxList<Offer>.empty();
  RxBool _showSubscribedOnly = false.obs;

  ScrollController _promoScrollController = ScrollController();
  final int promoFetchSize = 10;
  int _promoCurrentOffset = 0;
  bool _promoFetchingData = false;
  bool _promoReachedEndOfData = false;
  // getters //
  List<Offer> get offers => _offers.value;
  bool get showSubscribedOnly => _showSubscribedOnly.value;
  ScrollController get promoScrollController => _promoScrollController;
  bool get isFetching => _promoFetchingData;
  RxBool isInitalized = RxBool(false);

  // methods //

  Future<void> init() async {
    _promoScrollController.onBottomReach(
      () {
        showSubscribedOnly ? _fetchPromotions() : _fetchAllPromotions();
      },
      sensitivity: 200,
    );
    await _fetchPromos();
    isInitalized.value = true;
  }

  Future<void> _fetchPromos() async {
    showSubscribedOnly ? await _fetchPromotions() : await _fetchAllPromotions();
  }

  void dispose() {}

  Future<void> _fetchPromotions() async {
    if (_promoFetchingData || _promoReachedEndOfData) {
      return;
    }
    try {
      _promoFetchingData = true;
      final List<Offer> newData = await fetch_subscribed_promotions(
        offset: _promoCurrentOffset,
        limit: promoFetchSize,
        withCache: false,
        customerId: _authController.hasuraUserId!,
      );
      print(newData.length);
      _offers.value += newData;
      if (newData.length == 0) {
        _promoReachedEndOfData = true;
      }
      _promoCurrentOffset += promoFetchSize;
    } finally {
      _promoFetchingData = false;
    }

    // _promotions.refresh();
  }

  Future<void> _fetchAllPromotions() async {
    if (_promoFetchingData || _promoReachedEndOfData) {
      return;
    }
    try {
      _promoFetchingData = true;
      final locPkg.LocationData location =
          await Get.find<LocationController>().getCurrentLocation();
      if (location.latitude != null && location.longitude != null) {
        _fromLocation = Location(
            lat: location.latitude!, lng: location.longitude!, address: "");
      }
      final List<Offer> newData = await fetch_all_promotions_within_distance(
        offset: _promoCurrentOffset,
        limit: promoFetchSize,
        distance: getFetchDistance,
        fromLocation: puertoEscondidoLocation,
      );
      print(newData.length);
      _offers.value += newData;
      if (newData.length == 0) {
        _promoReachedEndOfData = true;
      }
      _promoCurrentOffset += promoFetchSize;
    } finally {
      _promoFetchingData = false;
    }

    // _promotions.refresh();
  }

  void setPromotionSwitch(bool value) {
    _showSubscribedOnly.value = value;
    _offers.clear();
    _promoCurrentOffset = 0;
    _promoFetchingData = false;
    _promoReachedEndOfData = false;
    _fetchPromos();
  }
}
