import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/saved_location/hsSavedLocation.dart';

class CustSavedLocationViewController {
  // instances //
  HasuraDb _db = Get.find<HasuraDb>();
  AuthController _authController = Get.find<AuthController>();
  // obs
  Rxn<List<SavedLocation>> savedLocs = Rxn();

// streams //
  StreamSubscription<List<SavedLocation>?>? savedLocsStream;
  String? subscriptionId;

  Future<void> inti() async {
    await fetchLocations();

    subscriptionId = _db.createSubscription(start: () {
      savedLocsStream = listen_on_customer_locations(
              customer_id: _authController.hasuraUserId!)
          .listen((List<SavedLocation>? event) {
        if (event != null) {
          savedLocs..value = event;
        }
      });
    }, cancel: () {
      savedLocsStream?.cancel();
      savedLocsStream = null;
    });
  }

  Future<void> fetchLocations() async {
    savedLocs.value = await get_customer_locations(
        customer_id: _authController.hasuraUserId!, withCache: false);
  }

  void dispose() {
    if (subscriptionId != null) _db.cancelSubscription(subscriptionId!);
    savedLocs.close();
  }
}
