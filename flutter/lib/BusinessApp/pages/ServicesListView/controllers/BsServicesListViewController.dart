import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/controllers/BusinessOpAuthController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsEventView/BsEventView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsHomeRentalView/BsHomeRentalView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsProductView/BsProductView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsRentalView/BsRentalView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsServiceView/BsServiceView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_event/hsBusinessEvent.dart';
import 'package:mezcalmos/Shared/graphql/business_product/hsBusinessProduct.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/graphql/business_service/hsBusinessService.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

enum BusinessServiceType {
  Rental,
  HomeRental,
  Event,
  Class,
  Service,
  Product,
}

class BsServicesListViewController {
  // instances //
  BusinessOpAuthController _businessOpAuthController =
      Get.find<BusinessOpAuthController>();

  late Rx<BusinessProfile> _businessProfile;
  List<Map<String, Object>> currentBottomSheetData = [];

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
    _businessProfile = BusinessProfile.values.first.obs;
    _setupBottomSheetValue();
    await fetchAllServices();
    mezDbgPrint(
        "Business data ${_businessOpAuthController.businessProfile?.name}");
  }

  // TODO: bottom sheet switcher logic
  int _idx = 1;
  void changeBusiness() {
    _businessProfile.value = BusinessProfile.values[_idx];
    if (_idx == BusinessProfile.values.length - 1) {
      _idx = 0;
    } else {
      _idx++;
    }
    Get.find<BusinessOpAuthController>().setBusinessProfile =
        _businessProfile.value;
    _setupBottomSheetValue();
  }
  // --

  void _setupBottomSheetValue() {
    currentBottomSheetData = _returnSheetValues();
  }

  List<Map<String, Object>> _returnSheetValues() {
    switch (_businessProfile.value) {
      case BusinessProfile.SurfShop:
        return [
          {
            "title": "surfRentalTitle",
            "subtitle": "surfRentalSubtitle",
            "route": () => BsOpRentalView.navigate(id: null),
          },
          {
            "title": "surfClassTitle",
            "subtitle": "surfClassSubtitle",
            "route": () => BsOpEventView.navigate(id: null, isClass: true),
          },
          {
            "title": "surfEventTitle",
            "subtitle": "surfEventSubtitle",
            "route": () => BsOpEventView.navigate(id: null, isClass: false),
          },
        ];
      case BusinessProfile.VehicleRental:
        return [
          {
            "title": "vehilceRentalTitle",
            "subtitle": "vehilceRentalSubtitle",
            "route": () => BsOpRentalView.navigate(id: null),
          },
        ];
      case BusinessProfile.HomeRental:
        return [
          {
            "title": "homeRentalTitle",
            "subtitle": "homeRentalSubtitle",
            "route": () => BsOpHomeRentalView.navigate(id: null),
          },
        ];
      case BusinessProfile.WellnessPractitioner:
        return [
          {
            "title": "wellnessEventTitle",
            "subtitle": "wellnessEventSubtitle",
            "route": () => BsOpEventView.navigate(id: null, isClass: false),
          },
        ];
      case BusinessProfile.Volunteer:
        return [
          {
            "title": "volunteerEventTitle",
            "subtitle": "volunteerEventSubtitle",
            "route": () => BsOpEventView.navigate(id: null, isClass: false),
          },
        ];
      case BusinessProfile.TourAgency:
        return [
          {
            "title": "tourAgencyEventTitle",
            "subtitle": "tourAgencyEventSubtitle",
            "route": () => BsOpEventView.navigate(id: null, isClass: false),
          },
        ];
      case BusinessProfile.YogaStudio:
        return [
          {
            "title": "yogaEventTitle",
            "subtitle": "yogaEventSubtitle",
            "route": () => BsOpEventView.navigate(id: null, isClass: false),
          },
          {
            "title": "yogaClassTitle",
            "subtitle": "yogaClassSubtitle",
            "route": () => BsOpEventView.navigate(id: null, isClass: true),
          },
        ];
      case BusinessProfile.LanguageSchool:
        return [
          {
            "title": "languageSchoolEventTitle",
            "subtitle": "languageSchoolSubtitle",
            "route": () => BsOpEventView.navigate(id: null, isClass: false),
          },
          {
            "title": "languageSchoolClassTitle",
            "subtitle": "languageClassSubtitle",
            "route": () => BsOpEventView.navigate(id: null, isClass: true),
          },
        ];
      case BusinessProfile.ArtisanalProduct:
        return [
          {
            "title": "itemTitle",
            "subtitle": "itemSubtitle",
            "route": () => BsOpProductView.navigate(id: null),
          },
        ];
      case BusinessProfile.CleaningService:
        return [
          {
            "title": "cleaningServiceTitle",
            "subtitle": "cleaningServiceSubtitle",
            "route": () => BsOpServiceView.navigate(id: null),
          },
        ];
      case BusinessProfile.PetSitting:
        return [
          {
            "title": "petSittingServiceTitle",
            "subtitle": "petSittingServiceSubtitle",
            "route": () => BsOpEventView.navigate(id: null, isClass: true),
          },
        ];
      case BusinessProfile.Entertainment:
        return [
          {
            "title": "entertainmentEventTitle",
            "subtitle": "entertainmentSubtitle",
            "route": () => BsOpEventView.navigate(id: null, isClass: false),
          },
        ];
    }
  }

  Future<void> fetchAllServices() async {
    homeRentals.value = await get_business_home_rentals(
      busniessId: _businessOpAuthController.companyId!,
      withCache: false,
    );
    rentals.value = await get_business_rentals(
      busniessId: _businessOpAuthController.companyId!,
      withCache: false,
    );
    events.value = await get_business_events(
      businessId: _businessOpAuthController.companyId!,
      withCache: false,
    );
    services.value = await get_business_services(
      businessId: _businessOpAuthController.companyId!,
      withCache: false,
    );
    product.value = await get_business_products(
      businessId: _businessOpAuthController.companyId!,
      withCache: false,
    );
  }

  void dispose() {}
}
