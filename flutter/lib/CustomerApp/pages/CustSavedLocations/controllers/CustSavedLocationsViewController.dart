import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/saved_location/hsSavedLocation.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class CustSavedLocationViewController {
  // instances //
  HasuraDb _db = Get.find<HasuraDb>();
  AuthController _authController = Get.find<AuthController>();
  // obs
  RxList<SavedLocation> savedLocs = RxList.empty();

// streams //
  StreamSubscription<List<SavedLocation>?>? savedLocsStream;
  String? subscriptionId;

  RxBool initalized = RxBool(false);

  Future<void> inti() async {
    initalized.value = false;
    await get_customer_locations(customer_id: _authController.hasuraUserId!);

    subscriptionId = _db.createSubscription(start: () {
      savedLocsStream = listen_on_customer_locations(
              customer_id: _authController.hasuraUserId!)
          .listen((List<SavedLocation>? event) {
        mezDbgPrint(event);
        if (event != null) {
          mezDbgPrint(
              "Stream triggred from saved locations  controller ✅✅✅✅✅✅✅✅✅ =====> $event");
          savedLocs.clear();
          savedLocs.addAll(event);
        }
      });
    }, cancel: () {
      savedLocsStream?.cancel();
      savedLocsStream = null;
    });
    initalized.value = true;
  }

  void dispose() {
    if (subscriptionId != null) _db.cancelSubscription(subscriptionId!);
    savedLocs.close();
  }
}
