import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/offer/hsOffer.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/graphql/translation/hsTranslation.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/OffersHelper/OfferHelper.dart';
import 'package:mezcalmos/Shared/helpers/OffersHelper/ServicesOfferHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

class ServiceOfferEditViewController {
  int? offerId;
  late int serviceProviderId;
  late ServiceProviderType serviceProviderType;
  RxBool isLoading = RxBool(false);
  RxBool isEditMode = RxBool(false);
  bool get isCoupon => selectedOfferType.value == OfferType.Coupon;
  bool get isPromotion => selectedOfferType.value == OfferType.Coupon;

  RxBool _isFetchingSingle = RxBool(false);
  RxList<LanguageMap> itemsNames = RxList<LanguageMap>.empty();

  RxList<OfferItemData> selectedItems = RxList.empty();

  Rxn<Offer> currentOffer = Rxn<Offer>();
  Rxn<OfferType> selectedOfferType = Rxn<OfferType>();
  TextEditingController offerNameController = TextEditingController();
  Rxn<OfferOrderType> selectedOfferOrderType =
      Rxn<OfferOrderType>(OfferOrderType.AnyOrder);
  Rx<DiscountType> selectedDiscountType =
      Rx<DiscountType>(DiscountType.FlatAmount);
  Rx<DiscountType> selectedRewardType =
      Rx<DiscountType>(DiscountType.FlatAmount);
  TextEditingController discountController = TextEditingController();
  TextEditingController rewardController = TextEditingController();
  TextEditingController minOrderCost = TextEditingController();
  Rxn<DateTime> selectedStartDate = Rxn<DateTime>();
  Rxn<DateTime> selectedEndDate = Rxn<DateTime>();
  bool get offerForInfluencer =>
      selectedOfferType.value == OfferType.Influencer;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool get haveItems =>
      currentOffer.value?.details.items?.isNotEmpty == true ? true : false;

  RxBool repeatOffer = RxBool(false);
  bool shouldRefetch = false;

  List<int> get initalItemsIds =>
      (isEditMode.value && selectedItems.isEmpty && itemsNames.isNotEmpty)
          ? currentOffer.value!.details.items!
              .map<int>((num e) => e.toInt())
              .toList()
          : selectedItems.map((OfferItemData element) => element.id).toList();

  bool get isActive => currentOffer.value!.status == OfferStatus.Active;

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
    _convertToOfferingData();
  }

  Future<void> _initEditMode() async {
    isEditMode.value = true;
    await _fetchOfferInfo();
    if (currentOffer.value != null) {
      if (currentOffer.value?.details.items != null) {
        unawaited(_fetchNames());
      }

      selectedOfferType.value = currentOffer.value!.offerType;
      selectedStartDate.value = DateTime.tryParse(
          currentOffer.value!.details.validityRangeStart.toString());
      selectedEndDate.value = DateTime.tryParse(
          currentOffer.value!.details.validityRangeEnd.toString());
      offerNameController.text = (selectedOfferType.value == OfferType.Coupon)
          ? currentOffer.value!.couponCode!
          : currentOffer.value!.name?.getTranslation(userLanguage) ?? "";
      selectedOfferOrderType.value =
          currentOffer.value!.details.offerForOrder.toOfferOrderType();
      selectedDiscountType.value = currentOffer.value!.details.discountType;
      discountController.text =
          currentOffer.value!.details.discountValue.toString();
      if (currentOffer.value!.details.minimumOrderAmount != null) {
        minOrderCost.text =
            currentOffer.value!.details.minimumOrderAmount.toString();
      }
      repeatOffer.value = currentOffer.value!.details.weeklyRepeat;

      if (currentOffer.value?.influencerDetails != null) {
        selectedRewardType.value =
            currentOffer.value!.influencerDetails!.rewardType;
        rewardController.text =
            currentOffer.value!.influencerDetails!.rewardValue.toString();
      }
    }
  }

  Future<void> _fetchNames() async {
    itemsNames.value = await fetch_translations(
        nameIds: currentOffer.value!.details.items!
            .map<int>((num e) => e.toInt())
            .toList());
  }

  Future<void> _fetchOfferInfo() async {
    try {
      final Offer? offerData = await get_offer_by_id(
        id: offerId!,
      );

      currentOffer.value = offerData;
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  Map<String, List<dynamic>> _constructSelectedOfferingItems() {
    final Map<String, List<dynamic>> selectedOfferingItems = <String, List>{
      "ids": <num>[],
      "categories": <OfferingType>[],
      "nameIds": <num>[],
    };
    selectedItems.forEach((OfferItemData element) {
      selectedOfferingItems["ids"]!.add(element.id);
      selectedOfferingItems["categories"]!.add(element.type);
      selectedOfferingItems["nameIds"]!.add(element.nameId);
    });
    return selectedOfferingItems;
  }

  void _constructOffer() {
    currentOffer.value = Offer(
      influencerDetails: offerForInfluencer
          ? InfluencerOfferDetails(
              rewardType: selectedRewardType.value,
              rewardValue: double.parse(rewardController.text))
          : null,
      serviceProviderImage: currentOffer.value?.serviceProviderImage ?? "",
      serviceProviderName: currentOffer.value?.serviceProviderName ?? "",
      id: currentOffer.value?.id ?? -1,
      offerType: selectedOfferType.value!,
      serviceProviderId: serviceProviderId,
      couponCode: selectedOfferType == OfferType.Coupon
          ? offerNameController.text
          : null,
      serviceProviderType: serviceProviderType,
      status: currentOffer.value!.status,
      name: <Language, String>{
        Language.EN: offerNameController.text,
      },
      nameId: currentOffer.value?.nameId ?? -1,
      details: OfferDetails(
        minimumOrderAmount: double.tryParse(minOrderCost.text),
        offerForItems:
            OfferItemType.ParticularItems.toFirebaseFormattedString(),
        offerForOrder: selectedOfferOrderType.value!.toFirebaseFormatString(),
        discountType: selectedDiscountType.value,
        discountValue: double.parse(discountController.text),
        weeklyRepeat: false,
        items: initalItemsIds,
        nameIds: selectedItems
            .map((OfferItemData element) => element.nameId)
            .toList(),
        validityRangeStart: selectedStartDate.value?.toUtc().toString(),
        validityRangeEnd: selectedEndDate.value?.toUtc().toString(),
      ),
    );
  }

  Future<void> save() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    isLoading.value = true;
    _constructOffer();
    if (isEditMode.value) {
      final int? res = await update_service_offer(
        offer: currentOffer.value!,
        serviceProviderId: serviceProviderId,
      );
      if (res != null) {
        showSavedSnackBar();
      }
    } else {
      final int? res = await add_service_offer(
        offer: currentOffer.value!,
        serviceProviderId: serviceProviderId,
      );
      if (res != null) {
        showSavedSnackBar();
        offerId = res;
        await _initEditMode();
      }
    }
    shouldRefetch = true;
    isLoading.value = false;
  }

  Future<void> _convertToOfferingData() async {
    mezDbgPrint("business Id  $serviceProviderId");
  }

  void switchOfferType(OfferType offerType) {
    mezDbgPrint("Switching to ========>${offerType.name}");
    selectedOfferType.value = offerType;
  }

  void removeItem({required int id}) {
    selectedItems.removeWhere((OfferItemData element) => element.id == id);
    selectedItems.refresh();
  }

  Future<void> deleteOffer({required BuildContext context}) async {
    if (offerId != null) {
      try {
        final int? res = await delete_offer_by_id(offerId: offerId!);
        if (res != null) {
          Navigator.pop(context);
          unawaited(MezRouter.back(backResult: true));
        }
      } on OperationException catch (e, stk) {
        showErrorSnackBar(errorText: e.graphqlErrors.first.message);
        mezDbgPrint(e);
        mezDbgPrint(stk);
      }
    }
  }

  void switchActive({required bool value}) {
    currentOffer.value?.status =
        value ? OfferStatus.Active : OfferStatus.Inactive;
    currentOffer.refresh();
  }

  // void switchOfferInfluencer(bool v) {
  //   offerForInfluencer.value = v;
  // }
}

class OfferItemData {
  int id;
  int nameId;
  Map<Language, String> name;
  String image;
  OfferingType type;

  OfferItemData({
    required this.id,
    required this.name,
    required this.image,
    required this.nameId,
    required this.type,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OfferItemData && other.id == id && other.type == type;
  }
}
