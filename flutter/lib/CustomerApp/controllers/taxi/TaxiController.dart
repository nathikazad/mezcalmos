import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/constants/databaseNodes.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:cloud_functions/cloud_functions.dart';

enum OrdersStates { Null, Finished, Cancelled, Expired, InProccess, IsLooking }

class TaxiController extends GetxController {

  Future<ServerResponse> cancelTaxi(String orderId) async {

    HttpsCallable cancelTaxiFunction =
        FirebaseFunctions.instance.httpsCallable('taxi-cancelFromCustomer');
    try {
      HttpsCallableResult response =
          await cancelTaxiFunction.call({"orderId": orderId});
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<ServerResponse> requestTaxi(TaxiRequest taxiRequest) async {
    HttpsCallable requestTaxiFunction =
        FirebaseFunctions.instance.httpsCallable('taxi-requestRide');
    try {
      HttpsCallableResult response =
          await requestTaxiFunction.call(taxiRequest.toFirebaseJson());
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
