import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/ordersNode.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';

enum OrdersStates { Null, Finished, Cancelled, Expired, InProccess, IsLooking }
const String numOfToolTipsShownStorageAddress = "numOfToolTipsShownStorage";
class TaxiController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();

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
        FirebaseFunctions.instance.httpsCallable("taxi-requestRide");

    try {
      mezDbgPrint(taxiRequest.asCloudFunctionParam());
      HttpsCallableResult response =
          await requestTaxiFunction.call(taxiRequest.asCloudFunctionParam());

      return ServerResponse.fromJson(response.data);
    } catch (e) {
      mezDbgPrint("+ EROROROROR HAPPPPEND ==> $e");
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  void updateRideCost({required String orderId, required double cost}) {
    if (cost >= 35) {
      // update order in Customers node
      _databaseHelper.firebaseDatabase
          .reference()
          .child(customerInProcessOrders(_authController.fireAuthUser!.uid))
          .child("/$orderId/cost")
          .set(cost);

      // update order in orders node
      _databaseHelper.firebaseDatabase
          .reference()
          .child(rootTaxiOpenOrdersNode())
          .child("$orderId/cost")
          .set(cost);
    }
  }

  
  num numOfTimesToolTipShownToUser(){
    return GetStorage().read<num>(numOfToolTipsShownStorageAddress) ?? 0;
  }

  void increaseNumOfTimesToolTipShownToUser(){
    GetStorage().write(
        numOfToolTipsShownStorageAddress, numOfTimesToolTipShownToUser() + 1);
  }
  

  @override
  void onClose() {
    super.onClose();
  }
}
