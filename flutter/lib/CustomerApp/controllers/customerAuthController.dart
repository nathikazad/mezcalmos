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
import 'package:mezcalmos/Shared/graphql/notifications/hsNotificationInfo.dart';
import 'package:mezcalmos/Shared/graphql/saved_location/saved_location.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
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
      mezDbgPrint("[]9090] : setting customr :: result :: $_cus! ");
    }
    _customer.value = _cus;
    _customer.refresh();
    print("[+] Customer currently using App v$_appVersion");
    await set_customer_app_version(
        version: _appVersion, customer_id: _authController.hasuraUserId!);
    // setting device notification
    final String? deviceNotificationToken =
        await _notificationsController.getToken();
    if (deviceNotificationToken != null) {
      mezDbgPrint("😉😉😉😉😉😉 setting notif token 😉😉😉😉😉");
      unawaited(saveNotificationToken());
    }
    // ignore: always_specify_types, unawaited_futures
    // get_customer_cart(customerId: _authController.hasuraUserId!).then((value) {
    //   mezDbgPrint(
    //       "Customer Auth controller -CART-LEN-  ${value?.cartItems.length}");
    //   if (value == null) {
    //     create_customer_cart();
    //   }
    // });
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
