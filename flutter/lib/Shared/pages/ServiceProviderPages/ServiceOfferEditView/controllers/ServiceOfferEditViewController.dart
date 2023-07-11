import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/ServiceOfferHelpers.dart';

class ServiceOfferEditViewController {
  int? offerId;
  RxBool isLoading = RxBool(false);
  RxBool isEditMode = RxBool(false);

  Rxn<Offer>? currentOffer = Rxn<Offer>();
  Rxn<OfferType> selectedOfferType = Rxn<OfferType>();
  TextEditingController offerNameController = TextEditingController();
  Rxn<OfferOrderType> selectedOrderType = Rxn<OfferOrderType>();
  Rx<DiscountType> selectedDiscountType =
      Rx<DiscountType>(DiscountType.FlatAmount);
  TextEditingController discountController = TextEditingController();
  TextEditingController minAmountController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void init({
    required int? offerId,
  }) {
    this.offerId = offerId;
    if (offerId != null) {
      _initEditMode();
    } else {}
  }

  void _initEditMode() {
    isEditMode.value = true;
    _fetchOfferInfo();
  }

  void _fetchOfferInfo() {
    // currentOffer.value = await get_service_provider_offer(
    //   offerId: offerId!,
    // );
  }
}
