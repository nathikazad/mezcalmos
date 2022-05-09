import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/LaundryRequest.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/serviceProviderNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class LaundryController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  Future<List<Laundry>> getLaundries() {
    return _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderInfos(orderType: OrderType.Laundry))
        .once()
        .then<List<Laundry>>((DataSnapshot snapshot) {
      final List<Laundry> laundries = [];
      snapshot.value.forEach((key, value) {
        try {
          laundries
              .add(Laundry.fromLaundryData(laundryId: key, laundryData: value));
        } catch (e, stacktrace) {
          mezDbgPrint('Exception: ' + e.toString());
          mezDbgPrint('Stacktrace: ' + stacktrace.toString());
        }
      });
      return laundries;
    });
  }

  Future<Laundry> getLaundry(String laundryId) async {
    return _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderInfos(
            orderType: OrderType.Laundry, providerId: laundryId))
        .once()
        .then<Laundry>((DataSnapshot snapshot) {
      return Laundry.fromLaundryData(
          laundryId: laundryId, laundryData: snapshot.value);
    });
  }

  Future<ServerResponse> cancelOrder(String orderId) async {
    final HttpsCallable cancelLaundryFunction =
        FirebaseFunctions.instance.httpsCallable('laundry-cancelFromCustomer');
    try {
      final HttpsCallableResult<Map<String, dynamic>> response =
          await cancelLaundryFunction
              .call(<String, dynamic>{"orderId": orderId});
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<ServerResponse> requestLaundryService(
    LaundryRequest laundryRequest,
  ) async {
    if (laundryRequest.valid()) {
      final HttpsCallable requestTaxiFunction =
          FirebaseFunctions.instance.httpsCallable("laundry-requestLaundry");

      try {
        mezDbgPrint(laundryRequest.asCloudFunctionParam());
        final HttpsCallableResult<Map<String, dynamic>?> response =
            await requestTaxiFunction
                .call(laundryRequest.asCloudFunctionParam());
        mezDbgPrint(response.data);

        return ServerResponse.fromJson(response.data);
      } catch (e) {
        mezDbgPrint("+ EROROROROR HAPPPPEND ==> $e");
        return ServerResponse(
          ResponseStatus.Error,
          errorMessage: "Server Error",
          errorCode: "serverError",
        );
      }
    } else {
      return ServerResponse(
        ResponseStatus.Error,
        errorMessage: "Invalid Request",
        errorCode: "invalid taxi request or google map server down",
      );
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
