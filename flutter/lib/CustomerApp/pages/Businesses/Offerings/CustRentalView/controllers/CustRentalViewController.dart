import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/custBusinessCartController.dart';
import 'package:mezcalmos/CustomerApp/models/BusinessCartItem.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/CustCartView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';

class CustRentalViewController {
  // state vars //
  Rxn<RentalWithBusinessCard> _rental = Rxn<RentalWithBusinessCard>();
  final CustBusinessCartController custBusinessCartController =
      Get.find<CustBusinessCartController>();
  Rxn<DateTime> _startDate = Rxn();
  Rxn<Map<TimeUnit, num>> _timeCost = Rxn();
  Rx<int> _duration = Rx(1);
  Rx<String> orderString = Rx("-");
  Rx<double> totalOrderCost = Rx(0);
  Rx<bool> isEditingMode = Rx<bool>(false);
  Rxn<int> _cartId = Rxn<int>();
  Rxn<bool> isOnlineOrdering = Rxn<bool>(false);

  // getters //
  RentalWithBusinessCard? get rental => _rental.value;
  Rxn<DateTime> get startDate => _startDate;
  Rxn<Map<TimeUnit, num>> get timeCost => _timeCost;
  Rx<int> get duration => _duration;
  // methods //
  Future<void> init({
    required int rentalId,
    int? cartId,
    DateTime? startDate,
    Map<TimeUnit, num>? timeCost,
    int? duration,
  }) async {
    await fetchData(rentalId: rentalId);
    isOnlineOrdering.value = rental!.business.onlineOrdering;
    if (startDate != null && duration != null) {
      _startDate.value = startDate;
      _timeCost.value = timeCost;
      _duration.value = duration;
      isEditingMode.value = true;
      _cartId.value = cartId;
    }
    _calcTotalOrderCost();
  }

  Future<void> fetchData({required int rentalId}) async {
    _rental.value = await get_rental_by_id(
      id: rentalId,
      withCache: true,
    );
    _setInitialTimeCost();
    _calcTotalOrderCost();
  }

  void _setInitialTimeCost() {
    final TimeUnit costKey = _rental.value!.details.cost.entries.first.key;
    final num costValue = _rental.value!.details.cost.entries.first.value;
    _timeCost.value = {
      costKey: costValue,
    };
  }

  void setTimeCost(Map<TimeUnit, num> value) {
    _timeCost.value = value;
    _calcTotalOrderCost();
  }

  void setDuration(int value) {
    _duration.value = value;
    _calcTotalOrderCost();
  }

  void _calcTotalOrderCost() {
    double newCost = 0;
    newCost += _duration.value * (_timeCost.value!.values.first.toInt());
    totalOrderCost.value = newCost;
    orderString.value = "\$${totalOrderCost.value.toStringAsFixed(0)}";
  }

  bool isAbleToBook() {
    if (custBusinessCartController.cart.value != null) {
      return custBusinessCartController.cart.value!.items
          .every((BusinessCartItem e) => e.businessId == rental!.business.id);
    }
    return true;
  }

  Future<void> bookOffering() async {
    if (!isAbleToBook()) {
      showErrorSnackBar(
        errorTitle: "You can only book items from one business at a time",
      );
      return;
    }
    final CustBusinessCartController custBusinessCartController =
        Get.find<CustBusinessCartController>();
    if (isEditingMode.value) {
      await custBusinessCartController.updateCartItem(
        BusinessCartItem(
          id: _cartId.value,
          businessId: _rental.value!.business.id,
          itemId: _rental.value!.id!,
          offeringType: OfferingType.Rental,
          time: startDate.value!.toString(),
          parameters: BusinessItemParameters(
            numberOfUnits: _duration.value,
            timeUnit: timeCost.value!.keys.first,
          ),
          cost: totalOrderCost.value,
          rental: _rental.value,
        ),
      );
    } else {
      await custBusinessCartController.addCartItem(
        BusinessCartItem(
          businessId: _rental.value!.business.id,
          itemId: _rental.value!.id!,
          offeringType: OfferingType.Rental,
          time: startDate.value!.toString(),
          parameters: BusinessItemParameters(
            numberOfUnits: _duration.value,
            timeUnit: timeCost.value!.keys.first,
          ),
          cost: totalOrderCost.value,
          rental: _rental.value,
        ),
      );
    }
    await CustCartView.navigate();
    startDate.value = null;
    startDate.refresh();
    _duration.value = 1;
    orderString.value = "-";
    totalOrderCost.value = 0;
    _setInitialTimeCost();
    _calcTotalOrderCost();
  }
}
