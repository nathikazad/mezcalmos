import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/firebaseNodes/serviceProviderNodes.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class LaundryInfoController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  Rxn<Laundry> laundry = Rxn();
  StreamSubscription? _laundryInfoListener;
  Future<void> init(String laundryId) async {
    mezDbgPrint(
        "--------------------> Start listening on past orders  ${serviceProviderInfos(orderType: OrderType.Laundry, providerId: laundryId)}");
    await _laundryInfoListener?.cancel();
    _laundryInfoListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderInfos(
            orderType: OrderType.Laundry, providerId: laundryId))
        .onValue
        .listen((event) {
      if (event.snapshot.value != null) {
        event.snapshot.value.keys.forEach((orderId) {
          mezDbgPrint("Hndling Order : $orderId");
          laundry.value = Laundry.fromLaundryData(
              laundryId: laundryId, laundryData: event.snapshot.value[orderId]);
        });
      }
    }, onError: (error) {
      mezDbgPrint('EROOOOOOR +++++++++++++++++ $error');
    });
  }

  @override
  void onClose() {
    mezDbgPrint(
        "[+] LaundryAuthController::dispose ---------> Was invoked ! ${this.hashCode}");

    _laundryInfoListener?.cancel();
    _laundryInfoListener = null;
    super.onClose();
  }
}
