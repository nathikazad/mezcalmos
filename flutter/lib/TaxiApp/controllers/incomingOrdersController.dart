import 'dart:async';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;

class IncomingOrdersController extends GetxController with MezDisposable {
  RxList<TaxiOrder> orders = <TaxiOrder>[]
      .obs; // this is observable which will be constaintly changing in realtime .
  AuthController _authController =
      Get.find<AuthController>(); // since it's already injected .
  TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();

  DatabaseHelper _databaseHelper =
      Get.find<DatabaseHelper>(); // Already Injected in main function

  // AppLifeCycleController _appLifeCycleController =
  //     Get.find<AppLifeCycleController>();


  // Storing all the needed Listeners here
  Worker? _updateOrderDistanceToClient;


  @override
  void onInit() async {
    // _selectedIncommingOrder.value = null;
    super.onInit();
    mezDbgPrint("IncomingOrdersController init");

    if (_authController.user != null) {
      // Added TaxiOrder!
      mezDbgPrint("Gonna start listen on : $taxiOpenOrdersNode !!");
      _databaseHelper.firebaseDatabase
          .reference()
          .child(taxiOpenOrdersNode)
          .onValue
          .listen((event) async {
        mezDbgPrint("Open Orders Node");
        mezDbgPrint(event.snapshot.value);
        List<TaxiOrder> ordersFromSnapshot = <TaxiOrder>[];
        if (event.snapshot.value != null) {
          event.snapshot.value.forEach((dynamic key, dynamic value) async {
            TaxiOrder order = TaxiOrder.fromData(key, value);
            order.distanceToClient = MapHelper.calculateDistance(
                order.from.position, _taxiAuthController.currentLocation);
            ordersFromSnapshot.add(order);
            // if (_appLifeCycleController.appState == AppLifecycleState.resumed)
            //   _databaseHelper.firebaseDatabase
            //       .reference()
            //       .child(notificationStatusReadNode(
            //           key, _authController.user!.uid))
            //       .set(true);
          });

          ordersFromSnapshot
              .sort((a, b) => a.distanceToClient.compareTo(b.distanceToClient));
          orders.value = ordersFromSnapshot;
          mezDbgPrint(orders);
        } else {
          orders.value = [];
        }
      }).canceledBy(this);
      _updateOrderDistanceToClient?.dispose();
      _updateOrderDistanceToClient =
          ever(_taxiAuthController.currentLocationRx, (userLocation) {
        // mezDbgPrint("Updating distances");
        orders.forEach((order) {
          order.distanceToClient = MapHelper.calculateDistance(
              order.from.position, userLocation as LocationData);
        });
        orders.sort((a, b) => a.distanceToClient.compareTo(b.distanceToClient));
      });
    }

    // _appLifeCycleController.attachCallback(AppLifecycleState.resumed, () {
    //   mezDbgPrint("[+] Callback executed :: app resumed !");
    //   orders.forEach((element) {
    //     _databaseHelper.firebaseDatabase
    //         .reference()
    //         .child(notificationStatusReadNode(
    //             element.orderId, _authController.user!.uid))
    //         .set(true);
    //   });
    // });
  }

  TaxiOrder? getOrder(String orderId) {
    try {
      return orders.firstWhere((order) {
        return order.orderId == orderId;
      });
    } on StateError {
      return null;
    }
  }

  Stream<TaxiOrder?> getIncomingOrderStream(String orderId) {
    return orders.stream.map<TaxiOrder?>((_) {
      try {
        return orders.firstWhere(
          (incomingOrder) => incomingOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        return null;
      }
    });
  }

  // I added this to avoid possible dangling pointers ...
  void detachListeners() {
    cancelSubscriptions();
    _updateOrderDistanceToClient?.dispose();
    // _appLifeCycleController.cleanAllCallbacks();
  }

  Future<ServerResponse> acceptTaxi(String orderId) async {
    mezDbgPrint("Accept Taxi Called");
    HttpsCallable acceptTaxiFunction =
        FirebaseFunctions.instance.httpsCallable('taxi-acceptRide');
    try {
      HttpsCallableResult response =
          await acceptTaxiFunction.call(<String, dynamic>{'orderId': orderId});
      mezDbgPrint(response.data.toString());
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      mezDbgPrint(e.toString());
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  @override
  void onClose() {
    mezDbgPrint(
        "Incoming ORDER CONTROLLER :: ::: :: :: : :   : :::::: DISPOSE ! ${this.hashCode}");
    detachListeners();
    super.onClose();
  }
}
