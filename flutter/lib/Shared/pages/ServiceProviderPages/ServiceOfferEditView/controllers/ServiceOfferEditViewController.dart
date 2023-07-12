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
  Rxn<OfferOrderType> selectedOfferOrderType =
      Rxn<OfferOrderType>(OfferOrderType.AnyOrder);
  Rx<DiscountType> selectedDiscountType =
      Rx<DiscountType>(DiscountType.FlatAmount);
  TextEditingController discountController = TextEditingController();
  TextEditingController minAmountController = TextEditingController();
  Rxn<DateTime> selectedStartDate = Rxn<DateTime>();
  Rxn<DateTime> selectedEndDate = Rxn<DateTime>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool repeatOffer = RxBool(false);

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
