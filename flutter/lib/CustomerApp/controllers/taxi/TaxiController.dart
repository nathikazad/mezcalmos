import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/CustomerApp/models/OnlineTaxiDriver.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';
import 'package:mezcalmos/Shared/firebaseNodes/ordersNode.dart';
import 'package:mezcalmos/Shared/firebaseNodes/taxiNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/CounterOffer.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';

enum OrdersStates { Null, Finished, Cancelled, Expired, InProccess, IsLooking }

const String numOfToolTipsShownStorageAddress =
    "numOfToolTipsShownStorageCustomerTaxi";
const int nMaxTimesToShowTTipsOnCustomerApp = 4;

class TaxiController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();

  Future<List<OnlineTaxiDriver>> fecthOnlineTaxiDrivers() async {
    List<OnlineTaxiDriver> _temp = [];
    DataSnapshot _onlineTaxiDrivers = await _databaseHelper.firebaseDatabase
        .reference()
        .child(onlineTaxiDrivers())
        .once();

    _onlineTaxiDrivers.value.keys.forEach((taxiId) {
      // _temp.add(value)
      mezDbgPrint("-----------==== @saad@ox ===-----------");
      mezDbgPrint("${_onlineTaxiDrivers.value[taxiId]}");
      var _driver = OnlineTaxiDriver.fromData(
          taxiId: taxiId, data: _onlineTaxiDrivers.value[taxiId]);
      if (_driver.isDriverAvailable()) {
        _temp.add(_driver);
      } else {
        mezDbgPrint("Driver Not available!");
      }
      mezDbgPrint("-----------==== @saad@ox ===-----------");
    });

    return _temp;
  }

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
    if (taxiRequest.valid()) {
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
    } else {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Invalid Request",
          errorCode: "invalid taxi request or google map server down");
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

  num numOfTimesToolTipShownToUser() {
    return GetStorage().read<num>(numOfToolTipsShownStorageAddress) ?? 0;
  }

  void increaseNumOfTimesToolTipShownToUser() {
    GetStorage().write(
        numOfToolTipsShownStorageAddress, numOfTimesToolTipShownToUser() + 1);
  }

  Future<ServerResponse> acceptCounterOffer(
      String orderId, String customerId, String driverId) async {
    await _databaseHelper.firebaseDatabase
        .reference()
        .child(customersCounterOfferNode(orderId, customerId, driverId))
        .child('status')
        .set(CounterOfferStatus.Accepted.toFirebaseFormatString());

    mezDbgPrint("Accept Taxi Called");
    HttpsCallable acceptTaxiFunction =
        FirebaseFunctions.instance.httpsCallable('taxi-acceptRide');
    try {
      HttpsCallableResult response = await acceptTaxiFunction
          .call(<String, dynamic>{
        'orderId': orderId,
        'counterOfferDriverId': driverId
      });
      mezDbgPrint(response.data.toString());
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      mezDbgPrint(e.toString());
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<void> rejectCounterOffer(
      String orderId, String customerId, String driverId) async {
    await _databaseHelper.firebaseDatabase
        .reference()
        .child(customersCounterOfferNode(orderId, customerId, driverId))
        .child('status')
        .set(CounterOfferStatus.Rejected.toFirebaseFormatString());
  }

  @override
  void onClose() {
    super.onClose();
  }
}
