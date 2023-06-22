import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/controllers/BusinessDetailsController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/LanguagesTabsController.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/RentalHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

typedef OfferingPricesMap = Map<TimeUnit, TextEditingController>;

class BsHomeRentalViewController {
  // instances //

  LanguageTabsController languageTabsController = LanguageTabsController();

  bool firstFormValid = false;
  bool secondFormValid = false;
  BusinessItemDetailsController detailsController =
      BusinessItemDetailsController();
  TextEditingController bedroomsController = TextEditingController();
  TextEditingController bathroomsController = TextEditingController();
  TextEditingController areaController = TextEditingController();

  // vars //
  int? _homeRentalId;
  bool shouldRefetch = false;
  // state variables //
  Rxn<Home> _rental = Rxn<Home>();
  Rxn<Location> homeLocation = Rxn<Location>();
  Rxn<HomeCategory1> homeType = Rxn<HomeCategory1>();
  Rxn<String> petFriendly = Rxn<String>();
  // getters //
  Home? get rental => _rental.value;
  bool get isEditing => _rental.value != null;

  RxList<Map<String, dynamic>> additionalRooms = RxList();
  Rxn<RoomType> roomType = Rxn<RoomType>();

  List<TimeUnit> get _possibleTimeUnits => List.unmodifiable([
        // TimeUnit.PerHour,
        TimeUnit.PerDay,
        TimeUnit.PerWeek,
        TimeUnit.PerMonth,
      ]);
  List<TimeUnit> get avalbleUnits => _possibleTimeUnits
      .where((TimeUnit element) =>
          detailsController.priceTimeUnitMap.keys.contains(element) == false)
      .toList();
  ServiceProviderLanguage? get languages => languageTabsController.language;
  bool get hasSecondaryLang => languages?.secondary != null;
  bool get hasData {
    if (_homeRentalId != null) {
      return _rental.value != null &&
          languageTabsController.tabController != null;
    } else
      return languageTabsController.tabController != null;
  }

  Future<void> init(
      {required TickerProvider thickerProvider,
      required int detailsId,
      int? homeRentalId,
      required int businessId}) async {
    _homeRentalId = homeRentalId;
    await languageTabsController.init(
        vsync: thickerProvider, detailsId: detailsId);
    detailsController.initDetails(
        businessId: businessId,
        language: languages!,
        businessDetailsId: detailsId);
    detailsController.addPriceTimeUnit(timeUnit: avalbleUnits.first);
    if (homeRentalId != null) {
      await initEditMode(id: homeRentalId);
    }
  }

  Future<void> initEditMode({required int id}) async {
    _rental.value = await get_home_by_id(id: id, withCache: false);
    mezDbgPrint(
        "rental id : $id home type ============>>> ${rental!.category1}");
    if (rental != null) {
      detailsController.clearPrices();
      await detailsController.initEditMode(
          itemDetailsId: rental!.details.id.toInt());
      bedroomsController.text = rental!.bedrooms.toString();
      bathroomsController.text = rental!.bathrooms.toString();
      areaController.text = rental!.details.additionalParameters?["area"]
              .toString()
              .replaceAll("sq ft", "")
              .trim() ??
          "";
      petFriendly.value = rental!.details.additionalParameters?["petFriendly"];
      homeLocation.value = rental!.gpsLocation;
      homeType.value = rental!.category1;
      final String? roomType1 =
          rental!.details.additionalParameters?["roomType1"];
      roomType.value = roomType1?.toRoomType();
      additionalRooms.value = rental!
              .details.additionalParameters?["additionalRooms"]
              ?.map<Map<String, dynamic>>(
            (dynamic e) {
              final BusinessItemDetailsController ctrl =
                  BusinessItemDetailsController();
              ctrl.constructNewRoomsCost(
                  constructBusinessServiceCost(e["cost"]));
              return {
                "roomType": e["roomType"],
                "controller": ctrl,
              };
            },
          )?.toList() as List<Map<String, dynamic>>? ??
          [];
    }
  }

  void changeHomeType(HomeCategory1 newHomeType) {
    homeType.value = newHomeType;
  }

  /// This checks the avaiable price units inside the new rooms on basis of ctrl.
  List<TimeUnit> newRoomAvaiableUnits(BusinessItemDetailsController ctrl) {
    return _possibleTimeUnits
        .where((TimeUnit element) =>
            ctrl.priceTimeUnitMap.keys.contains(element) == false)
        .toList();
  }

  /// This adds new room with the new [BusinessItemDetailsController] ctrl
  /// Coz using this we can use the [BsOpOfferingPricesList]
  void addNewRoom() {
    final BusinessItemDetailsController ctrl = BusinessItemDetailsController();
    ctrl.addPriceTimeUnit(timeUnit: newRoomAvaiableUnits(ctrl).first);
    additionalRooms.add({
      "roomType": RoomType.SingleBed.toFirebaseFormatString(),
      "controller": ctrl,
    });
  }

  void deleteNewRoom(int index) {
    additionalRooms.removeAt(index);
  }

  Future<void> saveItemDetails() async {
    await detailsController.updateItemDetails();
  }

  Future<Home> _constructRentalWithDetails() async {
    final BusinessItemDetails details =
        await detailsController.contructDetails();
    details.additionalParameters = {
      "area": areaController.text.trim() + " sq ft",
      "petFriendly": petFriendly.value,
    };
    final Home rental = Home(
      availableFor: HomeAvailabilityOption.Rent,
      location: HomeLocation(
          name: homeLocation.value!.address, location: homeLocation.value!),
      category1: homeType.value!,
      gpsLocation: homeLocation.value,
      details: details,
      bathrooms: int.tryParse(bathroomsController.text),
      bedrooms: int.tryParse(bedroomsController.text),
    );
    return rental;
  }

  Home _constructRental() {
    final Home rental = Home(
     
      location: HomeLocation(
        name: homeLocation.value!.address,
        location: homeLocation.value!,
      ),
      category1: homeType.value!,
      availableFor: HomeAvailabilityOption.Rent,
      gpsLocation: homeLocation.value,
      bathrooms: int.tryParse(bathroomsController.text),
      bedrooms: int.tryParse(bedroomsController.text),
      details: detailsController.details!,
    );
    return rental;
  }

  Future<void> save() async {
    if (languageTabsController.validate()) {
      if (isEditing) {
        try {
          await saveItemDetails();
          _rental.value = await update_business_home_rental(
              id: rental!.id!.toInt(), rental: _constructRental());
          await update_item_additional_params(
            id: rental!.details.id.toInt(),
            additionalParams: {
              "area": areaController.text.trim() + " sq ft",
              "petFriendly": petFriendly.value,
              "roomType1": roomType.value?.toFirebaseFormatString(),
              "additionalRooms": [
                for (final Map<String, dynamic> room in additionalRooms)
                  {
                    "roomType": room["roomType"],
                    "cost": room["controller"].priceTimeUnitMap.value.map(
                        (TimeUnit key, TextEditingController value) => MapEntry(
                            key.toFirebaseFormatString(),
                            double.parse(value.text))),
                  },
              ],
            },
          );
          showSavedSnackBar();
          shouldRefetch = true;
        } catch (e, stk) {
          mezDbgPrint(
              " 🛑 ${rental?.id?.toInt()}  OperationException : ${e.toString()}");
          mezDbgPrint(stk);
          showErrorSnackBar();
        }
        shouldRefetch = true;
      } else {
        Home _rental = await _constructRentalWithDetails();
        await createItem(_rental);
      }
    }
  }

  void dispose() {
    languageTabsController.dispose();
  }

  Future<void> createItem(Home rental) async {
    mezDbgPrint(
        "Create rental with this payload : ${rental.toFirebaseFormattedJson()}");
    try {
      int? res = await add_one_home_rental(rental: rental);

      if (res != null) {
        showAddedSnackBar();
        shouldRefetch = true;
        detailsController.clearImages();
        await initEditMode(id: res);
      }
    } on OperationException catch (e) {
      mezDbgPrint(" 🛑  OperationException : ${e.graphqlErrors[0].message}");
    }
  }

  Future<void> deleteOffer() async {
    try {
      await delete_busines_rental(rentalId: rental!.id!.toInt());
      shouldRefetch = true;
    } catch (e, stk) {
      showErrorSnackBar();
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }
}
