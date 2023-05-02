import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/controllers/BusinessDetailsController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class BsRentalViewController {
  // instances //

  // streams //

  // variables //

  // states variables //

  // methods //

  // instances //
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TabController? tabController;
  BusinessItemDetailsController detailsController =
      BusinessItemDetailsController();
  // vars //
  bool shouldRefetch = false;
  // state variables //
  Rxn<RentalWithBusinessCard> _rental = Rxn<RentalWithBusinessCard>();
  RentalWithBusinessCard? get rental => _rental.value;
  bool get isEditing => _rental.value != null;

  void init({required TickerProvider thickerProvider}) {
    tabController = TabController(length: 2, vsync: thickerProvider);
  }

  Future<void> initEditMode({required int id}) async {
    _rental.value = await get_rental_by_id(id: id, withCache: false);
    mezDbgPrint("service id : $id");
    if (rental != null) {
      await detailsController.initEditMode(
          detalsId: rental!.details.id.toInt());
    }
  }

  Future<void> saveItemDetails() async {
    await detailsController.updateItemDetails();
  }

  void dispose() {
    // TODO: implement dispose
  }

  Future<void> createItem(Rental rental) async {
    mezDbgPrint(
        "Create service with this payload : ${rental.toFirebaseFormattedJson()}");
    try {
      int? res = await add_one_rental(rental: rental);

      if (res != null) {
        showSavedSnackBar();
        shouldRefetch = true;
      }
    } on OperationException catch (e) {
      mezDbgPrint(" 🛑  OperationException : ${e.graphqlErrors[0].message}");
    }
  }
}
