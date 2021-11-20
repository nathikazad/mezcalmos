import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:cloud_functions/cloud_functions.dart';

import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';


class TaxiController extends GetxController {
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  AuthController _authController = Get.find<AuthController>();
  SettingsController _settingsController = Get.find<SettingsController>();


  Future<ServerResponse> requestTaxi() async {
    // HttpsCallable checkoutRestaurantCart =
    //     FirebaseFunctions.instance.httpsCallable('checkoutRestaurantCart');
    // try {
    //   mezDbgPrint(cart.value.notes);
    //   mezDbgPrint(cart.value.toFirebaseFormattedJson());
    //   HttpsCallableResult response = await checkoutRestaurantCart
    //       .call(cart.value.toFirebaseFormattedJson());
    //   return ServerResponse.fromJson(response.data);
    // } catch (e) {
    return ServerResponse(ResponseStatus.Error,
        errorMessage: "Server Error", errorCode: "serverError");
    // }
  }

  Future<ServerResponse> cancelOrder(String orderId) async {
    HttpsCallable cancelOrder = FirebaseFunctions.instance
        .httpsCallable('cancelRestaurantOrderFromCustomer');
    try {
      HttpsCallableResult response =
          await cancelOrder.call({"orderId": orderId});
      mezDbgPrint(response.toString());
      print(response.data);
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }
  

  // @override
  // void onInit() {
  //   _nearestTaxistsSub = _databaseHelper.firebaseDatabase
  //       .reference()
  //       .child('taxiDrivers/')
  //       .onValue
  //       .listen((event) async {
  //     try {
  //       List<Taxist> _newData = [];
  //       LocationData _myLocation = await Location().getLocation();
  //       if (event.snapshot.value != null) {
  //         event.snapshot.value.forEach((dynamic key, dynamic data) {
  //           Taxist _taxisto = Taxist.fromData(key, data);
  //           mezDbgPrint(
  //               " == NEW TAXI ==>  ${_taxisto.id} | state: ${_taxisto.isLooking} | location :  ${_taxisto.location.toString()}");
  //           if (_taxisto.available()) {
  //             double distance =
  //                 MapHelper.calculateDistance(_myLocation, _taxisto.location);

  //             mezDbgPrint(
  //                 " == NEW TAXI ==>  ${_taxisto.id} | Distance :  $distance");
  //             // less or equal to 5km
  //             if (distance <= 6.0) {
  //               _newData.add(_taxisto);
  //             }
  //           }
  //         });
  //         // re-assigning!
  //         _taxists.assignAll(_newData);
  //       }
  //     } catch (e) {
  //       mezDbgPrint("OOOOOOOOO   $e   0000000000");
  //     }
  //   });
  //   super.onInit();
  // }

  @override
  void onClose() {
    // _nearestTaxistsSub?.cancel();
    // _nearestTaxistsSub = null;
    super.onClose();
  }
}
