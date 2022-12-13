import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';
import 'package:mezcalmos/Shared/firebaseNodes/rootNodes.dart';
import 'package:mezcalmos/Shared/graphql/customer/hsCustomer.dart';
import 'package:mezcalmos/Shared/graphql/saved_location/saved_location.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

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
      _customer.value =
          await get_customer(user_id: _authController.hasuraUserId!);
      final String _appVersion = GetStorage().read(getxAppVersion);
      print("[+] Customer currently using App v$_appVersion");
      await set_customer_app_version(
          version: _appVersion, customer_id: _authController.hasuraUserId!);
      // setting device notification
      final String? deviceNotificationToken =
          await _notificationsController.getToken();
      if (deviceNotificationToken != null)
        await set_notification_token(
          token: deviceNotificationToken,
          customer_id: _authController.hasuraUserId!,
        );
    } else {
      mezDbgPrint("User is not signed it to init customer auth controller");
    }
  }

  void saveNewLocation(SavedLocation savedLocation) {
    add_saved_location(
        saved_location: savedLocation,
        customer_id: _authController.hasuraUserId!);
  }

  void editLocation(SavedLocation savedLocation) {
    update_saved_location(saved_location: savedLocation);
  }

  void setAsDefaultLocation(SavedLocation newDefaultLocation) {
    update_saved_location(saved_location: newDefaultLocation);
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

  Future<MainUserInfo> getUserInfoById(String id) async {
    final DataSnapshot data =
        await _databaseHelper.firebaseDatabase.ref(userInfoNode(id)).get();
    return MainUserInfo.fromData(data.value);
  }

  Future<void> getCards() async {
    mezDbgPrint(
        "Cards value ==========>>>>${customerCardsNode(_authController.fireAuthUser!.uid)}");
    await _databaseHelper.firebaseDatabase
        .ref()
        .child(customerCardsNode(_authController.fireAuthUser!.uid))
        .get()
        // ignore: avoid_annotating_with_dynamic
        .then((dynamic value) {
      value.value.forEach((key, value) {
        customer?.savedCards.add(CreditCard.fromData(id: key, data: value));
      });
    });
  }

  @override
  Future<void> onClose() async {
    print("[+] CustomerAuthController::onClose ---------> Was invoked !");
    super.onClose();
  }
}
