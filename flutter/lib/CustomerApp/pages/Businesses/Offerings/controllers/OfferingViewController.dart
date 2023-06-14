import 'package:get/get.dart';

import 'package:mezcalmos/CustomerApp/pages/CustCartView/CustCartView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_event/hsBusinessEvent.dart';
import 'package:mezcalmos/Shared/graphql/business_product/hsBusinessProduct.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/graphql/business_service/hsBusinessService.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/CustomerApp/controllers/custBusinessCartController.dart';
import 'package:mezcalmos/CustomerApp/models/BusinessCartItem.dart';

class CustServiceViewController {
  final CustBusinessCartController custBusinessCartController =
      Get.find<CustBusinessCartController>();
  // state vars //
  Rxn<ServiceWithBusinessCard> _service = Rxn<ServiceWithBusinessCard>();
  Rxn<DateTime> _startDate = Rxn();
  Rx<int> _totalHours = Rx(1);
  Rxn<Map<TimeUnit, num>> _timeCost = Rxn();
  Rx<double> totalOrderCost = Rx(0);
  Rx<String> orderString = Rx("-");

  // getters //
  ServiceWithBusinessCard? get service => _service.value;
  Rxn<DateTime> get startDate => _startDate;
  Rx<int> get totalHours => _totalHours;
  Rxn<Map<TimeUnit, num>> get timeCost => _timeCost;
  // methods //
  Future<void> fetchData({required int serviceId}) async {
    _service.value = await get_service_by_id(id: serviceId, withCache: false);
    _setInitialTimeCost();
    _calcTotalOrderCost();
  }

  void _setInitialTimeCost() {
    final TimeUnit costKey = _service.value!.details.cost.entries.first.key;
    final num costValue = _service.value!.details.cost.entries.first.value;
    _timeCost.value = {
      costKey: costValue,
    };
  }

  void _calcTotalOrderCost() {
    double newCost = 0;
    newCost += (totalHours.value) * (_timeCost.value!.values.first.toInt());
    totalOrderCost.value = newCost;
    if (totalOrderCost.value == 0.0) {
      orderString.value = "Free";
      return;
    }
    if (_service.value!.category1 != ServiceCategory1.MealPlanning) {
      orderString.value =
          "\$${_timeCost.value!.values.first.toInt()} x $totalHours = \$${totalOrderCost.value.toStringAsFixed(0)}";
    } else {
      orderString.value = "\$${totalOrderCost.value.toStringAsFixed(0)}";
    }
  }

  void setTotalHours(int value) {
    totalHours.value = value;
    _calcTotalOrderCost();
  }

  void setTimeCost(Map<TimeUnit, num> value) {
    _timeCost.value = value;
    _calcTotalOrderCost();
  }

  Future<void> bookOffering() async {
    await custBusinessCartController.addCartItem(
      BusinessCartItem(
        businessId: _service.value!.business.id,
        itemId: _service.value!.id!,
        offeringType: OfferingType.Service,
        time: startDate.value!.toString(),
        parameters: BusinessItemParameters(
          numberOfUnits: totalHours.value,
          timeUnit: timeCost.value!.keys.first,
        ),
        cost: totalOrderCost.value,
        service: _service.value,
      ),
    );
    await CustCartView.navigate();
    orderString.value = "-";
    totalOrderCost.value = 0;
    _setInitialTimeCost();
    _calcTotalOrderCost();
  }
}

class CustProductViewController {
  final CustBusinessCartController custBusinessCartController =
      Get.find<CustBusinessCartController>();
  // state vars //
  Rxn<ProductWithBusinessCard> _product = Rxn<ProductWithBusinessCard>();
  Rx<double> totalOrderCost = Rx(0);
  Rx<int> _totalUnits = Rx(1);
  Rxn<Map<TimeUnit, num>> _timeCost = Rxn();

  // getters //
  ProductWithBusinessCard? get product => _product.value;
  Rx<int> get totalUnits => _totalUnits;
  Rxn<Map<TimeUnit, num>> get timeCost => _timeCost;
  // methods //
  Future<void> fetchData({required int productId}) async {
    _product.value = await get_product_by_id(id: productId, withCache: false);
    _setInitialTimeCost();
    _calcTotalOrderCost();
  }

  void _setInitialTimeCost() {
    final TimeUnit costKey = _product.value!.details.cost.entries.first.key;
    final num costValue = _product.value!.details.cost.entries.first.value;
    _timeCost.value = {
      costKey: costValue,
    };
  }

  void _calcTotalOrderCost() {
    double newCost = 0;
    newCost += (_totalUnits.value) * (_timeCost.value!.values.first.toInt());
    totalOrderCost.value = newCost;
  }

  Future<void> bookOffering() async {
    await custBusinessCartController.addCartItem(
      BusinessCartItem(
        businessId: _product.value!.business.id,
        itemId: _product.value!.id!,
        offeringType: OfferingType.Product,
        parameters: BusinessItemParameters(
          numberOfUnits: 1,
        ),
        cost: totalOrderCost.value,
        product: _product.value,
      ),
    );
    await CustCartView.navigate();
  }
}

class CustEventViewController {
  final CustBusinessCartController custBusinessCartController =
      Get.find<CustBusinessCartController>();
  // state vars //
  Rxn<EventWithBusinessCard> _event = Rxn<EventWithBusinessCard>();
  Rxn<DateTime> _startDate = Rxn();
  Rx<String> orderString = Rx("-");
  Rxn<Map<TimeUnit, num>> _timeCost = Rxn();
  Rx<double> totalOrderCost = Rx(0);
  Rx<int> _totalHours = Rx(1);

  // getters //
  EventWithBusinessCard? get event => _event.value;
  Rxn<DateTime> get startDate => _startDate;
  Rxn<Map<TimeUnit, num>> get timeCost => _timeCost;
  Rx<int> get totalHours => _totalHours;
  // methods //
  Future<void> fetchData({required int eventId}) async {
    _event.value = await get_event_by_id(id: eventId, withCache: false);
    _setInitialTimeCost();
    _calcTotalOrderCost();
  }

  void _setInitialTimeCost() {
    final TimeUnit costKey = _event.value!.details.cost.entries.first.key;
    final num costValue = _event.value!.details.cost.entries.first.value;
    _timeCost.value = {
      costKey: costValue,
    };
  }

  void _calcTotalOrderCost() {
    double newCost = 0;
    newCost += (totalHours.value) * (_timeCost.value!.values.first.toInt());
    totalOrderCost.value = newCost;
    if (totalOrderCost.value == 0.0) {
      orderString.value = "Free";
      return;
    }
    if (_event.value!.scheduleType == ScheduleType.OnDemand) {
      orderString.value =
          "\$${_timeCost.value!.values.first.toInt()} x $totalHours = \$${totalOrderCost.value.toStringAsFixed(0)}";
    } else {
      orderString.value = "\$${totalOrderCost.value.toStringAsFixed(0)}";
    }
  }

  void setTotalHours(int value) {
    totalHours.value = value;
    _calcTotalOrderCost();
  }

  Future<void> bookOffering() async {
    await custBusinessCartController.addCartItem(
      BusinessCartItem(
        businessId: _event.value!.business.id,
        itemId: _event.value!.id!,
        offeringType: OfferingType.Event,
        time: _event.value!.scheduleType == ScheduleType.OneTime
            ? _event.value!.startsAt
            : startDate.value!.toString(),
        parameters: BusinessItemParameters(
          numberOfUnits: totalHours.value,
          timeUnit: timeCost.value!.keys.first,
        ),
        cost: totalOrderCost.value,
        event: _event.value,
      ),
    );
    await CustCartView.navigate();
    orderString.value = "-";
    totalOrderCost.value = 0;
    _setInitialTimeCost();
    _calcTotalOrderCost();
  }
}

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

  // getters //
  HomeWithBusinessCard? get homeRental => _homeRental.value;
  Rxn<DateTime> get startDate => _startDate;
  Rxn<Map<TimeUnit, num>> get timeCost => _timeCost;
  Rx<int> get duration => _duration;
  Rx<int> get totalGuests => _totalGuests;
  // methods //
  Future<void> fetchData({required int rentalId}) async {
    _homeRental.value = await get_home_by_id(
      id: rentalId,
      withCache: true,
    );
    _setInitialTimeCost();
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

  Future<void> bookOffering() async {
    await custBusinessCartController.addCartItem(
      BusinessCartItem(
        businessId: _homeRental.value!.business.id,
        itemId: _homeRental.value!.id!,
        offeringType: OfferingType.Rental,
        time: startDate.value!.toString(),
        parameters: BusinessItemParameters(
          guests: _totalGuests.value,
          numberOfUnits: _duration.value,
          timeUnit: timeCost.value!.keys.first,
        ),
        cost: totalOrderCost.value,
        home: _homeRental.value,
      ),
    );
    await CustCartView.navigate();
    _duration.value = 1;
    _totalGuests.value = 1;
    orderString.value = "-";
    totalOrderCost.value = 0;
    _setInitialTimeCost();
    _calcTotalOrderCost();
  }
}

class CustRentalViewController {
  // state vars //
  Rxn<RentalWithBusinessCard> _rental = Rxn<RentalWithBusinessCard>();
  Rxn<DateTime> _startDate = Rxn();
  Rxn<Map<TimeUnit, num>> _timeCost = Rxn();
  Rx<int> _duration = Rx(1);
  Rx<String> orderString = Rx("-");
  Rx<double> totalOrderCost = Rx(0);

  // getters //
  RentalWithBusinessCard? get rental => _rental.value;
  Rxn<DateTime> get startDate => _startDate;
  Rxn<Map<TimeUnit, num>> get timeCost => _timeCost;
  Rx<int> get duration => _duration;
  // methods //
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

  Future<void> bookOffering() async {
    final CustBusinessCartController custBusinessCartController =
        Get.find<CustBusinessCartController>();
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
    await CustCartView.navigate();
    _duration.value = 1;
    orderString.value = "-";
    totalOrderCost.value = 0;
    _setInitialTimeCost();
    _calcTotalOrderCost();
  }
}

class CartInfo {
  final Map<Language, String> itemName;
  final int totalPeople;
  final double unitPrice;
  final double totalPrice;
  final int duration;
  final String unitDuration;
  final DateTime startTime;
  final String image;
  CartInfo({
    required this.itemName,
    required this.totalPeople,
    required this.unitPrice,
    required this.totalPrice,
    required this.duration,
    required this.unitDuration,
    required this.startTime,
    required this.image,
  });
}
