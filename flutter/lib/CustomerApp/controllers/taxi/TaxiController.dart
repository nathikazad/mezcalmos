import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/constants/databaseNodes.dart';
import 'package:mezcalmos/CustomerApp/models/CustomerTaxiOrder.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:cloud_functions/cloud_functions.dart';

enum OrdersStates { Null, Finished, Cancelled, Expired, InProccess, IsLooking }

class TaxiController extends GetxController {
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  // AuthController _authController = Get.find<AuthController>();
  // SettingsController _settingsController = Get.find<SettingsController>();
  Rxn<CustomerTaxiOrder> _taxiOrder = Rxn();
  CustomerTaxiOrder? get getCustomerTaxiOrder => _taxiOrder.value;
  StreamSubscription? _customerOrderListener;
  StreamController<OrdersStates> _eventDispatcher = StreamController();
  Stream<OrdersStates> get eventDispatcher =>
      _eventDispatcher.stream.distinct();

  void setCustomerTaxiOrder(CustomerTaxiOrder _order) {
    _taxiOrder.value = _order;
  }

  @override
  void onInit() {
    super.onInit();
  }

  bool isOrderRemoved(OrdersStates _stats) {
    return (_stats == OrdersStates.Null ||
        _stats == OrdersStates.Cancelled ||
        _stats == OrdersStates.Finished ||
        _stats == OrdersStates.Expired);
  }

  void setOrderId(String orderId) {
    _taxiOrder.value!.orderId = orderId;
  }

  void cancelOrderListener() {
    _customerOrderListener?.cancel();
    _customerOrderListener = null;
  }

  void listenOnCreatedOrderNode() {
    _customerOrderListener?.cancel();
    _customerOrderListener = null;
    _customerOrderListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(customerTaxiOrderNode(_taxiOrder.value!.orderId!))
        .onValue
        .listen((event) {
      if (event.snapshot.value == null) {
        _taxiOrder.value = null;
        _eventDispatcher.add(OrdersStates.Null);
        return;
      }

      String _status = event.snapshot.value['status'];
      switch (_status) {
        case "cancelled":
          _taxiOrder.value = null;
          _eventDispatcher.add(OrdersStates.Cancelled);
          break;
        case "expired":
          _taxiOrder.value = null;
          _eventDispatcher.add(OrdersStates.Expired);
          break;
        case "isLookingForTaxi":
          _eventDispatcher.add(OrdersStates.IsLooking);
          break;
        case "finished":
          _taxiOrder.value = null;
          _eventDispatcher.add(OrdersStates.Finished);
          break;
        default:
          break;
      }
    });
  }

  // Future<ServerResponse> saveCustomerOrder(TaxiOrder order) {}

  Future<ServerResponse> cancelTaxi() async {
    if (_taxiOrder.value == null) {
      // TODO : THIS IS NOT A SERVER RESPONSE!
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Order is null!", errorCode: "clientError");
    }

    HttpsCallable cancelTaxiFunction =
        FirebaseFunctions.instance.httpsCallable('taxi-cancelFromCustomer');
    try {
      mezDbgPrint(_taxiOrder.value!.toFirebaseJson());
      HttpsCallableResult response =
          await cancelTaxiFunction.call({"orderId": _taxiOrder.value!.orderId});
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<ServerResponse> requestTaxi() async {
    if (_taxiOrder.value == null) {
      // TODO : THIS IS NOT A SERVER RESPONSE!
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Order is null!", errorCode: "clientError");
    }

    HttpsCallable requestTaxiFunction =
        FirebaseFunctions.instance.httpsCallable('taxi-requestRide');
    try {
      mezDbgPrint(_taxiOrder.value!.toFirebaseJson());
      HttpsCallableResult response =
          await requestTaxiFunction.call(_taxiOrder.value!.toFirebaseJson());
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  @override
  void onClose() {
    _eventDispatcher.close();
    _customerOrderListener?.cancel();
    _customerOrderListener = null;
    super.onClose();
  }
}
