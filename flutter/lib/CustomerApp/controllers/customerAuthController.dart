import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/graphql/customer/hsCustomer.dart';
import 'package:mezcalmos/Shared/graphql/notifications/hsNotificationInfo.dart';
import 'package:mezcalmos/Shared/graphql/saved_location/hsSavedLocation.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/NotificationInfo.dart';

class CustomerAuthController extends GetxController {
  Rxn<Customer> _customer = Rxn<Customer>();

  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();
  BackgroundNotificationsController _notificationsController =
      Get.find<BackgroundNotificationsController>();

  Customer? get customer => _customer.value;

  @override
  Future<void> onInit() async {
    super.onInit();

    if (_authController.fireAuthUser?.uid != null) {
      // ignore: unawaited_futures
      get_customer(user_id: _authController.hasuraUserId!)
          .then((Customer? value) {
        mezDbgPrint("[]9090] : get_customer::CUSTOMER : $value ");
        _setCustomerInfos(value);
      });
    } else {
      mezDbgPrint("User is not signed it to init customer auth controller");
    }
  }

  Future<void> _setCustomerInfos(Customer? customer) async {
    final String _appVersion = GetStorage().read(getxAppVersion);
    mezDbgPrint("[]9090] : setting customr ! ");

    Customer? _cus = customer;

    if (_cus == null) {
      _cus = await set_customer_info(
          app_version: _appVersion, user_id: _authController.hasuraUserId!);
    }
    _cus?.savedLocations = await get_customer_locations(
        customer_id: _authController.hasuraUserId!);

    _customer.value = _cus;
    _customer.value?.savedLocations = _cus?.savedLocations ?? [];
    mezDbgPrint(
        "Getting cust saved locations ====😀===========>>>${_customer.value?.savedLocations.length}");
    _customer.refresh();
    mezDbgPrint("[+] Customer currently using App v$_appVersion");
    await set_customer_app_version(
        version: _appVersion, customer_id: _authController.hasuraUserId!);
    // setting device notification
    final String? deviceNotificationToken =
        await _notificationsController.getToken();
    if (deviceNotificationToken != null) {
      mezDbgPrint("😉😉😉😉😉😉 setting notif token 😉😉😉😉😉");
      unawaited(saveNotificationToken());
    }
  }

  Future<void> saveNotificationToken() async {
    final String? deviceNotificationToken =
        await _notificationsController.getToken();
    final NotificationInfo? notifInfo =
        await get_notif_info(userId: _authController.hasuraUserId!);

    try {
      if (notifInfo != null &&
          deviceNotificationToken != null &&
          notifInfo.token != deviceNotificationToken) {
        // ignore: unawaited_futures
        update_notif_info(
            notificationInfo: NotificationInfo(
                userId: _authController.hasuraUserId!,
                appType: "customer",
                id: notifInfo.id,
                token: deviceNotificationToken));
      } else if (deviceNotificationToken != null && notifInfo == null) {
        // ignore: unawaited_futures
        insert_notif_info(
            userId: _authController.hasuraUserId!,
            token: deviceNotificationToken,
            appType: "customer");
      }
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  void saveNewLocation(SavedLocation savedLocation) {
    add_saved_location(
        saved_location: savedLocation,
        customer_id: _authController.hasuraUserId!);
  }

  void editLocation(SavedLocation savedLocation) {
    update_saved_location(savedLocation: savedLocation);
  }

  Future<void> setAsDefaultLocation(SavedLocation newDefaultLocation) async {
    await set_default_location(
        userId: _authController.hasuraUserId!,
        defaultLocationId: newDefaultLocation.id!);
    unawaited(get_customer_locations(customer_id: _authController.hasuraUserId!)
        .then((List<SavedLocation> value) =>
            _customer.value?.savedLocations = value));
  }

  void deleteLocation(SavedLocation savedLocation) {
    if (savedLocation.id != null)
      delete_saved_location(saved_location_id: savedLocation.id!);
  }

  Location? getLocationById(int locationId) {
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
