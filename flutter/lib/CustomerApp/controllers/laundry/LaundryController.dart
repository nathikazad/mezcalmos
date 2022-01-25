import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/LaundryRequest.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';

class LaundryController extends GetxController {
  Future<ServerResponse> cancelOrder(String orderId) async {
    HttpsCallable cancelLaundryFunction =
        FirebaseFunctions.instance.httpsCallable('laundry-cancelFromCustomer');
    try {
      HttpsCallableResult response =
          await cancelLaundryFunction.call({"orderId": orderId});
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<ServerResponse> requestLaundryService(
      LaundryRequest laundryRequest) async {
    if (laundryRequest.valid()) {
      HttpsCallable requestTaxiFunction =
          FirebaseFunctions.instance.httpsCallable("laundry-requestLaundry");

      try {
        mezDbgPrint(laundryRequest.asCloudFunctionParam());
        HttpsCallableResult response = await requestTaxiFunction
            .call(laundryRequest.asCloudFunctionParam());
        mezDbgPrint(response.data);

        return ServerResponse.fromJson(response.data);
      } catch (e) {
        mezDbgPrint("+ EROROROROR HAPPPPEND ==> $e");
        return ServerResponse(ResponseStatus.Error,
            errorMessage: "Server Error", errorCode: "serverError");
      }
    } else {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Invalid Request",
          errorCode: "invalid taxi request or google map server down");
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
