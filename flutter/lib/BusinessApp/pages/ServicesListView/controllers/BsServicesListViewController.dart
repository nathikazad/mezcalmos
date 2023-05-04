import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/controllers/BusinessOpAuthController.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/graphql/business_product/hsBusinessProduct.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/graphql/business_event/hsBusinessEvent.dart';
import 'package:mezcalmos/Shared/graphql/business_service/hsBusinessService.dart';

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
    homeRentals.value.clear();
    await fetchAllServices();
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
