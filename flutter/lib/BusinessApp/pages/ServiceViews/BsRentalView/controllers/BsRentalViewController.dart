import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/controllers/BusinessDetailsController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';

class BsRentalViewController {
  // instances //
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> scFormKey = GlobalKey<FormState>();
  bool firstFormValid = false;
  bool secondFormValid = false;

  // streams //

  // variables //

  // states variables //

  // methods //

  // instances //
  TabController? tabController;
  BusinessItemDetailsController detailsController =
      BusinessItemDetailsController();
  // vars //
  bool shouldRefetch = false;
  // state variables //
  Rxn<RentalWithBusinessCard> _rental = Rxn<RentalWithBusinessCard>();
  RentalWithBusinessCard? get rental => _rental.value;
  bool get isEditing => _rental.value != null;

  List<TimeUnit> get _possibleTimeUnits => List.unmodifiable([
        TimeUnit.PerHour,
        TimeUnit.PerDay,
        TimeUnit.PerMonth,
      ]);
  List<TimeUnit> get avalbleUnits => _possibleTimeUnits
      .where((TimeUnit element) =>
          detailsController.priceTimeUnitMap.keys.contains(element) == false)
      .toList();

  late RentalCategory1 rentalCategory1;
  Rxn<RentalCategory2> rentalCategory2 = Rxn();
  Rxn<RentalCategory3> rentalCategory3 = Rxn();
  TextEditingController surfBoardLengthController = TextEditingController();

  void init({
    required TickerProvider thickerProvider,
    required RentalCategory1 category1,
  }) {
    tabController = TabController(length: 2, vsync: thickerProvider);
    detailsController.addPriceTimeUnit(timeUnit: avalbleUnits.first);
    rentalCategory1 = category1;
  }

  Future<void> initEditMode({required int id}) async {
    _rental.value = await get_rental_by_id(id: id, withCache: false);
    mezDbgPrint("service id : $id");
    if (rental != null) {
      detailsController.clearPrices();
      await detailsController.initEditMode(
          detalsId: rental!.details.id.toInt());
      rentalCategory2.value = rental!.category2;
      rentalCategory3.value = rental!.category3;
      if (rentalCategory1 == RentalCategory1.Surf) {
        surfBoardLengthController.text =
            rental!.details.additionalParameters?["length"] ?? "";
      }
    }
  }

  Future<void> saveItemDetails() async {
    await detailsController.updateItemDetails();
  }

  Future<Rental> _constructRental() async {
    final BusinessItemDetails details =
        await detailsController.contructDetails();
    if (rentalCategory1 == RentalCategory1.Surf) {
      details.additionalParameters = {
        "length": surfBoardLengthController.text.trim(),
      };
    }
    final Rental rental = Rental(
      category1: rentalCategory1,
      category2: rentalCategory2.value,
      category3: rentalCategory3.value,
      details: details,
    );
    return rental;
  }

  Future<void> save() async {
    if (validate()) {
      if (isEditing) {
        try {
          await saveItemDetails();

          /// Update [rentalCategory2] and [rentalCategory3] when rental is vehicle
          if (rentalCategory1 == RentalCategory1.Vehicle) {
            if (rentalCategory2.value != null) {
              await update_rental_category2(
                id: rental!.details.id.toInt(),
                category2: rentalCategory2.value!,
              );
            }

            /// Update [rentalCategory3] only when [rentalCategory2] is motorcycle
            if (rentalCategory2.value == RentalCategory2.Motorcycle) {
              if (rentalCategory3.value != null) {
                await update_rental_category3(
                  id: rental!.details.id.toInt(),
                  category3: rentalCategory3.value!,
                );
              }
            }
          } else if (rentalCategory1 == RentalCategory1.Surf) {
            /// update addiotional params for surf
            await update_item_additional_params(
              id: rental!.details.id.toInt(),
              additionalParams: {
                "length": surfBoardLengthController.text.trim(),
              },
            );
          }
        } catch (e, stk) {
          mezDbgPrint(
              " 🛑 ${rental?.id?.toInt()}  OperationException : ${e.toString()}");
          mezDbgPrint(stk);
        }
        shouldRefetch = true;
      } else {
        final Rental _rental = await _constructRental();
        mezDbgPrint("busniess id : ${_rental.details.businessId}");
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
      int? res = await add_one_rental(rental: rental);

      if (res != null) {
        showSavedSnackBar();
        shouldRefetch = true;
      }
    } on OperationException catch (e) {
      mezDbgPrint(" 🛑  OperationException : ${e.graphqlErrors[0].message}");
    }
  }

  bool validate() {
    if (isOnFirstTab) {
      // validate first tab
      firstFormValid = _isFirstFormValid;
      if (firstFormValid && !secondFormValid) {
        tabController?.animateTo(1);
      }
    }
    // second tab
    else {
      secondFormValid = _isSecondFormValid;
      if (secondFormValid && !firstFormValid) {
        tabController?.animateTo(0);
      }
    }
    if (secondFormValid && firstFormValid) {
      tabController?.animateTo(0);
    }
    return secondFormValid && firstFormValid;
  }

  bool get _isFirstFormValid {
    return formKey.currentState?.validate() == true;
  }

  bool get _isSecondFormValid {
    return scFormKey.currentState?.validate() == true;
  }

  bool get isBothFormValid {
    return _isFirstFormValid && _isSecondFormValid;
  }

  bool get isOnFirstTab {
    return tabController?.index == 0;
  }

  bool get isOnSecondTab {
    return tabController?.index == 1;
  }
}
