import 'package:get/get.dart';

import 'package:mezcalmos/CustomerApp/pages/CustCartView/CustCartView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/CustomerApp/controllers/custBusinessCartController.dart';
import 'package:mezcalmos/CustomerApp/models/BusinessCartItem.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';

class CustHomeRentalViewController {
  final CustBusinessCartController custBusinessCartController =
      Get.find<CustBusinessCartController>();
  // state vars //
  Rxn<HomeWithBusinessCard> _homeRental = Rxn<HomeWithBusinessCard>();
  Rxn<DateTime> _startDate = Rxn();
  Rxn<Map<TimeUnit, num>> _timeCost = Rxn();
  Rx<int> _duration = Rx(1);
  Rx<int> _totalGuests = Rx(1);
  Rx<String> orderString = Rx("-");
  Rx<double> totalOrderCost = Rx(0);
  Rx<bool> isEditingMode = Rx<bool>(false);
  Rxn<int> _cartId = Rxn<int>();
  Rx<bool> isMultipleRooms = Rx<bool>(false);
  RxList<Map<String, dynamic>> additionalRooms = RxList();
  Rxn<String> selectedRoom = Rxn<String>();
  Rxn<Map<TimeUnit, num>> selectedRoomCostUnits = Rxn();
  Rxn<bool> isOnlineOrdering = Rxn<bool>(false);

  // getters //
  HomeWithBusinessCard? get homeRental => _homeRental.value;
  Rxn<DateTime> get startDate => _startDate;
  Rxn<Map<TimeUnit, num>> get timeCost => _timeCost;
  Rx<int> get duration => _duration;
  Rx<int> get totalGuests => _totalGuests;
  // methods //

  Future<void> init({
    required int rentalId,
    int? cartId,
    DateTime? startDate,
    Map<TimeUnit, num>? timeCost,
    int? duration,
    int? guestCount,
    String? roomType,
  }) async {
    await fetchData(rentalId: rentalId);
    isOnlineOrdering.value = homeRental!.business.onlineOrdering;
    if (cartId != null &&
        startDate != null &&
        duration != null &&
        guestCount != null) {
      _startDate.value = startDate;
      _timeCost.value = timeCost;
      _duration.value = duration;
      _totalGuests.value = guestCount;
      isEditingMode.value = true;
      _cartId.value = cartId;
      if (roomType != null) changeSelectedRoom(roomType);
    }
    _calcTotalOrderCost();
  }

  Future<void> fetchData({required int rentalId}) async {
    _homeRental.value = await get_home_by_id(
      id: rentalId,
      withCache: true,
    );
    final bool? multiRooms = (_homeRental
            .value!.details.additionalParameters?["additionalRooms"] as List?)
        ?.isNotEmpty;
    if (multiRooms != null) {
      selectedRoom.value =
          _homeRental.value!.details.additionalParameters?["additionalRooms"]
                  ?[0]["roomType"] as String? ??
              "";
      isMultipleRooms.value = multiRooms;
      additionalRooms.value = _homeRental
              .value!.details.additionalParameters?["additionalRooms"]
              ?.map<Map<String, dynamic>>(
            (dynamic e) {
              return {
                "roomType": e["roomType"],
                "cost": constructBusinessServiceCost(e["cost"]),
              };
            },
          )?.toList() as List<Map<String, dynamic>>? ??
          [];
      selectedRoomCostUnits.value = additionalRooms[0]["cost"];
    }
    _setInitialTimeCost();
    _calcTotalOrderCost();
  }

  void changeSelectedRoom(String value) {
    selectedRoom.value = value;
    final int index = _homeRental
        .value!.details.additionalParameters!["additionalRooms"]!
        .indexWhere((dynamic e) => e["roomType"] == value);
    _timeCost.value = additionalRooms[index]["cost"];
    selectedRoomCostUnits.value = additionalRooms[index]["cost"];
    _calcTotalOrderCost();
  }

  void _setInitialTimeCost() {
    final TimeUnit costKey = _homeRental.value!.details.cost.entries.first.key;
    final num costValue = _homeRental.value!.details.cost.entries.first.value;
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

  void setTotalGuests(int value) {
    _totalGuests.value = value;
    _calcTotalOrderCost();
  }

  void _calcTotalOrderCost() {
    double newCost = 0;
    newCost += _duration.value * (_timeCost.value!.values.first.toInt());
    totalOrderCost.value = newCost;
    orderString.value = "\$${totalOrderCost.value.toStringAsFixed(0)}";
  }

  bool _isAbleToBook() {
    if (custBusinessCartController.cart.value != null) {
      return custBusinessCartController.cart.value!.items.every(
          (BusinessCartItem e) => e.businessId == homeRental!.business.id);
    }
    return true;
  }

  Future<void> bookOffering() async {
    if (!_isAbleToBook()) {
      showErrorSnackBar(
        errorTitle: "You can only book items from one business at a time",
      );
      return;
    }
    if (isEditingMode.value) {
      await custBusinessCartController.updateCartItem(
        BusinessCartItem(
          id: _cartId.value,
          businessId: _homeRental.value!.business.id,
          itemId: _homeRental.value!.id!,
          offeringType: OfferingType.Home,
          time: startDate.value!.toString(),
          parameters: BusinessItemParameters(
            guests: _totalGuests.value,
            numberOfUnits: _duration.value,
            timeUnit: timeCost.value!.keys.first,
            roomType: selectedRoom.value,
          ),
          cost: totalOrderCost.value,
          home: _homeRental.value,
        ),
      );
    } else {
      await custBusinessCartController.addCartItem(
        BusinessCartItem(
          businessId: _homeRental.value!.business.id,
          itemId: _homeRental.value!.id!,
          offeringType: OfferingType.Home,
          time: startDate.value!.toString(),
          parameters: BusinessItemParameters(
            guests: _totalGuests.value,
            numberOfUnits: _duration.value,
            timeUnit: timeCost.value!.keys.first,
            roomType: selectedRoom.value,
          ),
          cost: totalOrderCost.value,
          home: _homeRental.value,
        ),
      );
    }
    await CustCartView.navigate();
    startDate.value = null;
    startDate.refresh();
    _duration.value = 1;
    _totalGuests.value = 1;
    orderString.value = "-";
    totalOrderCost.value = 0;
    _setInitialTimeCost();
    _calcTotalOrderCost();
  }
}
