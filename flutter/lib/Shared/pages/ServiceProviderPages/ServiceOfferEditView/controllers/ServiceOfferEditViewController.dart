import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/controllers/BusinessOpAuthController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/ServiceOfferHelpers.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/graphql/business_event/hsBusinessEvent.dart';
import 'package:mezcalmos/Shared/graphql/business_product/hsBusinessProduct.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/graphql/business_service/hsBusinessService.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';

class ServiceOfferEditViewController {
  int? offerId;
  late int serviceProviderId;
  late ServiceProviderType serviceProviderType;
  RxBool isLoading = RxBool(false);
  RxBool isEditMode = RxBool(false);

  RxBool _isFetchingSingle = RxBool(false);

  RxList<HomeCard> _homeRentals = RxList.empty();
  RxList<RentalCard> _rentals = RxList.empty();
  RxList<EventCard> _events = RxList.empty();
  RxList<ServiceCard> _services = RxList.empty();
  RxList<ProductCard> _product = RxList.empty();

  int businessId = Get.find<BusinessOpAuthController>().companyId!;
  RxList<OfferingData> allOfferings = RxList.empty();

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
    _convertToOfferingData();
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

  Future<void> _convertToOfferingData() async {
    mezDbgPrint("business Id  $businessId");
    await _fetchEvents();
    await _fetchProducts();
    await _fetchRentals();
    await _fetchServices();
    await _fetchHomeRentals();

    allOfferings.clear();
    _product.forEach((element) {
      allOfferings.add(OfferingData(
        type: OfferingType.Product,
        id: element.id!.toInt(),
        name: element.details.name,
        image: element.details.firstImage ?? defaultUserImgUrl,
      ));
    });
    _services.forEach((element) {
      allOfferings.add(OfferingData(
        type: OfferingType.Service,
        id: element.id!.toInt(),
        name: element.details.name,
        image: element.details.firstImage ?? defaultUserImgUrl,
      ));
    });
    _events.forEach((element) {
      allOfferings.add(OfferingData(
        type: OfferingType.Event,
        id: element.id!.toInt(),
        name: element.details.name,
        image: element.details.firstImage ?? defaultUserImgUrl,
      ));
    });
    _rentals.forEach((element) {
      allOfferings.add(OfferingData(
        type: OfferingType.Rental,
        id: element.id!.toInt(),
        name: element.details.name,
        image: element.details.firstImage ?? defaultUserImgUrl,
      ));
    });
    _homeRentals.forEach((element) {
      allOfferings.add(OfferingData(
        type: OfferingType.HomeRental,
        id: element.id!.toInt(),
        name: element.details.name,
        image: element.details.firstImage ?? defaultUserImgUrl,
      ));
    });

    if (isEditMode.value) {
      // using for each or for loop add all the data to selected offering
      // from currentOffer.value!.details.offerings
      if (currentOffer.value!.details.items == null) {
        return;
      }
      allOfferings.forEach((element) {
        if (currentOffer.value!.details.items!.contains(element.id)) {
          allOfferings.where((data) => data == element).first.value = true;
        }
      });
    }
  }

  Future<void> _fetchProducts() async {
    _isFetchingSingle.value = true;
    _product.value = await get_business_products(
      businessId: businessId,
      withCache: false,
    );
    _isFetchingSingle.value = false;
  }

  Future<void> _fetchServices() async {
    _isFetchingSingle.value = true;
    _services.value = await get_business_services(
      businessId: businessId,
      withCache: false,
    );
    _isFetchingSingle.value = false;
  }

  Future<void> _fetchEvents() async {
    _isFetchingSingle.value = true;
    _events.value = await get_business_events(
      businessId: businessId,
      withCache: false,
    );
    _isFetchingSingle.value = false;
  }

  Future<void> _fetchRentals() async {
    _isFetchingSingle.value = true;
    _rentals.value = await get_business_rentals(
      busniessId: businessId,
      withCache: false,
    );
    _isFetchingSingle.value = false;
  }

  Future<void> _fetchHomeRentals() async {
    _isFetchingSingle.value = true;
    _homeRentals.value = await get_business_home_rentals(
      busniessId: businessId,
      withCache: false,
    );
    _isFetchingSingle.value = false;
  }
}

enum OfferingType {
  Product,
  Service,
  Event,
  Rental,
  HomeRental,
}

class OfferingData {
  int id;
  Map<Language, String> name;
  String image;
  OfferingType type;
  bool value;
  OfferingData({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
    this.value = false,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OfferingData && other.id == id && other.type == type;
  }
}
