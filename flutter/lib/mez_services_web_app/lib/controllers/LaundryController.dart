import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mez_services_web_app/database/FirebaseDb.dart';
import 'package:mez_services_web_app/models/ServerResponse.dart';
import 'package:mez_services_web_app/models/Services/Laundry.dart';

class LaundryController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  @override
  void onInit() {
    print("laundry controller is intailized ✅");
    super.onInit();
  }

  Future<List<Laundry>> getLaundries() {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child("laundries/info")
        .once()
        .then<List<Laundry>>((DatabaseEvent event) {
      final List<Laundry> laundries = [];
      (event.snapshot.value as dynamic)?.forEach((key, value) {
        try {
          laundries
              .add(Laundry.fromLaundryData(laundryId: key, laundryData: value));
        } catch (e, stacktrace) {
          print('Exception: ' + e.toString());
          print('Stacktrace: ' + stacktrace.toString());
        }
      });
      return laundries;
    });
  }

  Future<Laundry> getLaundry(String laundryId) async {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child("laundries/info/$laundryId")
        .once()
        .then<Laundry>((DatabaseEvent event) {
      return Laundry.fromLaundryData(
          laundryId: laundryId, laundryData: event.snapshot.value);
    });
  }

  // Future<ServerResponse> cancelOrder(String orderId) async {
  //   final HttpsCallable cancelLaundryFunction =
  //       FirebaseFunctions.instance.httpsCallable('laundry-cancelFromCustomer');
  //   try {
  //     final HttpsCallableResult<Map<String, dynamic>> response =
  //         await cancelLaundryFunction
  //             .call(<String, dynamic>{"orderId": orderId});
  //     return ServerResponse.fromJson(response.data);
  //   } catch (e) {
  //     return ServerResponse(ResponseStatus.Error,
  //         errorMessage: "Server Error", errorCode: "serverError");
  //   }
  // }

  // Future<ServerResponse> requestLaundryService(
  //   LaundryRequest laundryRequest,
  // ) async {
  //   laundryRequest.shippingCost = await getShippingPrice() ?? 0;
  //   if (laundryRequest.isFromToSet()) {
  //     final HttpsCallable requestTaxiFunction =
  //         FirebaseFunctions.instance.httpsCallable("laundry-requestLaundry");

  //     try {
  //       mezDbgPrint(laundryRequest.asCloudFunctionParam());
  //       final HttpsCallableResult<Map<String, dynamic>?> response =
  //           await requestTaxiFunction
  //               .call(laundryRequest.asCloudFunctionParam());
  //       mezDbgPrint(response.data);

  //       return ServerResponse.fromJson(response.data);
  //     } catch (e) {
  //       mezDbgPrint("+ EROROROROR HAPPPPEND ==> $e");
  //       return ServerResponse(
  //         ResponseStatus.Error,
  //         errorMessage: "Server Error",
  //         errorCode: "serverError",
  //       );
  //     }
  //   } else {
  //     return ServerResponse(
  //       ResponseStatus.Error,
  //       errorMessage: "Invalid Request",
  //       errorCode: "Both customer's and laundry's Location are required.",
  //     );
  //   }
  // }

  Future<int?> getShippingPrice() async {
    final DataSnapshot snapshot = (await _databaseHelper.firebaseDatabase
            .ref()
            .child("metadata/baseShippingPrice")
            .once())
        .snapshot;
    return snapshot.value as int;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
