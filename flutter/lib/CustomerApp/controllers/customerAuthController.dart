import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/customer/hsCustomer.dart';
import 'package:mezcalmos/Shared/graphql/saved_location/hsSavedLocation.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class CustomerAuthController extends GetxController {
  Rxn<Customer> _customer = Rxn<Customer>();
  AuthController authController = Get.find<AuthController>();
  Customer? get customer => _customer.value;

  bool _initialized = false;
  StreamController<bool> _cusAuthControllerInitializedStreamController =
      StreamController<bool>();
  Future<void> onInit() async {
    super.onInit();

    if (authController.fireAuthUser?.uid != null) {
      // ignore: unawaited_futures
      Customer? value =
          await get_customer(user_id: authController.hasuraUserId!);

      await _setCustomerInfos(value);

      _initialized = true;
      _cusAuthControllerInitializedStreamController.add(true);
    }
  }

  Future<void> awaitInitialization() {
    if (_initialized) return Future<void>(() => null);
    return _cusAuthControllerInitializedStreamController.stream.first;
  }

  Future<void> _setCustomerInfos(Customer? customer) async {
    final String _appVersion = PlatformOSHelper.getAppVersion;

    if (customer == null) {
      customer = await set_customer_info(
          app_version: _appVersion, user_id: authController.hasuraUserId!);
    }

    await fetchSavedLocations();

    _customer.value = customer;
    _customer.value?.savedLocations = customer?.savedLocations ?? [];
    _customer.refresh();
    await set_customer_app_version(
        version: _appVersion, customer_id: authController.hasuraUserId!);
  }

  Future<void> fetchSavedLocations() async {
    _customer.value?.savedLocations = await get_customer_locations(
        customer_id: authController.hasuraUserId!, withCache: false);
  }

  Future<SavedLocation?> saveNewLocation(SavedLocation savedLocation) async {
    SavedLocation? res = await add_saved_location(
        saved_location: savedLocation,
        customer_id: authController.hasuraUserId!);
    await fetchSavedLocations();
    return res;
  }

  Future<SavedLocation?> editLocation(SavedLocation savedLocation) async {
    SavedLocation? res =
        await update_saved_location(savedLocation: savedLocation);
    await fetchSavedLocations();
    return res;
  }

  Future<void> setAsDefaultLocation(SavedLocation newDefaultLocation) async {
    await set_default_location(
        userId: authController.hasuraUserId!,
        defaultLocationId: newDefaultLocation.id!);
    unawaited(get_customer_locations(customer_id: authController.hasuraUserId!)
        .then((List<SavedLocation> value) =>
            _customer.value?.savedLocations = value));
  }

  void deleteLocation(SavedLocation savedLocation) {
    if (savedLocation.id != null)
      delete_saved_location(saved_location_id: savedLocation.id!);
  }

  MezLocation? getLocationById(int locationId) {
    // we get the user Location by it's id!

    return customer?.savedLocations.firstWhere((SavedLocation savedLocation) {
      return savedLocation.id == locationId;
    }, orElse: null).location;
  }

  Future<int?> setReviewId(
      {required int reviewId,
      required int orderId,
      required ServiceProviderType entityType}) async {
    switch (entityType) {
      case ServiceProviderType.Laundry:
        return addLaundryOrderReviewId(
          orderId: orderId,
          reviewId: reviewId,
        );
      case ServiceProviderType.Restaurant:
        return addRestaurantOrderReviewId(
          orderId: orderId,
          reviewId: reviewId,
        );
      case ServiceProviderType.DeliveryCompany:
      case ServiceProviderType.DeliveryDriver:
        return addDriverOrderReviewId(
          orderId: orderId,
          reviewId: reviewId,
        );

      default:
    }
    return null;
  }

  @override
  Future<void> onClose() async {
    print("[+] CustomerAuthController::onClose ---------> Was invoked !");

    super.onClose();
  }
}
