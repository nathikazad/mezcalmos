import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

class OrderMapWidget extends StatefulWidget {
  const OrderMapWidget(
      {super.key,
      required this.deliveryOrderId,
      required this.updateDriver,
      required this.polyline,
      required this.from,
      required this.to});
  final int deliveryOrderId;
  final bool updateDriver;
  final String? polyline;
  final MezLocation from;
  final MezLocation to;

  @override
  State<OrderMapWidget> createState() => _OrderMapWidgetState();
}

class _OrderMapWidgetState extends State<OrderMapWidget> {
  final MGoogleMapController mGoogleMapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );
  StreamSubscription<MezLocation?>? driverLocationStream;
  String? subscriptionId;
  @override
  void initState() {
    subscriptionId = hasuraDb.createSubscription(start: () {
      driverLocationStream = listen_on_restaurant_order_by_id(orderId: orderId)
          .listen((RestaurantOrder? event) {
        if (event != null) {
          mezDbgPrint(
              "Stream triggred from order map widget update driver 🤣 =====> ${event.dropoffDriver?.location?.toJson()}");
          order.value = event;
          order.value?.dropoffDriver = event.dropoffDriver;
          updateMapIfDeliveryPhase(order.value!.status);
        }
      });
    }, cancel: () {
      orderStream?.cancel();
      orderStream = null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<void> _initMap() async {
    // first time init map
    mGoogleMapController.periodicRerendering.value = true;
    mGoogleMapController.minMaxZoomPrefs =
        MinMaxZoomPreference.unbounded; // LEZEM
    mGoogleMapController.animateMarkersPolyLinesBounds.value = true;

    mGoogleMapController.setLocation(
      MezLocation(
        "",
        MezLocation.buildLocationData(
          widget.to.latitude,
          widget.to.longitude,
        ),
      ),
    );

    // restaurant ad customer's location are fixed (fit in bound at start)
    await mGoogleMapController.addOrUpdatePackageMarkerMarker(
      latLng: widget.from.toLatLng(),
      markerId: "from",
      fitWithinBounds: true,
    );
    // customer's
    await mGoogleMapController.addOrUpdatePurpleDestinationMarker(
      latLng: widget.to.toLatLng(),
      fitWithinBounds: true,
    );
    if (widget.polyline != null)
      mGoogleMapController.decodeAndAddPolyline(
          encodedPolylineString: widget.polyline!);
  }
}
