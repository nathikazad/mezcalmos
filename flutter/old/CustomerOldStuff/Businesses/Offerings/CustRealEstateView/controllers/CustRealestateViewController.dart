import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class CustRealestateViewController {
  Rxn<HomeWithBusinessCard> _realEstate = Rxn<HomeWithBusinessCard>();
  HomeWithBusinessCard? get realEstate => _realEstate.value;

  Future<void> init({required int rentalId}) async {
    await fetchData(rentalId: rentalId);
  }

  Future<void> fetchData({required int rentalId}) async {
    _realEstate.value = await get_home_by_id(
      id: rentalId,
      withCache: true,
    );
  }
}
