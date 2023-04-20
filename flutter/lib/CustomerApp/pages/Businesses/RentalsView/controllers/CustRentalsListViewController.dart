import 'package:get/get.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/CustomerApp/helpers/BusinessListHelper.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class CustRentalsListViewController {
  // variables //
  RxList<RentalCard> _rentals = <RentalCard>[].obs;
  RxList<RentalCard> _filtredRentals = <RentalCard>[].obs;
  RxList<BusinessCard> _businesses = <BusinessCard>[].obs;
  RxList<BusinessCard> _filtredBusiness = <BusinessCard>[].obs;

  RxBool _isLoading = false.obs;
  RxBool showBusiness = false.obs;
  Location? _fromLocation;
  String searchQuery = "";

  List<RentalCategory2> filterCategories = <RentalCategory2>[];

  RxList<RentalCategory2> selectedCategories = <RentalCategory2>[].obs;

  // getters //
  bool get isLoading => _isLoading.value;
  bool get isVehicle => rentalCategory == RentalCategory1.Vehicle;
  bool get showFilter =>
      rentalCategory == RentalCategory1.Vehicle && showBusiness.isFalse;
  List<RentalCard> get rentals => _filtredRentals.value;
  List<BusinessCard> get businesses => _filtredBusiness.value;

  /// return current view rental category (Home, Surf, etc)
  RentalCategory1 get rentalCategory => _currentRentalCategory;
  //
  late RentalCategory1 _currentRentalCategory;

  Future<void> init({required RentalCategory1 rentalCategory}) async {
    _currentRentalCategory = rentalCategory;
    try {
      _isLoading.value = true;
      if (isVehicle) {
        filterCategories.addAll([
          RentalCategory2.Motorcycle,
          RentalCategory2.Car,
          RentalCategory2.Bicycle,
        ]);
        selectedCategories.value = List.from(filterCategories);
      }

      locPkg.LocationData location = await locPkg.Location().getLocation();
      if (location.latitude != null && location.longitude != null) {
        _fromLocation =
            Location(lat: location.latitude!, lng: location.longitude!);
        await _fetchRentals();
        await _fetchBusinesses();
        _filtredBusiness.value.addAll(_businesses.value);
        _filtredRentals.value.addAll(_rentals.value);
      }
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> _fetchRentals() async {
    mezDbgPrint("Getting rentals  =====>${filterCategories.length}");
    _rentals.value.clear();
    _rentals.value = await get_rental_by_category(
        category1: rentalCategory,
        // categories2: isVehicle ? selectedCategories : null,
        distance: 1000000000000,
        fromLocation: _fromLocation!,
        tags: [],
        withCache: false);
    mezDbgPrint(_rentals.value.length);
  }

  Future<void> _fetchBusinesses() async {
    mezDbgPrint("Getting rentals businesses  =====>$_fromLocation");
    _businesses.clear();
    _businesses.value = await get_business_by_rental_category1(
        category1: rentalCategory,
        distance: 1000000000000,
        fromLocation: _fromLocation!,
        withCache: false);
  }

  void filter() {
    // if (showBusiness.isFalse) {
    //   List<RentalCard> newList = new List<RentalCard>.from(_rentals);
    //   newList = newList
    //    //   .searchByName(searchQuery)
    //       .filterByCategory2(selectedCategories);
    //   _filtredRentals.value = newList;
    // } else {
    //   List<BusinessCard> newList = new List<BusinessCard>.from(_businesses);
    //   newList = newList.searchByName(searchQuery);

    //   _filtredBusiness.value = newList;
    // }
  }

  void switchFilterCategory(bool? value, int index) {
    if (value == true) {
      selectedCategories.add(filterCategories[index]);
    } else {
      selectedCategories.remove(filterCategories[index]);
    }
  }
}
