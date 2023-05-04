import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/controllers/BusinessDetailsController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

typedef OfferingPricesMap = Map<TimeUnit, TextEditingController>;

class BsHomeRentalViewController {
  // instances //
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TabController? tabController;
  BusinessItemDetailsController detailsController =
      BusinessItemDetailsController();
  TextEditingController bedroomsController = TextEditingController();
  TextEditingController bathroomsController = TextEditingController();

  // vars //
  bool shouldRefetch = false;
  // state variables //
  Rxn<Rental> _rental = Rxn<Rental>();
  Rxn<Location> homeLocation = Rxn<Location>();
  Rxn<HomeType> homeType = Rxn<HomeType>();
  // getters //
  Rental? get rental => _rental.value;
  bool get isEditing => _rental.value != null;

  List<TimeUnit> get _possibleTimeUnits => List.unmodifiable([
        TimeUnit.PerHour,
        TimeUnit.PerDay,
        TimeUnit.PerWeek,
        TimeUnit.PerMonth,
      ]);
  List<TimeUnit> get avalbleUnits => _possibleTimeUnits
      .where((TimeUnit element) =>
          detailsController.priceTimeUnitMap.keys.contains(element) == false)
      .toList();

  void init({required TickerProvider thickerProvider}) {
    tabController = TabController(length: 2, vsync: thickerProvider);
    detailsController.addPriceTimeUnit(timeUnit: avalbleUnits.first);
  }

  Future<void> initEditMode({required int id}) async {
    _rental.value = await get_rental_by_id(id: id, withCache: false);
    mezDbgPrint(
        "rental id : $id home type ============>>> ${rental!.homeType}");
    if (rental != null) {
      detailsController.clearPrices();
      await detailsController.initEditMode(
          detalsId: rental!.details.id.toInt());
      bedroomsController.text = rental!.bedrooms.toString();
      bathroomsController.text = rental!.bathrooms.toString();
      homeLocation.value = rental!.gpsLocation;
      homeType.value = rental!.homeType;
    }
  }

  Future<void> saveItemDetails() async {
    await detailsController.updateItemDetails();
  }

  Future<Rental> _constructRentalWithDetails() async {
    BusinessItemDetails details = await detailsController.contructDetails();
    Rental rental = Rental(
      homeType: homeType.value,
      category1: RentalCategory1.Home,
      gpsLocation: homeLocation.value,
      details: details,
    );
    return rental;
  }

  Rental _constructRental() {
    Rental rental = Rental(
      homeType: homeType.value,
      category1: RentalCategory1.Home,
      gpsLocation: homeLocation.value,
      bathrooms: int.tryParse(bathroomsController.text),
      bedrooms: int.tryParse(bedroomsController.text),
      details: detailsController.details!,
    );
    return rental;
  }

  Future<void> save() async {
    if (formKey.currentState?.validate() == true) {
      if (isEditing) {
        await saveItemDetails();
        await update_business_home_rental(
            id: rental!.id!.toInt(), rental: _constructRental());
        showSavedSnackBar();
        shouldRefetch = true;
      } else {
        Rental _rental = await _constructRentalWithDetails();
        await createItem(_rental);
      }
    }
  }

  void dispose() {
    // TODO: implement dispose
  }

  Future<void> createItem(Rental rental) async {
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
