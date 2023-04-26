import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/graphql/business_product/hsBusinessProduct.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';

class CustLocallyMadeListViewController {
  // variables //
  RxList<ProductCard> _products = <ProductCard>[].obs;
  RxList<BusinessCard> _businesses = <BusinessCard>[].obs;
  // RxList<BusinessCard> _filtredBusiness = <BusinessCard>[].obs;

  RxBool _isLoading = false.obs;
  RxBool showBusiness = false.obs;
  Location? _fromLocation;
  String searchQuery = "";

  List<ProductCategory1> _filterCategories = <ProductCategory1>[];

  RxList<ProductCategory1> selectedCategories = <ProductCategory1>[].obs;
  RxList<ProductCategory1> previewCategories = <ProductCategory1>[].obs;
  // scroll logic //
  /* SCROLL CONTROLLER */
  ScrollController get scrollController => showBusiness.isTrue
      ? _businessScrollController
      : _productsScrollController;
  ScrollController _productsScrollController = ScrollController();
  ScrollController _businessScrollController = ScrollController();
  int productsFetchSize = 15;
  int _productsCurrentOffset = 0;
  bool _productsFetchingData = false;
  bool _productsReachedEndOfData = false;
  final int businessFetchSize = 3;
  int _businessCurrentOffset = 0;
  bool _businessFetchingData = false;
  bool _businessReachedEndOfData = false;
  /* SCROLL CONTROLLER */
  // scroll logic //

  // getters //
  bool get isLoading => _isLoading.value;
  bool get isFiltering => selectedCategories.length != _filterCategories.length;
  List<ProductCategory1> get filterCategories => _filterCategories;

  List<ProductCard> get products => _products.value;
  List<BusinessCard> get businesses => _businesses.value;

  /// return current view rental category (Home, Surf, etc)
  List<ProductCategory1> get productsCategory => _currentProductCategory;

  late List<ProductCategory1> _currentProductCategory;

// methods //
  Future<void> init({required ProductCategory1 serviceCategory}) async {
    _currentProductCategory = [serviceCategory];

    filterCategories.add(
      serviceCategory,
    );
    selectedCategories.value = List.from(filterCategories);
    previewCategories.value = List.from(filterCategories);

    try {
      _isLoading.value = true;

      locPkg.LocationData location = await locPkg.Location().getLocation();
      if (location.latitude != null && location.longitude != null) {
        _fromLocation = Location(
          lat: location.latitude!,
          lng: location.longitude!,
          address: "",
        );
        await _fetchProducts();
        await _fetchBusinesses();
        _productsScrollController.onBottomReach(_fetchProducts,
            sensitivity: 500);
        _businessScrollController.onBottomReach(_fetchBusinesses,
            sensitivity: 500);
      }
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> _fetchProducts() async {
    if (_productsFetchingData || _productsReachedEndOfData) {
      return;
    }
    try {
      _productsFetchingData = true;
      mezDbgPrint(
          "👋 _fetchRentals called selected categories : $selectedCategories \n ferchSize : $productsFetchSize \n offset: $_productsCurrentOffset");
      List<ProductCard> newList = await get_product_by_category(
        categories1: productsCategory,
        distance: 1000000000000,
        fromLocation: _fromLocation!,
        tags: [],
        // scheduleType: [ScheduleType.Scheduled, ScheduleType.OneTime],
        withCache: false,
        offset: _productsCurrentOffset,
        limit: productsFetchSize,
      );
      _products.value += newList;
      if (newList.length == 0) {
        _productsReachedEndOfData = true;
      }
      _productsCurrentOffset += productsFetchSize;
    } catch (e) {
      mezDbgPrint(e);
    } finally {
      _productsFetchingData = false;
    }
  }

  Future<void> _fetchBusinesses() async {
    // if (_businessFetchingData || _businessReachedEndOfData) {
    //   return;
    // }
    // try {
    //   mezDbgPrint(
    //       "👋 _fetchBusinesses called with ferchSize : $businessFetchSize offset: $_businessCurrentOffset");
    //   _businessFetchingData = true;
    //   List<BusinessCard> newList = await get_business_by_ser_category1(
    //       categories1: [_currentRentalCategory],
    //       distance: 1000000000000,
    //       fromLocation: _fromLocation!,
    //       offset: _businessCurrentOffset,
    //       limit: businessFetchSize,

    //       // scheduleType: [ScheduleType.Scheduled, ScheduleType.OneTime],
    //       withCache: false);
    //   _businesses.value += newList;
    //   if (newList.length == 0) {
    //     _businessReachedEndOfData = true;
    //   }

    //   _businessCurrentOffset += businessFetchSize;
    // } catch (e) {
    //   mezDbgPrint(e);
    // } finally {
    //   _businessFetchingData = false;
    // }
  }

  void filter() {
    selectedCategories.value = List.from(previewCategories);

    _resetRentals();
    _fetchProducts();
  }

  void resetFilter() {
    previewCategories.value = List.from(filterCategories);
    selectedCategories.value = List.from(filterCategories);
    _fetchProducts();
  }

  void switchFilterCategory(bool? value, int index) {
    if (value == true) {
      previewCategories.add(filterCategories[index]);
    } else {
      previewCategories.remove(filterCategories[index]);
    }
  }

  void _resetRentals() {
    _products.clear();
    _productsCurrentOffset = 0;
    _productsReachedEndOfData = false;
  }
}
