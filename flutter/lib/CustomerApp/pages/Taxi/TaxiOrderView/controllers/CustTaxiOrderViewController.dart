import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

class TaxiOrderViewController {
  HasuraDb _hasuraDb = Get.find<HasuraDb>();
  final MGoogleMapController mGoogleMapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );
  StreamSubscription<LatLng?>? driverLocationStream;
  StreamSubscription<List<CustomerTaxiOffer>>? _offersStreamSub;
  String? subscriptionId;
  final StreamController<List<CustomerTaxiOffer>> _offerController =
      StreamController<List<CustomerTaxiOffer>>();

  StreamSink<List<CustomerTaxiOffer>> get _offerSink => _offerController.sink;
  Stream<List<CustomerTaxiOffer>> get offerStream => _offerController.stream;
  Rxn<LatLng> deliveryLocation = Rxn();
  Rxn<UserInfo> driver = Rxn();
  RxNum custOffer = RxNum(40);
  RxList<CustomerTaxiOffer> _offers = RxList.empty();
  List<CustomerTaxiOffer> get offers => _offers.value;
  Rxn<CustomerTaxiOffer> _selectedOffer = Rxn();
  List<CustomerTaxiOffer> offersToAdd = [
    CustomerTaxiOffer(
      id: 0,
      driverName: 'Robert Martinez',
      driverImage:
          'https://media.gettyimages.com/id/85631567/photo/taxi-driver-in-cab.jpg?s=612x612&w=0&k=20&c=4YPAnIv0Gu7je4iPc3vR-u3iSgBP1WnR_5k216DqT3Y=',
      expiryTime: DateTime.now().toLocal().add(Duration(minutes: 5)),
    ),
    CustomerTaxiOffer(
      id: 1,
      driverName: 'James Wilson',
      driverImage:
          'https://img.freepik.com/premium-photo/young-happy-male-taxi-driver-sits-wheel-taxi-shows-like_170532-2742.jpg?size=626&ext=jpg',
      expiryTime: DateTime.now().toLocal().add(Duration(minutes: 5)),
    ),
    CustomerTaxiOffer(
      id: 2,
      driverName: 'Diego Morales',
      driverImage:
          'https://media.istockphoto.com/id/91763265/photo/taxi-driver.jpg?s=612x612&w=0&k=20&c=WOychyR6tfe9flAMQ4hTuK0L859fYT5AYj-gs6NRRS8=',
      expiryTime: DateTime.now().toLocal().add(Duration(minutes: 5)),
    ),
  ];
  late int orderId;
  TaxiRequest? taxiRequest;

  bool get hasOffers => offers.isNotEmpty;
  CustomerTaxiOffer? get selectedOffer => _selectedOffer.value;
  void init({required int orderId, TaxiRequest? taxiRequest}) {
    this.orderId = orderId;
    this.taxiRequest = taxiRequest;
    // get order
    if (this.taxiRequest != null) {
      _initMap();
      custOffer.value = this.taxiRequest!.estimatedPrice;
      _listenToDriverLoc();
      addOffersWithDelay();
    }
  }

  Future<void> _initMap() async {
    // first time init map
    mGoogleMapController.periodicRerendering.value = true;
    mGoogleMapController.myLocationButtonEnabled.value = false;
    mGoogleMapController.recenterButtonEnabled.value = false;

    mGoogleMapController.minMaxZoomPrefs =
        MinMaxZoomPreference.unbounded; // LEZEM
    mGoogleMapController.animateMarkersPolyLinesBounds.value = true;

    mGoogleMapController.setLocation(
      MezLocation(
        "",
        MezLocation.buildLocationData(
          taxiRequest!.to.latitude,
          taxiRequest!.to.longitude,
        ),
      ),
    );

    // restaurant ad customer's location are fixed (fit in bound at start)
    await mGoogleMapController.addOrUpdateUserMarker(
      latLng: taxiRequest!.from.toLatLng(),
      markerId: "from",
      fitWithinBounds: true,
    );
    // customer's
    await mGoogleMapController.addOrUpdatePurpleDestinationMarker(
      latLng: taxiRequest!.to.toLatLng(),
      fitWithinBounds: true,
    );
    if (taxiRequest?.routeInformation != null)
      mGoogleMapController.decodeAndAddPolyline(
          encodedPolylineString:
              taxiRequest!.routeInformation!.encodedPolyLine);

    // if (shouldUpdate) {
    //   _listenToDriverLoc();
    // } else {
    //   await driverLocationStream?.cancel();
    //   driverLocationStream = null;
    // }
  }

  void _listenToDriverLoc() {
    mezDbgPrint("Start listening on driver location 😛");
    subscriptionId = _hasuraDb.createSubscription(start: () {
      _offersStreamSub = offerStream.listen((List<CustomerTaxiOffer> event) {
        mezDbgPrint("Stream value =========>${event.length}");
        _offers.value = event;
      });
      // driverLocationStream =
      //     listen_order_driver_location(orderId: deliveryOrderId)
      //         .listen((LatLng? event) {
      //   if (event != null) {
      //     mezDbgPrint(
      //         "Stream triggred from order map widget update driver 🤣 =====> $event");
      //     deliveryLocation.value = event;

      //     mGoogleMapController.addOrUpdateUserMarker(
      //       latLng: deliveryLocation.value!,
      //       markerId: "driver",
      //       customImgHttpUrl: driver.value?.image,
      //       fitWithinBounds: true,
      //     );
      //   }
      // });
    }, cancel: () {
      _offersStreamSub?.cancel();
      _offersStreamSub = null;
      driverLocationStream?.cancel();
      driverLocationStream = null;
    });
  }

  void dispose() {
    driverLocationStream?.cancel();
    driverLocationStream = null;
    _offerController.close();
  }

  void incrementOffer() {
    custOffer.value = custOffer.value + 10;
  }

  void decrementOffer() {
    if (custOffer > 40) {
      custOffer.value = custOffer.value - 10;
    }
  }

  Future<void> addOffersWithDelay() async {
    await Future.delayed(Duration(seconds: 12));
    for (CustomerTaxiOffer offer in offersToAdd) {
      List<CustomerTaxiOffer> newOffers = offers + [offersToAdd[offers.length]];

      _offerSink.add(newOffers);
      await Future.delayed(Duration(seconds: 8));
    }
  }

  Future<void> assignDriver(
      {required int driverId, required BuildContext context}) async {
    _selectedOffer.value = offers.firstWhereOrNull(
        (CustomerTaxiOffer element) => element.id == driverId);
    if (_selectedOffer.value != null) {
      offers.clear();
      Navigator.pop(context);
    }
  }

  Future<void> rejectOffer({required int driverId}) async {
    _offers.removeWhere((CustomerTaxiOffer element) => element.id == driverId);
  }
}

class CustomerTaxiOffer {
  final int id;
  final String driverName;
  final String driverImage;
  final DateTime expiryTime;

  CustomerTaxiOffer({
    required this.id,
    required this.driverName,
    required this.driverImage,
    required this.expiryTime,
  });
}
