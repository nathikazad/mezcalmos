import 'dart:async';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/TaxiApp/models/Order.dart';

class CurrentOrderController extends GetxController {
  Rxn<Order> _model = Rxn<Order>();
  RxBool _waitingResponse = RxBool(false);

  TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>(); // since it's already injected .
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>(); // Already Injected in main function

  late BitmapDescriptor _customerLocationMarker;
  late BitmapDescriptor _customerDestinationMarker;

  // Storing all the needed Listeners here
  BitmapDescriptor get custommetLocationMarker => _customerLocationMarker;
  BitmapDescriptor get custommetDestinationMarker => _customerDestinationMarker;

  Order? get value => _model.value;
  dynamic get id => _model.value?.id;
  dynamic get waitingResponse => _waitingResponse.value;

  late StreamSubscription<Event> _currentOrderListener;

  Future<void> loadBitmapDescriptors() async {
    _customerLocationMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(20, 20)), custommer_location_marker_asset);

    _customerDestinationMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(20, 20)), custommer_destination_marker_asset);
  }

  @override
  void onInit() {
    super.onInit();
    _waitingResponse.value = true;
    loadBitmapDescriptors().then((_) {
      print("--------------------> CurrentOrderController Initialized !");
      _currentOrderListener = _databaseHelper.firebaseDatabase.reference().child(orderId(_taxiAuthController.currentOrderId)).onValue.listen((event) {
        print("CurrentOrderController::onValue Invoked >> ${event.snapshot.key} : ${event.snapshot.value}");
        _model.value = Order.fromSnapshot(event.snapshot);
      });
    });
    _waitingResponse.value = false;
  }

  Future<void> cancelTaxi(String reason) async {
    HttpsCallable cancelTaxiFunction = FirebaseFunctions.instance.httpsCallable('cancelTaxiFromDriver');

    try {
      _waitingResponse.value = true;
      HttpsCallableResult response = await cancelTaxiFunction.call(<String, dynamic>{'reason': reason, 'database': _databaseHelper.dbType});
      mezcalmosSnackBar("Notice ~", "Ride Has been canceled !");
      _waitingResponse.value = false;

      print("Cancel Taxi Response");
      print(response.data);
    } catch (e) {
      mezcalmosSnackBar("Notice ~", "Failed to Cancel the Taxi Request :( ");
      _waitingResponse.value = false;
      print("Exception happend in cancelTaxi : $e");
    }
  }

  Future<void> startRide() async {
    HttpsCallable startRideFunction = FirebaseFunctions.instance.httpsCallable('startTaxiRide');
    try {
      _waitingResponse.value = true;
      HttpsCallableResult response = await startRideFunction.call(<String, dynamic>{'database': _databaseHelper.dbType});
      mezcalmosSnackBar("Notice ~", "Ride started !");
      _waitingResponse.value = false;
      print("Start Taxi Response");
      print(response.data);
    } catch (e) {
      mezcalmosSnackBar("Notice ~", "Failed to Start The ride :( ");
      _waitingResponse.value = false;
      print("Exception happend in startRide : $e");
    }
  }

  Future<void> finishRide() async {
    HttpsCallable finishRideFunction = FirebaseFunctions.instance.httpsCallable('finishTaxiRide');
    try {
      _waitingResponse.value = true;
      HttpsCallableResult response = await finishRideFunction.call(<String, dynamic>{'database': _databaseHelper.dbType});
      mezcalmosSnackBar("Notice ~", "Ride is finished successfully :D ");
      _waitingResponse.value = false;
      print("Finish Taxi Response");
      print(response.data);
    } catch (e) {
      mezcalmosSnackBar("Notice ~", "Failed to finish The ride :( ");
      _waitingResponse.value = false;
      print("Exception happend in finishRide : $e");
    }
  }

  void detachListeners() {
    _currentOrderListener
        .cancel()
        .then((value) => print("A listener was disposed on currentOrderController::detachListeners !"))
        .catchError((err) => print("Error happend while trying to dispose currentOrderController::detachListeners !"));
  }

  @override
  void dispose() {
    detachListeners();
    super.dispose();
    print("--------------------> OrderController Auto Disposed !");
  }
}
