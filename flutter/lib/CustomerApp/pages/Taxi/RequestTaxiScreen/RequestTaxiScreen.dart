import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/componenets/FromToLocationBar.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezPickGoogleMap.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as GeoLoc;
import 'package:mezcalmos/TaxiApp/constants/assets.dart';

class RequestTaxiScreen extends StatefulWidget {
  @override
  _RequestTaxiScreenState createState() => _RequestTaxiScreenState();
}

class _RequestTaxiScreenState extends State<RequestTaxiScreen> {
  // MyPopupMenuController _popUpController = MyPopupMenuController();
  SearchComponentType _currentFocusedTextField = SearchComponentType.From;
  Rx<TaxiRequest> taxiRequest = TaxiRequest().obs;
  TaxiController controller = Get.find<TaxiController>();
  GlobalKey<FromToLocationBarState> _fromToGlobalStateKey =
      GlobalKey<FromToLocationBarState>();
  MezPickGoogleMapController mezPickGoogleMapController =
      MezPickGoogleMapController();
  bool _animateMarkersAndPolylines = false;
  RxList<Marker> _markers = <Marker>[].obs;
  Set<Polyline> _polylines = <Polyline>{};

  void checkPolylines() async {
    // if need for updating polyline
    // get polyline from gmaps
    // set mezPickGoogleMapController.setPolylines

    if (taxiRequest.value.isFromToSet()) {
      PolylineResult _resPloyLines = await PolylinePoints()
          .getRouteBetweenCoordinates(
              placesApikey,
              PointLatLng(taxiRequest.value.from!.latitude!,
                  taxiRequest.value.from!.longitude!),
              PointLatLng(taxiRequest.value.to!.latitude!,
                  taxiRequest.value.to!.longitude!));

      if (_resPloyLines.points.isNotEmpty) {
        // get the duration and destination !
        Map<String, dynamic> _durationAndDistance =
            await MapHelper.getDurationAndDistance(
                taxiRequest.value.from!, taxiRequest.value.to!);

        // Successfully got distance and Duration !
        if (_durationAndDistance.isNotEmpty) {
          // we set the estimated price :
          int _estimatedPrice = MapHelper.getEstimatedRidePriceInPesos(
              _durationAndDistance['distance']['value']);
          // this is used for Encoding.
          List<List<double>> _pnts = [];
          _resPloyLines.points.forEach((point) {
            _pnts.add([point.latitude, point.longitude]);
          });

          var encodedPolyLine = MapHelper.encodePolyline(_pnts, 5);
          taxiRequest.value.distance =
              RideDistance.fromJson(_durationAndDistance['distance']);
          taxiRequest.value.duration =
              RideDuration.fromJson(_durationAndDistance['duration']);
          taxiRequest.value.estimatedPrice = _estimatedPrice;
          taxiRequest.value.polyline = encodedPolyLine;

          // we create the polyline
          _polylines.add(Polyline(
              color: Color.fromARGB(255, 172, 89, 252),
              jointType: JointType.round,
              width: 2,
              startCap: Cap.buttCap,
              endCap: Cap.roundCap,
              polylineId: PolylineId('_poly_'),
              visible: true,
              points: _resPloyLines.points
                  .map<LatLng>((e) => LatLng(e.latitude, e.longitude))
                  .toList()));

          _animateMarkersAndPolylines = true;

          setState(() {});
        }
      }
    }
  }

  void addOrReplaceMarker(SearchComponentType textFieldType) async {
    BitmapDescriptor? _marker;
    LatLng? markerPosition;
    String? markerId;

    if (textFieldType == SearchComponentType.From) {
      // when the user clears a FormField , we have to clear the marker.
      _marker = await BitmapDescriptorLoader(
          (await cropRonded((await http.get(Uri.parse(
                  Get.find<AuthController>().user!.image ?? aDefaultAvatar)))
              .bodyBytes) as Uint8List),
          60,
          60,
          isBytes: true);
      markerPosition = LatLng(
          taxiRequest.value.from!.latitude, taxiRequest.value.from!.longitude);
      markerId = "from";
    }

    if (textFieldType == SearchComponentType.To) {
      _marker = await BitmapDescriptorLoader(
          (await cropRonded(
              (await rootBundle.load(purple_destination_marker_asset))
                  .buffer
                  .asUint8List())),
          60,
          60,
          isBytes: true);
      markerPosition = LatLng(
          taxiRequest.value.to!.latitude, taxiRequest.value.to!.longitude);
      markerId = "to";
    }

    if (_marker != null) {
      mezDbgPrint("ADDING MARKER WITH ID -------->> $markerId");
      _markers.removeWhere((element) => element.markerId.value == markerId);
      _markers.add(Marker(
          markerId: MarkerId(markerId!),
          icon: _marker,
          position: markerPosition!));

      mezPickGoogleMapController.shouldShowConfirmButton?.call(true);
      setState(() {});
    }
  }

  void removeMarker(SearchComponentType textFieldType) {
    String markerId = textFieldType.toString().split('.')[1].toLowerCase();
    _markers.removeWhere((element) => element.markerId.value == markerId);
    setState(() {});
  }

  @override
  void initState() {
    GeoLoc.Location().getLocation().then((GeoLoc.LocationData locData) {
      MapHelper.getAdressFromLatLng(
              LatLng(locData.latitude!, locData.longitude!))
          .then((address) {
        setState(() {
          taxiRequest.value.from = Location(
              address ??
                  "${locData.latitude.toString()}, ${locData.longitude.toString()}",
              locData);
          addOrReplaceMarker(_currentFocusedTextField);
        });

        mezPickGoogleMapController.setLocation?.call(taxiRequest.value.from!);
      });
    });

    super.initState();
  }

  // when one of the dropdowns (pick current location, a saved location or a places suggestion)
  void newLocationFromSearchBar(
      Location? newLocation, SearchComponentType textFieldType) {
    if (newLocation != null) {
      _currentFocusedTextField = textFieldType;
      if (textFieldType == SearchComponentType.From) {
        taxiRequest.value.from = newLocation;
      } else if (textFieldType == SearchComponentType.To) {
        taxiRequest.value.to = newLocation;
      }

      addOrReplaceMarker(textFieldType);
      mezPickGoogleMapController.setLocation?.call(newLocation);
    } else {
      removeMarker(textFieldType);
      _polylines.clear();
    }
    _fromToGlobalStateKey.currentState?.helper.collapse();
    setState(() {});
    // cuz inside the mezPickGoogleMap we set it to false when the user presses pick!
    mezPickGoogleMapController.showFakeMarker?.call();
  }

  // once the confirm button is clicked
  void newLocationFromMezPickGoogleMap(Location? _newLocation) {
    if (_newLocation != null) {
      mezDbgPrint(
          "Location NEW ($_currentFocusedTextField) _____ ___/ ${_newLocation.address}");

      if (_currentFocusedTextField == SearchComponentType.From) {
        taxiRequest.value.setFromLocation(_newLocation);
        mezDbgPrint(
            "New < FROM > Location ===> ${_newLocation.toFirebaseFormattedJson()}");
      } else if (_currentFocusedTextField == SearchComponentType.To) {
        taxiRequest.value.setToLocation(_newLocation);

        mezDbgPrint(
            "New < TO > Location ===> ${_newLocation.toFirebaseFormattedJson()}");
      }
      setState(() {});
      checkPolylines();
    }
  }

  void routeFinalizedFromMezPickGoogleMap(Location? location) async {
    // build order and call controller function
    ServerResponse _resp = await controller.requestTaxi(taxiRequest.value);
    if (_resp.success) {
      // we do not pop the RequestTaxiView because the user can cancel after and then we just have to pop the viewOrderRoute
      Get.toNamed(kTaxiOrderViewRoute);
      mezcalmosSnackBar("Success :)", _resp.errorMessage!,
          position: SnackPosition.TOP);
    } else {
      mezcalmosSnackBar("Error :(", "Failed to request a taxi !",
          position: SnackPosition.TOP);
      mezDbgPrint("Error requesting the taxi : ${_resp.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: customerAppBar(AppBarLeftButtonType.Menu),
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 1, right: 1),
        child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: MezPickGoogleMap(
                      mezPickGoogleMapController:
                          this.mezPickGoogleMapController,
                      minMaxZoomPrefs: _polylines.isNotEmpty
                          ? MinMaxZoomPreference.unbounded
                          : MinMaxZoomPreference(16, 17),
                      animateMarkersPolyLinesBounds:
                          _animateMarkersAndPolylines,
                      markers: _markers(),
                      polylines: _polylines,
                      myLocationButtonEnabled: false,
                      blackScreenBottomTextMargin: 110,
                      notifyParentOfPick: (newLocationPicked) {
                        _fromToGlobalStateKey.currentState?.helper.collapse();
                        mezPickGoogleMapController.showFakeMarker?.call();
                        addOrReplaceMarker(_currentFocusedTextField);
                        newLocationFromMezPickGoogleMap(newLocationPicked);
                        // -> construct the marker (depending if FROM / TO)
                      },
                      notifyParentOfConfirm: (_) {
                        routeFinalizedFromMezPickGoogleMap(_);
                      })),
              Container(
                height: 40,
                width: Get.width,
                color: Colors.white,
              ),
              FromToLocationBar(
                taxiRequest,
                newLocationFromSearchBar,
                key: _fromToGlobalStateKey,
              ),
            ]),
      ),
    );
  }

  Future<void> setUpCircleMarker(GeoLoc.LocationData _loc) async {
    Marker _circleMarker = Marker(
        markerId: MarkerId(Get.find<AuthController>().user!.uid),
        icon: await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(), aPurpleLocationCircle),
        flat: true,
        position: LatLng(_loc.latitude!, _loc.longitude!));

    setState(() {
      _markers.add(_circleMarker);
    });
  }
}
