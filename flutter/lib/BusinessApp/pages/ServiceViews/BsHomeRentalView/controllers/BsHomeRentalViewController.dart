import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/controllers/BusinessDetailsController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/controllers/ServicesViewsController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class BsHomeRentalViewController extends ServicesViewsController {
  // instances //
  BusinessItemDetailsController detailsController =
      BusinessItemDetailsController();
  // state variables //
  Rxn<Rental> _rental = Rxn<Rental>();
  Rental? get rental => _rental.value;
  bool get isEditing => _rental.value != null;

  List<TimeUnit> get timeUnits => List.unmodifiable([
        TimeUnit.PerHour,
        TimeUnit.PerDay,
        TimeUnit.PerWeek,
        TimeUnit.PerMonth,
      ]);
  List<TimeUnit> get units => timeUnits
      .where((TimeUnit element) =>
          detailsController.priceTimeUnitMap.values.contains(element) == false)
      .toList();

  @override
  Future<void> initEditMode({required int id}) async {
    _rental.value = await get_rental_by_id(id: id, withCache: false);
    mezDbgPrint("rental id : $id");
    if (rental != null) {
      await detailsController.initEditMode(
          detalsId: rental!.details.id.toInt());
    }
  }

  @override
  Future<void> saveItemDetails() async {
    await detailsController.updateItemDetails();
  }

  Future<Rental> _constructRental() async {
    BusinessItemDetails details = await detailsController.contructDetails();
    Rental rental = Rental(
      homeType: "apartment",
      category1: RentalCategory1.Home,
      gpsLocation: Location(address: "adress", lat: 15.855, lng: -97.06020),
      details: details,
    );
    return rental;
  }

  @override
  Future<void> save() async {
    if (formKey.currentState?.validate() == true) {
      if (isEditing) {
        await saveItemDetails();
        shouldRefetch = true;
      } else {
        Rental _rental = await _constructRental();
        await createItem(_rental);
      }
    }
  }

  @override
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
