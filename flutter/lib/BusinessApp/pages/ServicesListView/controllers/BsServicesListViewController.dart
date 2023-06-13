import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsEventView/BsEventView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsHomeRentalView/BsHomeRentalView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsOtherServiceView/controller/BsOtherServiceViewController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsProductView/BsProductView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsRealEstateView/BsRealEstateView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsRentalView/BsRentalView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsServiceView/BsServiceView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/graphql/business_event/hsBusinessEvent.dart';
import 'package:mezcalmos/Shared/graphql/business_product/hsBusinessProduct.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/graphql/business_service/hsBusinessService.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsOtherServiceView/BsOtherServiceView.dart';

enum BusinessServiceType {
  Rental,
  HomeRental,
  Event,
  Class,
  Service,
  Product,
}

class BusinessProfileItem {
  final String title;
  final String subtitle;
  final Function route;

  BusinessProfileItem({
    required this.title,
    required this.subtitle,
    required this.route,
  });
}

class BsServicesListViewController {
  // instances //
  // BusinessOpAuthController _businessOpAuthController =
  //     Get.find<BusinessOpAuthController>();

  //late Rx<BusinessProfile> businessProfile;
  String get businessProfileFirebaseString =>
      businessProfile.toFirebaseFormatString();
  List<BusinessProfileItem> currentBottomSheetData = [];

  // streams //

  late int businessId;
  late BusinessProfile businessProfile;
  late int businessDetailsId;
  // states variables //
  RxList<RentalCard> homeRentals = RxList.empty();
  RxList<RentalCard> rentals = RxList.empty();
  RxList<EventCard> events = RxList.empty();
  RxList<ServiceCard> services = RxList.empty();
  RxList<ProductCard> product = RxList.empty();
  RxBool _isFetchingAll = RxBool(false);
  RxBool _isFetchingSingle = RxBool(false);

  bool get isFetchingAll => _isFetchingAll.value;
  bool get isFetchingSingle => _isFetchingSingle.value;

  bool get noData =>
      homeRentals.isEmpty &&
      rentals.isEmpty &&
      events.isEmpty &&
      services.isEmpty &&
      product.isEmpty;

  Rx<ServiceProviderLanguage> _language =
      Rx(ServiceProviderLanguage(primary: Language.ES));
  Language get primaryLang => _language.value.primary;

  // methods //
  Future<void> init(
      {required int id,
      required BusinessProfile profile,
      required int businessDetailsId}) async {
    businessId = id;
    businessProfile = profile;
    this.businessDetailsId = businessDetailsId;

    await get_service_lang(detailsId: businessDetailsId)
        .then((ServiceProviderLanguage? value) {
      if (value != null) {
        _language.value = value;
      }
    });

    _setupBottomSheetValue();
    await fetchAllServices();
  }

  // TODO: bottom sheet switcher logic

  void changeBusiness() {
    int _idx = BusinessProfile.values.indexOf(businessProfile);
    if (_idx == BusinessProfile.values.length - 1) {
      _idx = 0;
    } else {
      _idx++;
    }
    businessProfile = BusinessProfile.values[_idx];
    mezDbgPrint(businessProfile);
    // Get.find<BusinessOpAuthController>().setBusinessProfile =
    //     businessProfile.value;
    _setupBottomSheetValue();
  }
  // --

  void _setupBottomSheetValue() {
    currentBottomSheetData = _returnSheetValues();
  }

  BusinessProfileItem otherServices() {
    OtherServiceType getSimilarType() {
      switch (businessProfile) {
        case BusinessProfile.RealEstate:
        case BusinessProfile.SurfShop:
        case BusinessProfile.VehicleRental:
        case BusinessProfile.HomeRental:
          return OtherServiceType.Rental;

        case BusinessProfile.YogaStudio:
        case BusinessProfile.LanguageSchool:
        case BusinessProfile.TourAgency:
        case BusinessProfile.WellnessPractitioner:
        case BusinessProfile.Volunteer:
        case BusinessProfile.Entertainment:
        case BusinessProfile.DanceStudio:
          return OtherServiceType.Event;

        case BusinessProfile.ArtisanalProduct:
          return OtherServiceType.Item;

        case BusinessProfile.CleaningService:
        case BusinessProfile.PetSitting:
        case BusinessProfile.MealPlanning:
        case BusinessProfile.Photography:
        case BusinessProfile.BeautySalon:
        case BusinessProfile.TattooArtist:
          return OtherServiceType.Service;
      }
    }

    return BusinessProfileItem(
      title: "otherServicesTitle",
      subtitle: "otherServicesSubtitle",
      route: () async {
        await BsOtherServiceView.navigate(
          profileName: getSimilarType(),
          controller: this,
        );
      },
    );
  }

  List<BusinessProfileItem> _returnSheetValues() {
    final String rentalTitleLangKey = "rentalTitle";
    final String rentalSubtitleLangKey = "rentalSubtitle";
    final String classTitleLangKey = "classTitle";
    final String classSubtitleLangKey = "classSubtitle";
    final String eventTitleLangKey = "eventTitle";
    final String eventSubtitleLangKey = "eventSubtitle";
    final String serviceTitleLangKey = "serviceTitle";
    final String serviceSubtitleLangKey = "serviceSubtitle";
    final String productTitleLangKey = "productTitle";
    final String productSubTitleLangKey = "productSubtitle";

    switch (businessProfile) {
      case BusinessProfile.SurfShop:
        return [
          BusinessProfileItem(
            title: rentalTitleLangKey,
            subtitle: rentalSubtitleLangKey,
            route: () async {
              await navigateToRental(rentalCategory: RentalCategory1.Surf);
            },
          ),
          BusinessProfileItem(
            title: classTitleLangKey,
            subtitle: classSubtitleLangKey,
            route: () async {
              await navigateToEvent(
                isClass: true,
                eventCategory: EventCategory1.Surf,
              );
            },
          ),
          BusinessProfileItem(
            title: eventTitleLangKey,
            subtitle: eventSubtitleLangKey,
            route: () async {
              await navigateToEvent(
                isClass: false,
                eventCategory: EventCategory1.Surf,
              );
            },
          ),
          otherServices(),
        ];
      case BusinessProfile.VehicleRental:
        return [
          BusinessProfileItem(
            title: rentalTitleLangKey,
            subtitle: rentalSubtitleLangKey,
            route: () async {
              await navigateToRental(rentalCategory: RentalCategory1.Vehicle);
            },
          ),
          otherServices(),
        ];
      case BusinessProfile.HomeRental:
        return [
          BusinessProfileItem(
            title: rentalTitleLangKey,
            subtitle: rentalSubtitleLangKey,
            route: () async {
              mezDbgPrint("Details id here ========$businessDetailsId");
              await navigateToHomeRental();
            },
          ),
          otherServices(),
        ];
      case BusinessProfile.WellnessPractitioner:
        return [
          BusinessProfileItem(
            title: eventTitleLangKey,
            subtitle: eventSubtitleLangKey,
            route: () async {
              await navigateToEvent(
                isClass: false,
                eventCategory: EventCategory1.Therapy,
              );
            },
          ),
          otherServices(),
        ];
      case BusinessProfile.Volunteer:
        return [
          BusinessProfileItem(
            title: eventTitleLangKey,
            subtitle: eventSubtitleLangKey,
            route: () async {
              await navigateToEvent(
                isClass: false,
                eventCategory: EventCategory1.Volunteer,
              );
            },
          ),
          otherServices(),
        ];
      case BusinessProfile.TourAgency:
        return [
          BusinessProfileItem(
            title: eventTitleLangKey,
            subtitle: eventSubtitleLangKey,
            route: () async {
              await navigateToEvent(
                isClass: false,
                id: null,
                eventCategory: EventCategory1.Adventure,
              );
            },
          ),
          otherServices(),
        ];
      case BusinessProfile.YogaStudio:
        return [
          BusinessProfileItem(
            title: eventTitleLangKey,
            subtitle: eventSubtitleLangKey,
            route: () async {
              await navigateToEvent(
                isClass: false,
                eventCategory: EventCategory1.Yoga,
              );
            },
          ),
          BusinessProfileItem(
            title: classTitleLangKey,
            subtitle: classSubtitleLangKey,
            route: () async {
              await navigateToEvent(
                isClass: true,
                eventCategory: EventCategory1.Yoga,
              );
            },
          ),
          otherServices(),
        ];
      case BusinessProfile.LanguageSchool:
        return [
          BusinessProfileItem(
            title: eventTitleLangKey,
            subtitle: eventSubtitleLangKey,
            route: () async {
              await navigateToEvent(
                isClass: false,
                eventCategory: EventCategory1.LanguageSchool,
              );
            },
          ),
          BusinessProfileItem(
            title: classTitleLangKey,
            subtitle: classSubtitleLangKey,
            route: () async {
              await navigateToEvent(
                isClass: true,
                eventCategory: EventCategory1.LanguageSchool,
              );
            },
          ),
          otherServices(),
        ];
      case BusinessProfile.ArtisanalProduct:
        return [
          BusinessProfileItem(
            title: productTitleLangKey,
            subtitle: productSubTitleLangKey,
            route: () async {
              await navigateToProduct();
            },
          ),
          otherServices(),
        ];
      case BusinessProfile.CleaningService:
        return [
          BusinessProfileItem(
            title: serviceTitleLangKey,
            subtitle: serviceSubtitleLangKey,
            route: () async {
              await navigateToService(
                  serviceCategory: ServiceCategory1.Cleaning);
            },
          ),
          otherServices(),
        ];
      case BusinessProfile.PetSitting:
        return [
          BusinessProfileItem(
            title: serviceTitleLangKey,
            subtitle: serviceSubtitleLangKey,
            route: () async {
              await navigateToService(
                  serviceCategory: ServiceCategory1.PetSitting);
            },
          ),
          otherServices(),
        ];
      case BusinessProfile.Entertainment:
        return [
          BusinessProfileItem(
            title: eventTitleLangKey,
            subtitle: eventSubtitleLangKey,
            route: () async {
              await navigateToEvent(
                isClass: false,
                eventCategory: EventCategory1.Social,
              );
            },
          ),
          otherServices(),
        ];
      case BusinessProfile.DanceStudio:
        return [
          BusinessProfileItem(
            title: eventTitleLangKey,
            subtitle: eventSubtitleLangKey,
            route: () async {
              await navigateToEvent(
                isClass: false,
                eventCategory: EventCategory1.Dance,
              );
            },
          ),
          BusinessProfileItem(
            title: classTitleLangKey,
            subtitle: classSubtitleLangKey,
            route: () async {
              await navigateToEvent(
                isClass: true,
                eventCategory: EventCategory1.Dance,
              );
            },
          ),
          otherServices(),
        ];
      case BusinessProfile.MealPlanning:
        return [
          BusinessProfileItem(
            title: serviceTitleLangKey,
            subtitle: serviceSubtitleLangKey,
            route: () async {
              await navigateToService(
                  serviceCategory: ServiceCategory1.MealPlanning);
            },
          ),
          otherServices(),
        ];
      case BusinessProfile.Photography:
        return [
          BusinessProfileItem(
            title: serviceTitleLangKey,
            subtitle: serviceSubtitleLangKey,
            route: () async {
              await navigateToService(
                  serviceCategory: ServiceCategory1.Photography);
            },
          ),
          otherServices(),
        ];
      case BusinessProfile.BeautySalon:
        return [
          BusinessProfileItem(
            title: serviceTitleLangKey,
            subtitle: serviceSubtitleLangKey,
            route: () async {
              await navigateToService(serviceCategory: ServiceCategory1.Beauty);
            },
          ),
          otherServices(),
        ];
      case BusinessProfile.TattooArtist:
        return [
          BusinessProfileItem(
            title: serviceTitleLangKey,
            subtitle: serviceSubtitleLangKey,
            route: () async {
              await navigateToService(serviceCategory: ServiceCategory1.Tattoo);
            },

          ),
          otherServices(),
        ];
      case BusinessProfile.RealEstate:
        return [
          BusinessProfileItem(
            title: rentalTitleLangKey,
            subtitle: rentalSubtitleLangKey,
            route: () async {
              mezDbgPrint("Details id here ========$businessDetailsId");
              await navigateToRealEstate();
            },
          ),
          otherServices(),
        ];
    }
  }

  Future<void> navigateToEvent({
    int? id,
    required bool isClass,
    required EventCategory1 eventCategory,
  }) async {
    bool? refetch = await BsOpEventView.navigate(
        businessDetailsId: businessDetailsId,
        businessId: businessId,
        eventCategory: eventCategory,
        id: id,
        isClass: isClass);
    if (refetch == true) unawaited(_fetchEvents());
  }

  Future<void> navigateToRental({
    int? id,
    required RentalCategory1 rentalCategory,
  }) async {
    bool? refetch = await BsOpRentalView.navigate(
        businessDetailsId: businessDetailsId,
        businessId: businessId,
        id: id,
        rentalCategory: rentalCategory);
    if (refetch == true) unawaited(_fetchRentals());
  }

  Future<void> navigateToHomeRental({
    int? id,
  }) async {
    bool? refetch = await BsOpHomeRentalView.navigate(
        businessDetailsId: businessDetailsId, businessId: businessId, id: id);
    if (refetch == true) unawaited(_fetchHomeRentals());
  }

  Future<void> navigateToRealEstate({
    int? id,
  }) async {
    bool? refetch = await BsRealEstateView.navigate(
        businessDetailsId: businessDetailsId, businessId: businessId, id: id);
    if (refetch == true) unawaited(_fetchRealEstate());
  }

  Future<void> navigateToService({
    int? id,
    required ServiceCategory1 serviceCategory,
  }) async {
    bool? refetch = await BsOpServiceView.navigate(
        businessDetailsId: businessDetailsId,
        businessId: businessId,
        serviceCategory: serviceCategory,
        serviceId: id);
    mezDbgPrint("should refetch services =============>$refetch");
    if (refetch == true) unawaited(_fetchServices());
  }

  Future<void> navigateToProduct({
    int? id,
  }) async {
    bool? refetch = await BsOpProductView.navigate(
        businessDetailsId: businessDetailsId, businessId: businessId, id: id);
    if (refetch == true) unawaited(_fetchProducts());
  }

  Future<void> fetchAllServices() async {
    // convert this to future await array of futures
    _isFetchingAll.value = true;
    homeRentals.clear();
    rentals.clear();
    events.clear();
    services.clear();
    product.clear();
    await Future.wait([
      _fetchHomeRentals(),
      _fetchRentals(),
      _fetchEvents(),
      _fetchServices(),
      _fetchProducts(),
    ]);
    _isFetchingAll.value = false;
  }

  Future<void> _fetchProducts() async {
    _isFetchingSingle.value = true;
    product.value = await get_business_products(
      businessId: businessId,
      withCache: false,
    );
    _isFetchingSingle.value = false;
  }

  Future<void> _fetchServices() async {
    _isFetchingSingle.value = true;
    services.value = await get_business_services(
      businessId: businessId,
      withCache: false,
    );
    _isFetchingSingle.value = false;
  }

  Future<void> _fetchEvents() async {
    _isFetchingSingle.value = true;
    events.value = await get_business_events(
      businessId: businessId,
      withCache: false,
    );
    _isFetchingSingle.value = false;
  }

  Future<void> _fetchRentals() async {
    _isFetchingSingle.value = true;
    rentals.value = await get_business_rentals(
      busniessId: businessId,
      withCache: false,
    );
    _isFetchingSingle.value = false;
  }

  Future<void> _fetchHomeRentals() async {
    _isFetchingSingle.value = true;
    homeRentals.value = await get_business_home_rentals(
      busniessId: businessId,
      withCache: false,
    );
    _isFetchingSingle.value = false;
  }

  Future<void> _fetchRealEstate() async {
    // _isFetchingSingle.value = true;
    // homeRentals.value = await get_business_home_rentals(
    //   busniessId: businessId,
    //   withCache: false,
    // );
    // _isFetchingSingle.value = false;
  }

  Future<int?> changeItemAvailability(
      int id, BusinessItemDetails details) async {
    final int? response =
        await update_business_item_details(id: id, details: details);
    if (response != null) {
      showSavedSnackBar();
    } else {
      showErrorSnackBar();
    }
    return response;
  }

  void dispose() {}
}
