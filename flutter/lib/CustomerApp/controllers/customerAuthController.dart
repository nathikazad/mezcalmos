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
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

class CustomerAuthController extends GetxController {
  Rxn<Customer> _customer = Rxn<Customer>();

  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();
  BackgroundNotificationsController _notificationsController =
      Get.find<BackgroundNotificationsController>();

  bool _checkedAppVersion = false;
  Rxn<Customer> customer = Rxn();

  StreamSubscription<dynamic>? _customerNodeListener;

  @override
  Future<void> onInit() async {
    super.onInit();

    if (_authController.fireAuthUser?.uid != null) {
      //
      _customer.value = customer.value;
      mezDbgPrint(
          "User from CustomerAuthController >> ${_authController.fireAuthUser?.uid}");
      mezDbgPrint(
          "CustomerAuthController  Messaging Token>> ${await _notificationsController.getToken()}");
      await _customerNodeListener?.cancel();
      _customerNodeListener = _databaseHelper.firebaseDatabase
          .ref()
          .child(customerNode(_authController.fireAuthUser!.uid))
          .onValue
          .listen((DatabaseEvent event) async {
        customer.value = Customer.fromSnapshotData(event.snapshot.value);

        if (_checkedAppVersion == false) {
          final String VERSION = GetStorage().read(getxAppVersion);
          print("[+] Customer currently using App v$VERSION");
          await _databaseHelper.firebaseDatabase
              .ref()
              .child(customerAppVersionNode(_authController.fireAuthUser!.uid))
              .set(VERSION);

          _checkedAppVersion = true;
        }
      });

      final String? deviceNotificationToken =
          await _notificationsController.getToken();
      if (deviceNotificationToken != null)
        await _databaseHelper.firebaseDatabase
            .ref()
            .child(
              customerNotificationInfoNode(_authController.fireAuthUser!.uid),
            )
            .set(<String, String>{
          'deviceNotificationToken': deviceNotificationToken
        });
    } else {
      mezDbgPrint("User is not signed it to init customer auth controller");
    }
  }

  void saveNewLocation(SavedLocation savedLocation) {
    _databaseHelper.firebaseDatabase
        .ref()
        .child(savedLocationsNode(_authController.fireAuthUser!.uid))
        .push()
        .set(savedLocation.toFirebaseFormattedJson());
  }

  void editLocation(SavedLocation savedLocation) {
    _databaseHelper.firebaseDatabase
        .ref()
        .child(
          savedLocationNode(
              _authController.fireAuthUser!.uid, savedLocation.id!),
        )
        .set(savedLocation.toFirebaseFormattedJson());
  }

  void setAsDefaultLocation(SavedLocation newDefaultLocation) {
    customer.value!.savedLocations.forEach((SavedLocation savedLocation) {
      savedLocation.defaultLocation = newDefaultLocation.id == savedLocation.id;
    });
    _databaseHelper.firebaseDatabase
        .ref()
        .child(savedLocationsNode(_authController.fireAuthUser!.uid))
        .update(customer.value!.savedLocations.toFirebaseFormattedJson());
  }

  void deleteLocation(SavedLocation savedLocation) {
    _databaseHelper.firebaseDatabase
        .ref()
        .child(
          savedLocationNode(
            _authController.fireAuthUser!.uid,
            savedLocation.id!,
          ),
        )
        .remove();
  }

  Location? getLocationById(String locationId) {
    // we get the user Location by it's id!

    return customer.value?.savedLocations.firstWhere(
        (SavedLocation savedLocation) {
      return savedLocation.id == locationId;
    }, orElse: null).location;
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
        customer.value?.savedCards
            .add(CreditCard.fromData(id: key, data: value));
      });
    });
  }

  @override
  Future<void> onClose() async {
    print("[+] CustomerAuthController::onClose ---------> Was invoked !");
    await _customerNodeListener?.cancel();
    _customerNodeListener = null;
    super.onClose();
  }
}
