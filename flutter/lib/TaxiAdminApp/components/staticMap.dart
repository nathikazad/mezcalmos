import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
// import 'package:mezcalmos/Shared/controllers/mapController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';

class StaticMap extends StatefulWidget {
  final LatLng pickUpLocation;
  final LatLng dropedOffLocation;
  final String imgUrl;
  final String from;
  final String to;
  StaticMap(this.pickUpLocation, this.dropedOffLocation, this.imgUrl, this.from,
      this.to);

  @override
  _StaticMapState createState() => _StaticMapState();
}

class _StaticMapState extends State<StaticMap> {
  var realtimeTracking;

  Completer<GoogleMapController> _gMapCompleter = Completer();

  GoogleMapController? _googleMapController;

  // CurrentOrderMapController? _currentOrderGoogleMapController;

  // IncomingOrderMapController? _IncomingOrderMapController;

  Set<Marker> _markers = <Marker>{};

  final Set<Polyline> _polyline = {};
  @override
  void initState() {
    super.initState();

    _polyline.add(
      Polyline(
        color: ui.Color.fromARGB(255, 172, 89, 252),
        polylineId: PolylineId("ID"),
        jointType: JointType.round,
        points: [widget.pickUpLocation, widget.dropedOffLocation],
        width: 2,
        startCap: Cap.buttCap,
        endCap: Cap.roundCap,
        // geodesic: true,
      ),
    );
  }

  // dynamic getCorespondingController() {
  //   dynamic res = realtimeTracking == null
  //       ? _currentOrderGoogleMapController
  //       : _IncomingOrderMapController;

  //   return res;
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height * 0.40,
          child: GoogleMap(
            padding: EdgeInsets.all(20),
            mapToolbarEnabled: false,
            myLocationButtonEnabled: false,
            minMaxZoomPreference: MinMaxZoomPreference(5, 18),
            buildingsEnabled: false,
            markers: _markers,
            polylines: _polyline,
            zoomControlsEnabled: false,
            compassEnabled: false,
            mapType: MapType.normal,
            tiltGesturesEnabled: true,
            initialCameraPosition: CameraPosition(
                target: widget.pickUpLocation,
                tilt: 9.440717697143555,
                zoom: 10),
            onMapCreated: (GoogleMapController _gController) async {
              _markers.addAll([
                Marker(
                    draggable: false,
                    // flat: true,
                    // anchor: ui.Offset(0.5, 1),
                    markerId: MarkerId("from"),
                    icon: await bitmapDescriptorLoader(
                      await cropRonded(
                          (await http.get(Uri.parse("${widget.imgUrl}")))
                              .bodyBytes) as Uint8List,
                      60,
                      60,
                      isBytes: true,
                    ),
                    visible: true,
                    position: widget.pickUpLocation),
                Marker(
                  draggable: false,
                  onTap: () => null,
                  onDragEnd: (value) => null,
                  // flat: true,
                  // anchor: ui.Offset(0.5, 1),
                  markerId: MarkerId("to"),
                  icon: GetStorage().read('destination_descriptor'),
                  visible: true,
                  position: widget.dropedOffLocation,
                ),
              ]);
              _googleMapController = _gController;
              await _gController.animateCamera(CameraUpdate.newLatLngBounds(
                  LatLngBounds(
                      southwest: widget.pickUpLocation,
                      northeast: widget.dropedOffLocation),
                  180));
              // dynamic _getBounds =
              //     getCorespondingController().getBounds();

              // if (_getBounds != null) {
              //   await _gController.animateCamera(
              //       CameraUpdate.newLatLngBounds(_getBounds, 180));
              //   await updateCameraLocation(
              //     new LatLng(getCorespondingController().from_lat,
              //         getCorespondingController().from_lng),
              //     new LatLng(
              //       getCorespondingController().to_lat,
              //       getCorespondingController().to_lng,
              //     ),
              //     _googleMapController,
              //   );
              // }

              _gMapCompleter.complete(_gController);
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          color: Colors.white,
          child: Row(
            // clipBehavior: Clip.hardEdge,
            // direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                // fit: FlexFit.tight,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, top: 12, bottom: 12, right: 8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "From",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              "${widget.from}",
                              style: TextStyle(fontSize: 16, fontFamily: 'psr'),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  // fit: FlexFit.tight,
                  child: Stack(
                      alignment: Alignment.center,
                      fit: StackFit.passthrough,
                      children: [
                        VerticalDivider(
                          color: Color.fromARGB(255, 236, 236, 236),
                          thickness: 1,
                        ),
                        Container(
                          padding: EdgeInsets.all(getSizeRelativeToScreen(
                              2.5, Get.height, Get.width)),
                          height: getSizeRelativeToScreen(
                              17, Get.height, Get.width),
                          width: getSizeRelativeToScreen(
                              17, Get.height, Get.width),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Color.fromARGB(255, 216, 225, 249),
                                  spreadRadius: 0,
                                  blurRadius: 5,
                                  offset: Offset(0, 7)),
                            ],
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 97, 127, 255),
                                  Color.fromARGB(255, 198, 90, 252),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                          ),
                          child: Center(
                            child: Image.asset(
                                'assets/images/shared/logoWhite.png'),
                          ),
                        ),
                      ])),
              Expanded(
                flex: 2,
                // fit: FlexFit.tight,
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 0, top: 12, bottom: 12, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "To",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            "${widget.to}", //13+..
                            style: TextStyle(fontSize: 16, fontFamily: 'psr'),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
