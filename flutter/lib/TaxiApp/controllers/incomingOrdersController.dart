import 'dart:async';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/Shared/models/Order.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/router.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';

class IncomingOrdersController extends GetxController {
  RxList<Order> orders = <Order>[]
      .obs; // this is observable which will be constaintly changing in realtime .
  AuthController _authController =
      Get.find<AuthController>(); // since it's already injected .
  TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();
  DatabaseHelper _databaseHelper =
      Get.find<DatabaseHelper>(); // Already Injected in main function
  RxBool _waitingResponse = RxBool(false);
  RxString _selectedIncommingOrderKey = "".obs;

  // Storing all the needed Listeners here
  List<StreamSubscription<Event>> _listeners = <StreamSubscription<Event>>[];
  late Worker _updateOrderDistanceToClient;

  dynamic get waitingResponse => _waitingResponse.value;

  Order? get selectedIncommingOrder => (_selectedIncommingOrderKey.value != "")
      ? orders.firstWhere(
          (element) => element.id == _selectedIncommingOrderKey.value,
          orElse: () => Order.empty())
      : null;
  set selectedIncommingOrderKey(String selectedOrderKey) =>
      _selectedIncommingOrderKey.value = selectedOrderKey;

  @override
  void onInit() async {
    // _selectedIncommingOrder.value = null;

    super.onInit();
    print("--------------------> IncomingOrderController Initialized !");

    // uhm .. well let's just attach some listeners..
    // READ : it's better to keep them like that , becauce that way we can update orders, which is an observale list.

    if (_authController.user != null) {
      _listeners.addAll([
        // Added Order!
        _databaseHelper.firebaseDatabase
            .reference()
            .child(taxiOpenOrdersNode)
            .onValue
            .listen((event) async {
          print(event.snapshot.value);
          orders.value = <Order>[];
          if (event.snapshot.value != null) {
            event.snapshot.value.forEach((dynamic key, dynamic value) {
              Order order = Order.fromJson(key, value);
              order.distanceToClient = MapHelper.calculateDistance(
                  order.from.position, _taxiAuthController.currentLocation);
              orders.add(order);
            });

            orders.sort(
                (a, b) => a.distanceToClient.compareTo(b.distanceToClient));
          }
          if (orders
                  .where((element) =>
                      element.id == _selectedIncommingOrderKey.value)
                  .length ==
              0) {
            if (Get.currentRoute == kSelectedIcommingOrder) {
              await MezcalmosSharedWidgets.mezcalmosDialogOrderNoMoreAvailable(
                  55, Get.height, Get.width);
              Get.back(closeOverlays: true);
            }
          }
        })
      ]);


      print("Attached Listeners on taxiOpenOrdersNode : ${_listeners.length}");

      _updateOrderDistanceToClient =
          ever(_taxiAuthController.currentLocationRx, (userLocation) {
        orders.forEach((order) {
          order.distanceToClient = MapHelper.calculateDistance(
              order.from.position, userLocation as LocationData);
        });
        orders.sort((a, b) => a.distanceToClient.compareTo(b.distanceToClient));
      });
    }
  }

  // I added this to avoid possible dangling pointers ...
  void detachListeners() {
    _listeners.forEach((sub) => sub
        .cancel()
        .then((value) =>
            print("A listener was disposed on incomingOrdersController !"))
        .catchError((err) => print(
            "Error happend while trying to dispose incomingOrdersController!")));

    _updateOrderDistanceToClient.dispose();
  }

  Future<void> acceptTaxi(String orderId) async {
    HttpsCallable acceptTaxiFunction =
        FirebaseFunctions.instance.httpsCallable('acceptTaxiOrder');
    try {
      _waitingResponse.value = true;
      HttpsCallableResult response = await acceptTaxiFunction
          .call(<String, dynamic>{
        'orderId': orderId,
        'database': _databaseHelper.dbType
      });
      _waitingResponse.value = false;
      _selectedIncommingOrderKey.value = "";
      Get.back(closeOverlays: true);
      mezcalmosSnackBar("Notice ~", "A new Order has been accpeted !");
      print("Accept Taxi Response");
      print(response.data);
    } catch (e) {
      _waitingResponse.value = false;
      mezcalmosSnackBar("Notice ~", "Failed to accept the taxi order :( ");
      print("Exception happend in acceptTaxi : $e");
    }
  }

  @override
  void dispose() {
    detachListeners();
    super.dispose();
    print("--------------------> Incoming Order Controller disposed");
  }
}
