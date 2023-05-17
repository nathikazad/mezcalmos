import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/controllers/BusinessOpAuthController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsEventView/BsEventView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsHomeRentalView/BsHomeRentalView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsProductView/BsProductView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsRentalView/BsRentalView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsServiceView/BsServiceView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/graphql/business_event/hsBusinessEvent.dart';
import 'package:mezcalmos/Shared/graphql/business_product/hsBusinessProduct.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/graphql/business_service/hsBusinessService.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';

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
  BusinessOpAuthController _businessOpAuthController =
      Get.find<BusinessOpAuthController>();

  late Rx<BusinessProfile> businessProfile;
  String get businessProfileFirebaseString =>
      businessProfile.value.toFirebaseFormatString();
  List<BusinessProfileItem> currentBottomSheetData = [];

  // streams //

  // variables //

  // states variables //
  RxList<RentalCard> homeRentals = RxList.empty();
  RxList<RentalCard> rentals = RxList.empty();
  RxList<EventCard> events = RxList.empty();
  RxList<ServiceCard> services = RxList.empty();
  RxList<ProductCard> product = RxList.empty();

  // methods //
  Future<void> init() async {
    // _businessProfile = _businessOpAuthController.businessProfile;
    businessProfile = BusinessProfile.values.first.obs;
    _setupBottomSheetValue();
    await fetchAllServices();
    mezDbgPrint(
        "Business data ${_businessOpAuthController.businessProfile?.name}");
  }

  // TODO: bottom sheet switcher logic
  int _idx = 1;
  void changeBusiness() {
    businessProfile.value = BusinessProfile.values[_idx];
    if (_idx == BusinessProfile.values.length - 1) {
      _idx = 0;
    } else {
      _idx++;
    }
    Get.find<BusinessOpAuthController>().setBusinessProfile =
        businessProfile.value;
    _setupBottomSheetValue();
  }
  // --

  void _setupBottomSheetValue() {
    currentBottomSheetData = _returnSheetValues();
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

    switch (businessProfile.value) {
      case BusinessProfile.SurfShop:
        return [
          BusinessProfileItem(
            title: rentalTitleLangKey,
            subtitle: rentalSubtitleLangKey,
            route: () async {
              bool? refetch = await BsOpRentalView.navigate(
                  id: null, rentalCategory: RentalCategory1.Surf);
              if (refetch == true) unawaited(_fetchRentals());
            },
          ),
          BusinessProfileItem(
            title: classTitleLangKey,
            subtitle: classSubtitleLangKey,
            route: () async {
              bool? refetch =
                  await BsOpEventView.navigate(id: null, isClass: true);
              if (refetch == true) unawaited(_fetchEvents());
            },
          ),
          BusinessProfileItem(
            title: eventTitleLangKey,
            subtitle: eventSubtitleLangKey,
            route: () async {
              bool? refetch =
                  await BsOpEventView.navigate(id: null, isClass: false);
              if (refetch == true) unawaited(_fetchEvents());
            },
          ),
        ];
      case BusinessProfile.VehicleRental:
        return [
          BusinessProfileItem(
            title: rentalTitleLangKey,
            subtitle: rentalSubtitleLangKey,
            route: () async {
              final bool? refetch = await BsOpRentalView.navigate(
                  id: null, rentalCategory: RentalCategory1.Vehicle);
              if (refetch == true) unawaited(_fetchRentals());
            },
          ),
        ];
      case BusinessProfile.HomeRental:
        return [
          BusinessProfileItem(
            title: rentalTitleLangKey,
            subtitle: rentalSubtitleLangKey,
            route: () async {
              bool? refetch = await BsOpHomeRentalView.navigate(id: null);
              if (refetch == true) unawaited(_fetchHomeRentals());
            },
          ),
        ];
      case BusinessProfile.WellnessPractitioner:
        return [
          BusinessProfileItem(
            title: eventTitleLangKey,
            subtitle: eventSubtitleLangKey,
            route: () async {
              bool? refetch =
                  await BsOpEventView.navigate(id: null, isClass: false);
              if (refetch == true) unawaited(_fetchEvents());
            },
          ),
        ];
      case BusinessProfile.Volunteer:
        return [
          BusinessProfileItem(
            title: eventTitleLangKey,
            subtitle: eventSubtitleLangKey,
            route: () async {
              bool? refetch =
                  await BsOpEventView.navigate(id: null, isClass: false);
              if (refetch == true) unawaited(_fetchEvents());
            },
          ),
        ];
      case BusinessProfile.TourAgency:
        return [
          BusinessProfileItem(
            title: eventTitleLangKey,
            subtitle: eventSubtitleLangKey,
            route: () async {
              bool? refetch =
                  await BsOpEventView.navigate(id: null, isClass: false);
              if (refetch == true) unawaited(_fetchEvents());
            },
          ),
        ];
      case BusinessProfile.YogaStudio:
        return [
          BusinessProfileItem(
            title: eventTitleLangKey,
            subtitle: eventSubtitleLangKey,
            route: () async {
              bool? refetch =
                  await BsOpEventView.navigate(id: null, isClass: false);
              if (refetch == true) unawaited(_fetchEvents());
            },
          ),
          BusinessProfileItem(
            title: classTitleLangKey,
            subtitle: classSubtitleLangKey,
            route: () async {
              bool? refetch =
                  await BsOpEventView.navigate(id: null, isClass: true);
              if (refetch == true) unawaited(_fetchEvents());
            },
          ),
        ];
      case BusinessProfile.LanguageSchool:
        return [
          BusinessProfileItem(
            title: eventTitleLangKey,
            subtitle: eventSubtitleLangKey,
            route: () async {
              bool? refetch =
                  await BsOpEventView.navigate(id: null, isClass: false);
              if (refetch == true) unawaited(_fetchEvents());
            },
          ),
          BusinessProfileItem(
            title: classTitleLangKey,
            subtitle: classSubtitleLangKey,
            route: () async {
              bool? refetch =
                  await BsOpEventView.navigate(id: null, isClass: true);
              if (refetch == true) unawaited(_fetchEvents());
            },
          ),
        ];
      case BusinessProfile.ArtisanalProduct:
        return [
          BusinessProfileItem(
            title: productTitleLangKey,
            subtitle: productSubTitleLangKey,
            route: () async {
              bool? refetch = await BsOpProductView.navigate(id: null);
              if (refetch == true) unawaited(_fetchProducts());
            },
          ),
        ];
      case BusinessProfile.CleaningService:
        return [
          BusinessProfileItem(
            title: serviceTitleLangKey,
            subtitle: serviceSubtitleLangKey,
            route: () async {
              bool? refetch = await BsOpServiceView.navigate(id: null);
              if (refetch == true) unawaited(_fetchServices());
            },
          ),
        ];
      case BusinessProfile.PetSitting:
        return [
          BusinessProfileItem(
            title: serviceTitleLangKey,
            subtitle: serviceSubtitleLangKey,
            route: () async {
              bool? refetch = await BsOpServiceView.navigate(
                id: null,
              );
              if (refetch == true) unawaited(_fetchServices());
            },
          ),
        ];
      case BusinessProfile.Entertainment:
        return [
          BusinessProfileItem(
            title: eventTitleLangKey,
            subtitle: eventSubtitleLangKey,
            route: () async {
              bool? refetch =
                  await BsOpEventView.navigate(id: null, isClass: false);
              if (refetch == true) unawaited(_fetchEvents());
            },
          ),
        ];
    }
  }

  Future<void> fetchAllServices() async {
    // convert this to future await array of futures
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
  }

  Future<void> _fetchProducts() async {
    product.value = await get_business_products(
      businessId: _businessOpAuthController.companyId!,
      withCache: false,
    );
  }

  Future<void> _fetchServices() async {
    services.value = await get_business_services(
      businessId: _businessOpAuthController.companyId!,
      withCache: false,
    );
  }

  Future<void> _fetchEvents() async {
    events.value = await get_business_events(
      businessId: _businessOpAuthController.companyId!,
      withCache: false,
    );
  }

  Future<void> _fetchRentals() async {
    rentals.value = await get_business_rentals(
      busniessId: _businessOpAuthController.companyId!,
      withCache: false,
    );
  }

  Future<void> _fetchHomeRentals() async {
    homeRentals.value = await get_business_home_rentals(
      busniessId: _businessOpAuthController.companyId!,
      withCache: false,
    );
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
