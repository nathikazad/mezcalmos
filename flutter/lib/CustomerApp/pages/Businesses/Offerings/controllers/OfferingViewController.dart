import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/business_product/hsBusinessProduct.dart';
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
