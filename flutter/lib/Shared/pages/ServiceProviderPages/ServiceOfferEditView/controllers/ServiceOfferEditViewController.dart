import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/ServiceOfferHelpers.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';

class ServiceOfferEditViewController {
  int? offerId;
  late int serviceProviderId;
  late ServiceProviderType serviceProviderType;
  RxBool isLoading = RxBool(false);
  RxBool isEditMode = RxBool(false);

  Rxn<Offer> currentOffer = Rxn<Offer>();
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
    required int serviceProviderId,
    required ServiceProviderType serviceProviderType,
  }) {
    this.offerId = offerId;
    this.serviceProviderId = serviceProviderId;
    this.serviceProviderType = serviceProviderType;
    if (offerId != null) {
      _initEditMode();
    }
  }

  Future<void> _initEditMode() async {
    isEditMode.value = true;
    await _fetchOfferInfo();
    selectedOfferType.value = currentOffer.value!.offerType;
    offerNameController.text = currentOffer.value!.couponCode!;
    selectedOfferOrderType.value =
        currentOffer.value!.details.offerForOrder.toOfferOrderType();
    selectedDiscountType.value = currentOffer.value!.details.discountType;
    discountController.text =
        currentOffer.value!.details.discountValue.toString();
    repeatOffer.value = currentOffer.value!.details.weeklyRepeat;
  }

  Future<void> _fetchOfferInfo() async {
    final Offer? offerData = await get_offer_by_id(
      id: offerId!,
    );
    if (offerData == null) {
      return;
    }
    currentOffer.value = offerData;
  }

  void _constructOffer() {
    currentOffer.value = Offer(
      id: offerId,
      offerType: selectedOfferType.value!,
      serviceProviderId: serviceProviderId,
      couponCode: offerNameController.text,
      serviceProviderType: serviceProviderType,
      status: OfferStatus.Active,
      name: {
        Language.EN: offerNameController.text,
      },
      details: OfferDetails(
        offerForOrder: selectedOfferOrderType.value!.toFirebaseFormatString(),
        discountType: selectedDiscountType.value,
        discountValue: double.parse(discountController.text),
        weeklyRepeat: repeatOffer.value,
      ),
    );
  }

  Future<void> save() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    isLoading.value = true;
    if (isEditMode.value) {
      await update_service_offer(
        offer: currentOffer.value!,
        serviceProviderId: serviceProviderId,
      );
    } else {
      _constructOffer();
      await add_service_offer(
        offer: currentOffer.value!,
        serviceProviderId: serviceProviderId,
      );
    }
  }
}
