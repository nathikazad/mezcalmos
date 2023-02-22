import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/customer/hsCustomer.dart';
import 'package:mezcalmos/Shared/graphql/saved_location/hsSavedLocation.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

class CustomerAuthController extends GetxController {
  Rxn<Customer> _customer = Rxn<Customer>();
  AuthController authController = Get.find<AuthController>();
  Customer? get customer => _customer.value;

  @override
  Future<void> onInit() async {
    super.onInit();

    if (authController.fireAuthUser?.uid != null) {
      // ignore: unawaited_futures
      get_customer(user_id: authController.hasuraUserId!)
          .then((Customer? value) {
        mezDbgPrint("[]9090] : get_customer::CUSTOMER : $value ");
        _setCustomerInfos(value);
      });
    } else {
      mezDbgPrint("User is not signed it to init customer auth controller");
    }
  }

  Future<void> _setCustomerInfos(Customer? customer) async {
    final String _appVersion = PlatformOSHelper.getAppVersion;
    mezDbgPrint("[]9090] : setting customr ! ");

    Customer? _cus = customer;

    if (_cus == null) {
      _cus = await set_customer_info(
          app_version: _appVersion, user_id: authController.hasuraUserId!);
    }
    await fetchSavedLocations();

    _customer.value = _cus;
    _customer.value?.savedLocations = _cus?.savedLocations ?? [];
    mezDbgPrint(
        "Getting cust saved locations ====😀===========>>>${_customer.value?.savedLocations.length}");
    _customer.refresh();
    mezDbgPrint("[+] Customer currently using App v$_appVersion");
    await set_customer_app_version(
        version: _appVersion, customer_id: authController.hasuraUserId!);
  }

  Future<void> fetchSavedLocations() async {
    _customer.value?.savedLocations = await get_customer_locations(
        customer_id: authController.hasuraUserId!, withCache: false);
  }

  void saveNewLocation(SavedLocation savedLocation) {
    add_saved_location(
        saved_location: savedLocation,
        customer_id: authController.hasuraUserId!);
  }

  void editLocation(SavedLocation savedLocation) {
    update_saved_location(savedLocation: savedLocation);
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

  @override
  Future<void> onClose() async {
    print("[+] CustomerAuthController::onClose ---------> Was invoked !");
    super.onClose();
  }
}
