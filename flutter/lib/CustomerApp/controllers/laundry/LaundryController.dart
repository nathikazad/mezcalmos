import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/LaundryRequest.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/rootNodes.dart';
import 'package:mezcalmos/Shared/firebaseNodes/serviceProviderNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class LaundryController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  RxInt shippingPrice = 50.obs;
  Future<List<Laundry>> getLaundries() {
    getShippingPrice();
    return _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderInfos(orderType: OrderType.Laundry))
        .once()
        .then<List<Laundry>>((DatabaseEvent event) {
      final List<Laundry> laundries = [];
      (event.snapshot.value as dynamic)?.forEach((key, value) {
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
        .ref()
        .child(serviceProviderInfos(
            orderType: OrderType.Laundry, providerId: laundryId))
        .once()
        .then<Laundry>((DatabaseEvent event) {
      return Laundry.fromLaundryData(
          laundryId: laundryId, laundryData: event.snapshot.value);
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
    laundryRequest.shippingCost = await getShippingPrice() ?? 0;
    if (laundryRequest.isFromToSet()) {
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
        errorCode: "Both customer's and laundry's Location are required.",
      );
    }
  }

  Future<int?> getShippingPrice() async {
    final DataSnapshot snapshot = (await _databaseHelper.firebaseDatabase
            .ref()
            .child(baseShippingPriceNode())
            .once())
        .snapshot;
    shippingPrice.value = snapshot.value as int;
    return snapshot.value as int;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
