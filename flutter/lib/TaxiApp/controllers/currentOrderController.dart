import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/TaxiApp/controllers/FBTaxiNorificationsController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Order.dart';

class CurrentOrderController extends GetxController {
  Rx<Order> _model = Order.empty().obs;
  // RxBool _waitingResponse = RxBool(false);

  // ----- USED FOR G MAP STUFF ----- //
  RxList<CustomMarker> _customMarkers = <CustomMarker>[].obs;
  List<CustomMarker> get customMarkers => _customMarkers.value;
  late LatLng initialCameraLocation;
  RxSet<Polyline> _polylines = <Polyline>{}.obs;
  Set<Polyline> get polylines => _polylines.value;
  LatLng? boundsSource;
  LatLng? boundsDestination;

  Map<String, dynamic> markerIdWithLocationSubscription = <String, dynamic>{
    "id": null,
    "sub": null
  };

  BitmapDescriptor? toDescriptor;
  BitmapDescriptor? taxiDescriptor;
  BitmapDescriptor? picMarker;
  // -------------------------------- //
  TaxiAuthController _taxiAuthController =
      Get.find<TaxiAuthController>(); // since it's already injected .
  DatabaseHelper _databaseHelper =
      Get.find<DatabaseHelper>(); // Already Injected in main function

  FBNotificationsController _notifications =
      Get.put<FBNotificationsController>(FBTaxiNotificationsController());

  Order? get value => _model.value;
  dynamic get id => _model.value.id;
  // dynamic get waitingResponse => _waitingResponse.value;

  double get distanceToFinish => MapHelper.calculateDistance(
      _taxiAuthController.currentLocation, _model.value.to.position);

  double get distanceToClient => MapHelper.calculateDistance(
      _taxiAuthController.currentLocation, _model.value.from.position);

  StreamSubscription<Event>? _currentOrderListener;
  RxInt mapNeedsRender = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // taxi marker subscription
    markerIdWithLocationSubscription["id"] = "taxi";
    markerIdWithLocationSubscription["sub"] =
        _taxiAuthController.currentLocationRx;

    initialCameraLocation = LatLng(
        _taxiAuthController.currentLocation.latitude!,
        _taxiAuthController.currentLocation.longitude!);

    print("--------------------> CurrentOrderController Initialized !");
    // dispatchCurrentOrder();
  }

  void loadUpPolyline(Order _o) {
    // Polylines stuff.
    List<LatLng> pLineCoords = [];

    List<PointLatLng> res = PolylinePoints()
        .decodePolyline(_o.routeInformation?['polyline'] ?? _o.polyline);

    res.forEach((PointLatLng point) =>
        pLineCoords.add(LatLng(point.latitude, point.longitude)));

    _polylines.add(Polyline(
      color: Color.fromARGB(255, 172, 89, 252),
      polylineId: PolylineId("ID"),
      jointType: JointType.round,
      points: pLineCoords,
      width: 2,
      startCap: Cap.buttCap,
      endCap: Cap.roundCap,
      // geodesic: true,
    ));
  }

  Future<void> loadBitmapsUp() async {
    if (toDescriptor == null)
      toDescriptor = await BitmapDescriptorLoader(
          (await cropRonded(
              (await rootBundle.load(purple_destination_marker_asset))
                  .buffer
                  .asUint8List())),
          60,
          60,
          isBytes: true);
    if (taxiDescriptor == null) {}
    taxiDescriptor = await BitmapDescriptorLoader(
        (await cropRonded((await rootBundle.load(taxi_driver_marker_asset))
            .buffer
            .asUint8List())),
        60,
        60,
        isBytes: true);

    if (picMarker == null)
      picMarker = await BitmapDescriptorLoader(
          (await cropRonded(
              (await http.get(Uri.parse(value?.customer['image'])))
                  .bodyBytes) as Uint8List),
          60,
          60,
          isBytes: true);
  }

  void dispatchCurrentOrder() {
    _currentOrderListener?.cancel();
    _currentOrderListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(orderId(_taxiAuthController.currentOrderId))
        .onValue
        .listen((event) async {
      print(
          "CurrentOrderController :: DispatchCurrentOrder :: _taxiAuthController.currentOrderId ${_taxiAuthController.currentOrderId}");
      if (event.snapshot.value != null) {
        bool dirty = event.snapshot.value['status'] == _model.value.status;

        print(
            "CurrentOrderController::onValue Invoked >> ${event.snapshot.key} : ${event.snapshot.value['status']}");
        if (event.snapshot.value['status'] == "cancelled" &&
            event.snapshot.value['cancelledBy'] == "customer") {
          await MezcalmosSharedWidgets.mezcalmosDialogOrderCancelled(
              55, Get.height, Get.width);
        } else {
          _model.value = Order.fromSnapshot(event.snapshot);
          _model.value.id = _taxiAuthController.currentOrderId;

          if (!dirty) {
            // if status changed we change the narkers !
            if (_polylines.length == 0) loadUpPolyline(value!);
            if (_model.value.status == "onTheWay") {
              // 3 markers
              await loadBitmapsUp(); // happens only one
              boundsSource = LatLng(
                  _taxiAuthController.currentLocation.latitude!,
                  _taxiAuthController.currentLocation.longitude!);
              boundsDestination =
                  LatLng(value?.to.latitude, value?.to.longitude);

              _customMarkers.value = <CustomMarker>[
                new CustomMarker(
                    "taxi",
                    LatLng(_taxiAuthController.currentLocation.latitude!,
                        _taxiAuthController.currentLocation.longitude!),
                    taxiDescriptor!),
                new CustomMarker(
                    "from",
                    LatLng(value?.from.latitude, value?.from.longitude),
                    picMarker!),
                new CustomMarker(
                    "to",
                    LatLng(value?.to.latitude, value?.to.longitude),
                    toDescriptor!),
              ];
            } else if (_model.value.status == "inTransit") {
              await loadBitmapsUp();
              boundsSource = LatLng(
                  _taxiAuthController.currentLocation.latitude!,
                  _taxiAuthController.currentLocation.longitude!);
              boundsDestination =
                  LatLng(value?.to.latitude, value?.to.longitude);
              // two markers
              _customMarkers.value = <CustomMarker>[
                new CustomMarker(
                    "taxi",
                    LatLng(_taxiAuthController.currentLocation.latitude!,
                        _taxiAuthController.currentLocation.longitude!),
                    taxiDescriptor!),
                new CustomMarker(
                    "to",
                    LatLng(value?.to.latitude, value?.to.longitude),
                    toDescriptor!),
              ];
            }
          }
        }
      }
    });
  }

  Future<void> cancelTaxi(String? reason) async {
    HttpsCallable cancelTaxiFunction =
        FirebaseFunctions.instance.httpsCallable('cancelTaxiFromDriver');
    print("Cancel Taxi Called");
    try {
      // _waitingResponse.value = true;
      HttpsCallableResult response = await cancelTaxiFunction
          .call(<String, dynamic>{
        'reason': reason,
        'database': _databaseHelper.dbType
      });
      dynamic _res = responseStatusChecker(response.data);
      if (_res == null) {
        throw Exception(
            "Manually thrown Exception - Reason -> Response.data was null !");
      } else {
        mezcalmosSnackBar("Notice ~", _res);
        // Get.delete<CurrentOrderMapController>();
      }

      // _waitingResponse.value = false;
    } catch (e) {
      mezcalmosSnackBar("Notice ~", "Failed to Cancel the Taxi Request :( ");
      // _waitingResponse.value = false;
      print("Exception happend in cancelTaxi : $e");
    }
  }

  Future<void> startRide() async {
    HttpsCallable startRideFunction =
        FirebaseFunctions.instance.httpsCallable('startTaxiRide');
    print("Start Taxi Called");
    try {
      // _waitingResponse.value = true;
      HttpsCallableResult response = await startRideFunction
          .call(<String, dynamic>{'database': _databaseHelper.dbType});
      dynamic _res = responseStatusChecker(response.data);

      if (_res == null)
        throw Exception(
            "Manually thrown Exception - Reason -> Response.data was null !");
      // : mezcalmosSnackBar("Notice ~", _res);
      // _waitingResponse.value = false;
    } catch (e) {
      mezcalmosSnackBar("Notice ~", "Failed to Start The ride :( ");
      // _waitingResponse.value = false;
      print("Exception happend in startRide : $e");
    }
  }

  Future<void> finishRide() async {
    HttpsCallable finishRideFunction =
        FirebaseFunctions.instance.httpsCallable('finishTaxiRide');
    print("Finish Taxi Called");
    try {
      // _waitingResponse.value = true;
      HttpsCallableResult response = await finishRideFunction
          .call(<String, dynamic>{'database': _databaseHelper.dbType});
      dynamic _res = responseStatusChecker(response.data);

      if (_res == null) {
        throw Exception(
            "Manually thrown Exception - Reason -> Response.data was null !");
      } else {
        mezcalmosSnackBar("Notice ~", _res);
        // Get.delete<CurrentOrderMapController>();
      }

      // _waitingResponse.value = false;
    } catch (e) {
      mezcalmosSnackBar("Notice ~", "Failed to finish The ride :( ");
      // _waitingResponse.value = false;
      print("Exception happend in finishRide : $e");
    }
  }

  void detachListeners() {
    _notifications.clearAllMessageNotification();
    if (_currentOrderListener != null) {
      _currentOrderListener!
          .cancel()
          .then((value) => print(
              "A listener was disposed on currentOrderController::detachListeners !"))
          .catchError((err) => print(
              "Error happend while trying to dispose currentOrderController::detachListeners !"));
    }
  }

  @override
  void onClose() async {
    // TO Remove our callback
    // _notifications.taxiAuthListenerCallbacks
    //     .removeWhere((element) => element?['orderId'] == _model.value.id);

    detachListeners();
    super.onClose();
  }

  @override
  void dispose() {
    // TO Remove our callback
    // _notifications.taxiAuthListenerCallbacks
    //     .removeWhere((element) => element?['orderId'] == _model.value.id);

    detachListeners();
    super.dispose();
    print("--------------------> CurrentOrderController Auto Disposed !");
  }
}
