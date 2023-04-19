import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_event/hsBusinessEvent.dart';
import 'package:mezcalmos/Shared/graphql/business_product/hsBusinessProduct.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/graphql/business_service/hsBusinessService.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class CustServiceViewController {
  // state vars //
  Rxn<ServiceWithBusinessCard> _service = Rxn<ServiceWithBusinessCard>();

  // getters //
  ServiceWithBusinessCard? get service => _service.value;
  // methods //
  Future<void> fetchData({required int serviceId}) async {
    _service.value = await get_service_by_id(id: serviceId, withCache: false);
  }
}
//

class CustProductViewController {
  // state vars //
  Rxn<ProductWithBusinessCard> _product = Rxn<ProductWithBusinessCard>();

  // getters //
  ProductWithBusinessCard? get product => _product.value;
  // methods //
  Future<void> fetchData({required int productId}) async {
    _product.value = await get_product_by_id(id: productId, withCache: false);
  }
}

class CustEventViewController {
  // state vars //
  Rxn<EventWithBusinessCard> _event = Rxn<EventWithBusinessCard>();

  // getters //
  EventWithBusinessCard? get event => _event.value;
  // methods //
  Future<void> fetchData({required int eventId}) async {
    _event.value = await get_event_by_id(id: eventId, withCache: false);
  }
}

class CustHomeRentalViewController {
  // state vars //
  Rxn<RentalWithBusinessCard> _homeRental = Rxn<RentalWithBusinessCard>();

  // getters //
  RentalWithBusinessCard? get homeRental => _homeRental.value;
  // methods //
  Future<void> fetchData({required int rentalId}) async {
    _homeRental.value = await get_rental_by_id(
      id: rentalId,
      withCache: true,
    );
  }
}
