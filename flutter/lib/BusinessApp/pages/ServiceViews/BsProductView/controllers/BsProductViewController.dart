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
  Rxn<ProductWithBusinessCard> _product = Rxn<ProductWithBusinessCard>();
  ProductWithBusinessCard? get product => _product.value;
  bool get isEditing => _product.value != null;
  Rxn<ProductCategory1> productCategory = Rxn<ProductCategory1>();

  List<TimeUnit> get _possibleTimeUnits => List.unmodifiable([TimeUnit.Unit]);
  List<TimeUnit> get avalbleUnits => _possibleTimeUnits
      .where((TimeUnit element) =>
          detailsController.priceTimeUnitMap.keys.contains(element) == false)
      .toList();

  void init({required TickerProvider thickerProvider}) {
    tabController = TabController(length: 2, vsync: thickerProvider);
    detailsController.addPriceTimeUnit(timeUnit: avalbleUnits.first);
  }

  Future<void> initEditMode({required int id}) async {
    _product.value = await get_product_by_id(id: id, withCache: false);
    mezDbgPrint(
        "product id : $id ${_product.value?.toFirebaseFormattedJson()}");
    if (product != null) {
      await detailsController.initEditMode(
        detalsId: product!.details.id.toInt(),
      );
      productCategory.value = product!.category1;
    }
  }

  Future<void> saveItemDetails() async {
    await detailsController.updateItemDetails();
  }

  Future<Product> _constructProduct() async {
    final BusinessItemDetails details =
        await detailsController.contructDetails();
    final Product product = Product(
      category1: productCategory.value!,
      details: details,
    );
    return product;
  }

  Future<void> save() async {
    if (validate()) {
      if (isEditing) {
        try {
          await saveItemDetails();
          if (productCategory.value != null) {
            await update_product_category1(
              id: product!.details.id.toInt(),
              productCategory: productCategory.value!,
            );
            showSavedSnackBar();
          }
        } catch (e, stk) {
          mezDbgPrint(
              " 🛑 ${product?.id?.toInt()}  OperationException : ${e.toString()}");
          mezDbgPrint(stk);
        }
        shouldRefetch = true;
      } else {
        final Product _product = await _constructProduct();
        mezDbgPrint("busniess id : ${_product.details.businessId}");

        await createItem(_product);
      }
    }
  }

  void dispose() {
    // TODO: implement dispose
  }

  Future<void> createItem(Product product) async {
    mezDbgPrint(
        "Create product with this payload : ${product.toFirebaseFormattedJson()}");
    try {
      final int? res = await add_one_product(product: product);

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
