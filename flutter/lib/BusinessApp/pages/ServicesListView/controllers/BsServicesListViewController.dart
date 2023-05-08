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
            route: () => BsOpRentalView.navigate(
                id: null, rentalCategory: RentalCategory1.Surf),
          ),
          BusinessProfileItem(
            title: classTitleLangKey,
            subtitle: classSubtitleLangKey,
            route: () => BsOpEventView.navigate(id: null, isClass: true),
          ),
          BusinessProfileItem(
            title: eventTitleLangKey,
            subtitle: eventSubtitleLangKey,
            route: () => BsOpEventView.navigate(id: null, isClass: false),
          ),
        ];
      case BusinessProfile.VehicleRental:
        return [
          BusinessProfileItem(
            title: rentalTitleLangKey,
            subtitle: rentalSubtitleLangKey,
            route: () => BsOpRentalView.navigate(
                id: null, rentalCategory: RentalCategory1.Vehicle),
          ),
        ];
      case BusinessProfile.HomeRental:
        return [
          BusinessProfileItem(
            title: rentalTitleLangKey,
            subtitle: rentalSubtitleLangKey,
            route: () => BsOpHomeRentalView.navigate(id: null),
          ),
        ];
      case BusinessProfile.WellnessPractitioner:
        return [
          BusinessProfileItem(
            title: eventTitleLangKey,
            subtitle: eventSubtitleLangKey,
            route: () => BsOpEventView.navigate(id: null, isClass: false),
          ),
        ];
      case BusinessProfile.Volunteer:
        return [
          BusinessProfileItem(
            title: eventTitleLangKey,
            subtitle: eventSubtitleLangKey,
            route: () => BsOpEventView.navigate(id: null, isClass: false),
          ),
        ];
      case BusinessProfile.TourAgency:
        return [
          BusinessProfileItem(
            title: eventTitleLangKey,
            subtitle: eventSubtitleLangKey,
            route: () => BsOpEventView.navigate(id: null, isClass: false),
          ),
        ];
      case BusinessProfile.YogaStudio:
        return [
          BusinessProfileItem(
            title: eventTitleLangKey,
            subtitle: eventSubtitleLangKey,
            route: () => BsOpEventView.navigate(id: null, isClass: false),
          ),
          BusinessProfileItem(
            title: classTitleLangKey,
            subtitle: classSubtitleLangKey,
            route: () => BsOpEventView.navigate(id: null, isClass: true),
          ),
        ];
      case BusinessProfile.LanguageSchool:
        return [
          BusinessProfileItem(
            title: eventTitleLangKey,
            subtitle: eventSubtitleLangKey,
            route: () => BsOpEventView.navigate(id: null, isClass: false),
          ),
          BusinessProfileItem(
            title: classTitleLangKey,
            subtitle: classSubtitleLangKey,
            route: () => BsOpEventView.navigate(id: null, isClass: true),
          ),
        ];
      case BusinessProfile.ArtisanalProduct:
        return [
          BusinessProfileItem(
            title: productTitleLangKey,
            subtitle: productSubTitleLangKey,
            route: () => BsOpProductView.navigate(id: null),
          ),
        ];
      case BusinessProfile.CleaningService:
        return [
          BusinessProfileItem(
            title: serviceTitleLangKey,
            subtitle: serviceSubtitleLangKey,
            route: () => BsOpServiceView.navigate(id: null),
          ),
        ];
      case BusinessProfile.PetSitting:
        return [
          BusinessProfileItem(
            title: serviceTitleLangKey,
            subtitle: serviceSubtitleLangKey,
            route: () => BsOpEventView.navigate(id: null, isClass: true),
          ),
        ];
      case BusinessProfile.Entertainment:
        return [
          BusinessProfileItem(
            title: eventTitleLangKey,
            subtitle: eventSubtitleLangKey,
            route: () => BsOpEventView.navigate(id: null, isClass: false),
          ),
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
