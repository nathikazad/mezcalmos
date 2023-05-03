import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/controllers/BusinessDetailsController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_product/hsBusinessProduct.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class BsProductViewController {
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
  Rxn<ProductWithBusinessCard> _product = Rxn<ProductWithBusinessCard>();
  ProductWithBusinessCard? get product => _product.value;
  bool get isEditing => _product.value != null;

  void init({required TickerProvider thickerProvider}) {
    tabController = TabController(length: 2, vsync: thickerProvider);
  }

  Future<void> initEditMode({required int id}) async {
    _product.value = await get_product_by_id(id: id, withCache: false);
    mezDbgPrint("product id : $id");
    if (product != null) {
      await detailsController.initEditMode(
          detalsId: product!.details.id.toInt());
    }
  }

  Future<void> saveItemDetails() async {
    await detailsController.updateItemDetails();
  }

  void dispose() {
    // TODO: implement dispose
  }

  Future<void> createItem(Product product) async {
    mezDbgPrint(
        "Create product with this payload : ${product.toFirebaseFormattedJson()}");
    try {
      int? res = await add_one_product(product: product);

      if (res != null) {
        showSavedSnackBar();
        shouldRefetch = true;
      }
    } on OperationException catch (e) {
      mezDbgPrint(" 🛑  OperationException : ${e.graphqlErrors[0].message}");
    }
  }
}