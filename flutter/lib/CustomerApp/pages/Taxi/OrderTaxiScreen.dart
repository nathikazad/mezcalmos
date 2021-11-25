// Example of the View
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/components/customerAppBar.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/models/CustomerTaxiOrder.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/LocationSearchComponent.dart';
import 'package:mezcalmos/Shared/widgets/MezPickGoogleMap.dart';
import 'package:location/location.dart' as GeoLoc;
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
// import 'package:polyline/polyline.dart' as PolyEncoder;

enum SearchComponentType { From, To }

class OrderTaxiScreen extends StatefulWidget {
  @override
  _OrderTaxiScreenState createState() => _OrderTaxiScreenState();
}

class _OrderTaxiScreenState extends State<OrderTaxiScreen> {
  Location? _selectedFromLocation;
  Location? _selectedToLocation;
  bool showBlackScreen = true;
  bool _showFakeMarker = false;

  SearchComponentType selectedType = SearchComponentType.From;
  int _flexValueFrom = 3;
  int _flexValueTo = 3;
  bool _fromReadOnly = false;
  bool _toReadOnly = false;

  MyPopupMenuController _myPopupMenuController =
      Get.find<MyPopupMenuController>();
  late TaxiController controller;
  LanguageController _lang = Get.find<LanguageController>();
  RxList<Marker> _markers = <Marker>[].obs;
  Set<Polyline> _polylines = {};
  List<LatLng> polylinesPoints = [];
  late Marker _circleMarker;
  double _locationPickOptionsHeight = 0;
  FocusNode _fromFocusNode = FocusNode();
  FocusNode _toFocusNode = FocusNode();
  bool _animateMarkersAndPolylines = false;
  StreamSubscription? eventsListener;

  // Genetal Widget Utilities ------------------------------------------------------------

  /// This Function sets the Marker's Purple Circle and add it to the [_markers] List!
  ///
  /// NOTE : this also Sets the State , In order to refresh the markers and show it on the map.
  Future<void> setUpCircleMarker(GeoLoc.LocationData _loc) async {
    _circleMarker = Marker(
        markerId: MarkerId(Get.find<AuthController>().user!.uid),
        icon: await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(), aPurpleLocationCircle),
        flat: true,
        position: LatLng(_loc.latitude!, _loc.longitude!));

    setState(() {
      _markers.add(_circleMarker);
    });
  }

  Location? getLocationBySelectedField() {
    if (selectedType == SearchComponentType.To) {
      return _selectedToLocation;
    }

    return _selectedFromLocation;
  }

  void setLocationBySelectedField(GeoLoc.LocationData locData,
      {String address = ""}) {
    setState(() {
      if (selectedType == SearchComponentType.To) {
        _selectedToLocation = Location(address, locData);
      } else {
        _selectedFromLocation = Location(address, locData);
      }
    });
  }

  void hideFakeMarkerInCaseEmptyAddress() {
    if (_selectedToLocation?.address == "" &&
        _selectedFromLocation?.address == "")
      setState(() {
        _showFakeMarker = false;
      });
  }

  void unfocusBySelectedField() {
    if (selectedType == SearchComponentType.To) {
      _toFocusNode.unfocus();
    } else {
      _fromFocusNode.unfocus();
    }
  }

  bool checkIfAllLocationsSet() {
    return _selectedToLocation?.address != "" &&
        _selectedFromLocation?.address != "";
  }

  Future<bool> constructCustomerTaxiOrder() async {
    // we get the polyline Decoded Result !
    PolylineResult _resPloyLines = await PolylinePoints()
        .getRouteBetweenCoordinates(
            placesApikey,
            PointLatLng(_selectedToLocation!.position.latitude!,
                _selectedToLocation!.position.longitude!),
            PointLatLng(_selectedFromLocation!.position.latitude!,
                _selectedFromLocation!.position.longitude!));

    if (_resPloyLines.points.isNotEmpty) {
      // get the duration and destination !
      Map<String, dynamic> _durationAndDistance =
          await MapHelper.getDurationAndDistance(
              _selectedFromLocation!, _selectedToLocation!);

      // Successfully got distance and Duration !
      if (_durationAndDistance.isNotEmpty) {
        // we set the estimated price :
        // TODO : Calculate depending on How many KM.
        int _estimatedPrice = MapHelper.getEstimatedRidePriceInPesos(
            _durationAndDistance['distance']['value']);

        // this is used for Encoding.
        List<List<double>> _pnts = [];

        _resPloyLines.points.forEach((point) {
          _pnts.add([point.latitude, point.longitude]);
          polylinesPoints.add(LatLng(point.latitude, point.longitude));
        });

        /// TODO : Remove this , and get the encoded polyline string from [MapHelper.getDurationAndDistance]
        var encodedPolyLine = MapHelper.encodePolyline(_pnts, 5);
        controller.setCustomerTaxiOrder(CustomerTaxiOrder(
            from: _selectedFromLocation!,
            to: _selectedToLocation!,
            distance: RideDistance.fromJson(_durationAndDistance['distance']),
            duration: RideDuration.fromJson(_durationAndDistance['duration']),
            estimatedPrice: _estimatedPrice,
            paymentType: 'cash',
            polyline: encodedPolyLine));

        return true;
      }
    }
    return false;
  }

  // MezPickGoogleMap Callbacks ---------------------------------------------------------------------
  /// This is A callback used to Notify This widget when MezPickGoogleMap gets it's state Rebuilt.
  void mezPickGoogleMapNotifyParent(Location location, bool showBlackScreen) {
    setState(() {
      this.showBlackScreen = showBlackScreen;
      if (selectedType == SearchComponentType.From) {
        _selectedFromLocation = location;
        mezDbgPrint(
            "New < FROM > Location ===> ${location.toFirebaseFormattedJson()}");
      } else {
        _selectedToLocation = location;
        mezDbgPrint(
            "New < TO > Location ===> ${location.toFirebaseFormattedJson()}");
      }
    });
  }

  // From Text Field Callbacks -----------------------------------------------------------------------
  void fromTextFieldOnClear() {
    setState(() {
      _animateMarkersAndPolylines = false;
      _polylines.clear();
      _markers.removeWhere((element) => element.markerId.value == "from");
      _selectedFromLocation!.address = "";
      _fromReadOnly = false;
      hideFakeMarkerInCaseEmptyAddress();
    });
  }

  void fromTextFieldOnTextChanged(String value) {
    if (value.length >= 1) {
      setState(() {
        _locationPickOptionsHeight = 0;
      });
    } else {
      setState(() {
        _locationPickOptionsHeight = 100;
      });
    }
  }

  void fromTextFieldOnFocus() {
    setState(() {
      selectedType = SearchComponentType.From;
      _flexValueTo = 1;
      if (_locationPickOptionsHeight == 0) {
        _locationPickOptionsHeight = 100;
      }
    });
  }

  void fromTextFieldOnFocusLost() {
    setState(() {
      _flexValueTo = 3;
      _locationPickOptionsHeight = 0;
    });
  }

  void fromTextFieldNotifyParent(Location location, bool showBlackScreen) {
    mezDbgPrint("Ontap on suggestion  => ${location.toJson()} ");
    setState(() {
      this.showBlackScreen = showBlackScreen;
      _selectedFromLocation = location;
      _fromReadOnly = true;
      _flexValueFrom = 3;
      _flexValueTo = 3;
    });
  }

// To Text Field Callbacks ---------------------------------------------------------------------------
  void toTextFieldOnClear() {
    setState(() {
      _animateMarkersAndPolylines = false;
      _polylines.clear();
      _markers.removeWhere((element) => element.markerId.value == "to");
      _selectedToLocation!.address = "";
      _toReadOnly = false;
      hideFakeMarkerInCaseEmptyAddress();
    });
  }

  void toTextFieldOnTextChanged(String value) {
    if (value.length >= 1) {
      setState(() {
        _locationPickOptionsHeight = 0;
      });
    } else {
      setState(() {
        _locationPickOptionsHeight = 100;
      });
    }
  }

  void toTextFieldOnFocus() {
    setState(() {
      selectedType = SearchComponentType.To;
      _flexValueFrom = 1;
      if (_locationPickOptionsHeight == 0) {
        _locationPickOptionsHeight = 100;
      }
    });
  }

  void toTextFieldOnFocusLost() {
    setState(() {
      _flexValueFrom = 3;
      _locationPickOptionsHeight = 0;
    });
  }

  void toTextFieldNotifyParent(Location location, bool showBlackScreen) {
    mezDbgPrint(
        "notifyParent ===> TO ==> ${location.toFirebaseFormattedJson()} - $showBlackScreen");
    setState(() {
      this.showBlackScreen = showBlackScreen;
      _selectedToLocation = location;
      _toReadOnly = true;
      _flexValueFrom = 3;
      _flexValueTo = 3;
    });
  }

// DropDown on TextFields Callbacks ------------------------------------------------------------------
  /// When the user choses [Current Position] option from the Pick Choices on that DropDown.
  Future<void> textFieldsCurrentPositioOnTap() async {
    unfocusBySelectedField();
    GeoLoc.LocationData _loc = await GeoLoc.Location().getLocation();

    String? formattedAddress = (await MapHelper.getAdressFromLatLng(
            LatLng(_loc.latitude!, _loc.longitude!))) ??
        "Current Location";

    setLocationBySelectedField(_loc, address: formattedAddress);
    setState(() {
      _showFakeMarker = true;
      _locationPickOptionsHeight = 0;
      this.showBlackScreen = true;
    });
  }

  /// When the user choses [Pick From Map] option from the Pick Choices on that DropDown.
  void textFieldsPickFromMapOnTap() {
    setState(() {
      _locationPickOptionsHeight = 0;
      _showFakeMarker = true;
      unfocusBySelectedField();
    });
  }

  // Pick - Confirm - Cancel Button Click Callback ------------------------------------------------------------

  void onCancelButtonClick() async {
    ServerResponse resp = await controller.cancelTaxi();
    mezDbgPrint(resp.data);
    mezDbgPrint(resp.errorCode);
    mezDbgPrint(resp.errorMessage);
  }

  /// When the user Clicks the button at the Bottom [Pick] / [Confirm]
  void onConfirmButtonClick() async {
    if (_polylines.isEmpty) {
      Location? loc = getLocationBySelectedField();
      mezDbgPrint(selectedType.toString());
      mezDbgPrint(loc?.toJson());
      // get address!
      String? formattedAddress = (await MapHelper.getAdressFromLatLng(
              LatLng(loc!.latitude!, loc.longitude!))) ??
          "${loc.latitude.toString()}, ${loc.position.longitude.toString()}";

      setLocationBySelectedField(
          GeoLoc.LocationData.fromMap(
            {'latitude': loc.latitude, 'longitude': loc.longitude},
          ),
          address: formattedAddress);

      if (checkIfAllLocationsSet()) {
        // this is Filled with the decoded Polylines points!.
        // this is the From Bitmap Marker
        BitmapDescriptor toMarkerBitmap = await BitmapDescriptorLoader(
            (await cropRonded(
                (await rootBundle.load(purple_destination_marker_asset))
                    .buffer
                    .asUint8List())),
            60,
            60,
            isBytes: true);
        BitmapDescriptor fromMarkerBitmap = await BitmapDescriptorLoader(
            (await cropRonded((await http.get(Uri.parse(
                    Get.find<AuthController>().user!.image ?? aDefaultAvatar)))
                .bodyBytes) as Uint8List),
            60,
            60,
            isBytes: true);

        bool res = await constructCustomerTaxiOrder();

        if (!res) {
          // failed
          return;
        }

        setState(() {
          _showFakeMarker = false;
          _markers.assignAll([
            // to Marker
            Marker(
                markerId: MarkerId("to"),
                icon: toMarkerBitmap,
                position: LatLng(_selectedToLocation!.position.latitude!,
                    _selectedToLocation!.position.longitude!)),

            // From Marker
            Marker(
                markerId: MarkerId("from"),
                icon: fromMarkerBitmap,
                position: LatLng(_selectedFromLocation!.position.latitude!,
                    _selectedFromLocation!.position.longitude!)),
          ]);

          _polylines.add(Polyline(
              color: Color.fromARGB(255, 172, 89, 252),
              jointType: JointType.round,
              width: 2,
              startCap: Cap.buttCap,
              endCap: Cap.roundCap,
              polylineId: PolylineId('_poly_'),
              visible: true,
              points: polylinesPoints));

          _animateMarkersAndPolylines = true;
        });
      }

      // unfocusBySelectedField();
    } else {
      // confirm !
      // CustomerTaxiOrder _taxiOrder = CustomerTaxiOrder(from: _selectedFromLocation!, to: _selectedToLocation!, distance: distance, duration: duration, estimatedPrice: estimatedPrice, paymentType: paymentType, polyline: polyline)
      ServerResponse resp = await controller.requestTaxi();
      if (resp.success) {
        controller.setOrderId(resp.data['orderId']);
        controller.listenOnCreatedOrderNode();
        setState(() {});
      }
      mezDbgPrint("\n\n");
      mezDbgPrint(resp.status);
      mezDbgPrint(resp.data);
      mezDbgPrint(resp.errorMessage);
      mezDbgPrint(resp.errorCode);
    }
  }

  // Sub Widgets Blocks ------------------------------------------------------------------------------
  Widget cancelTextButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.red.shade400),
      child: TextButton(
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(Size(Get.width,
                  getSizeRelativeToScreen(20, Get.height, Get.width))),
              backgroundColor: MaterialStateProperty.all(Colors.transparent)),
          onPressed: onCancelButtonClick,
          child: Text("CANCEL",
              style: TextStyle(
                fontFamily: 'psr',
                color: Colors.white,
                fontSize: 18.sp,
              ))),
    );
  }

  Widget bottomBarWidget() {
    return Positioned(
        bottom: 20 + getSizeRelativeToScreen(20, Get.height, Get.width),
        left: 15,
        right: 15,
        child: Container(
            margin: EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(81, 132, 255, 1),
                Color.fromRGBO(206, 73, 252, 1)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Container(
              height: getSizeRelativeToScreen(25, Get.height, Get.width),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.getCustomerTaxiOrder!.decrementPrice();
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1)),
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Obx(
                            () => Text(
                              controller.getCustomerTaxiOrder?.estimatedPrice
                                      .toString() ??
                                  '-',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'psb',
                                  fontSize: 20),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.getCustomerTaxiOrder?.incrementPrice();
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1)),
                              child: Icon(
                                Icons.add,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  VerticalDivider(width: 1, color: Colors.grey.shade300),
                  Expanded(
                      child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(controller.getCustomerTaxiOrder?.distance
                                .distanceStringInKm ??
                            "-"),
                        Text(controller.getCustomerTaxiOrder?.duration
                                .daysHoursString ??
                            "-"),
                      ],
                    ),
                  ))
                ],
              ),
            )));
  }

  Widget locationPickChoicesWidget() {
    // Choice DropDown :
    // - Current location
    // - Pick from map
    // - TODO : Saved locations
    return Positioned(
        top: 68,
        left: 15,
        right: 15,
        child: AnimatedContainer(
            clipBehavior: Clip.hardEdge,
            duration: Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            height: _locationPickOptionsHeight,
            width: Get.width,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade200,
                  width: 1,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(0),
                )),
            child: Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: textFieldsCurrentPositioOnTap,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.location_on, color: Colors.purple),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Current Position.",
                        style: TextStyle(fontFamily: 'psb'),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: textFieldsPickFromMapOnTap,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.location_searching_outlined,
                          color: Colors.purple),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Pick from map.",
                        style: TextStyle(fontFamily: 'psb'),
                      )
                    ],
                  ),
                )
              ],
            )));
  }

  Widget topBarFromTextField() {
    return Expanded(
      flex: _flexValueFrom,
      child: LocationSearchComponent(
          readOnly: this._fromReadOnly,
          focusNode: this._fromFocusNode,
          dropDownDxOffset: -10,
          dropDownWidth: Get.width - 30,
          useBorders: false,
          leftTopRadius: 5,
          leftBotRaduis: 5,
          bgColor: Colors.white,
          labelStyle: TextStyle(fontFamily: 'psb', fontSize: 14),
          label: "From",
          text: _selectedFromLocation?.address,
          onClear: fromTextFieldOnClear,
          onTextChange: fromTextFieldOnTextChanged,
          onFocus: fromTextFieldOnFocus,
          onFocusLost: fromTextFieldOnFocusLost,
          notifyParent: fromTextFieldNotifyParent),
    );
  }

  Widget topBarMiddleLogo() {
    return Expanded(
        flex: 1,
        child: Stack(
            alignment: Alignment.center,
            fit: StackFit.passthrough,
            children: [
              VerticalDivider(
                color: Color.fromARGB(255, 236, 236, 236),
                thickness: 1,
              ),
              Container(
                padding: EdgeInsets.all(
                    getSizeRelativeToScreen(2.5, Get.height, Get.width)),
                height: getSizeRelativeToScreen(17, Get.height, Get.width),
                width: getSizeRelativeToScreen(17, Get.height, Get.width),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color.fromARGB(255, 216, 225, 249),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: Offset(0, 7)),
                  ],
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 97, 127, 255),
                    Color.fromARGB(255, 198, 90, 252),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: Center(
                  child: Image.asset('assets/images/logoWhite.png'),
                ),
              ),
            ]));
  }

  Widget topBarToTextField() {
    return Expanded(
      flex: _flexValueTo,
      child: LocationSearchComponent(
          readOnly: this._toReadOnly,
          focusNode: this._toFocusNode,
          useBorders: false,
          rightTopRaduis: 5,
          rightBotRaduis: 5,
          bgColor: Colors.white,
          // to Controll where to start our dropDown DX (Distance on X axis)
          dropDownDxOffset: -(Get.width / 2.5),
          dropDownWidth: Get.width - 30,
          labelStyle: TextStyle(fontFamily: 'psb', fontSize: 14),
          label: "To",
          text: _selectedToLocation?.address,
          onClear: toTextFieldOnClear,
          onTextChange: toTextFieldOnTextChanged,
          onFocus: toTextFieldOnFocus,
          onFocusLost: toTextFieldOnFocusLost,
          notifyParent: toTextFieldNotifyParent),
    );
  }

  // ------------------------------------------------------------------------------------------------------------------------
  /// ------------------------------------------------- [START OF WIDGET]-----------------------------------------------------
  // ------------------------------------------------------------------------------------------------------------------------

  @override
  void initState() {
    // We Inject the TaxiController !
    controller = Get.find<TaxiController>();

    eventsListener = controller.eventDispatcher.listen((event) {
      mezDbgPrint("EventDispatcher ====> $event");
      if (controller.isOrderRemoved(event)) {
        controller.cancelOrderListener();
        setState(() {
          _polylines.clear();
          _markers.clear();
          _animateMarkersAndPolylines = false;
          _fromReadOnly = false;
          _toReadOnly = false;
          _selectedFromLocation!.address = "";
          _selectedToLocation!.address = "";
          hideFakeMarkerInCaseEmptyAddress();
        });
      }
      // TODO : handle IsLooking!
    });
    // each depending on other
    GeoLoc.Location().getLocation().then((locData) {
      setUpCircleMarker(locData).then((_) {
        mezDbgPrint("Sat to current Location $locData!");
        setState(() {
          _selectedFromLocation = _selectedToLocation = Location.fromData({
            "address": "",
            "lat": locData.latitude,
            "lng": locData.longitude,
          });
        });
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    // controller.dispose();
    eventsListener?.cancel();
    eventsListener = null;
    mezDbgPrint(
        "OrderTaxiScreen :: dispose :: TaxiController got disposed !!!!!");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customerAppBar(AppBarLeftButtonType.Menu, _myPopupMenuController),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        // padding: EdgeInsets.only(left: 20, right: 20),
        child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: _selectedFromLocation != null
                    ? MezPickGoogleMap(
                        minMaxZoomPrefs: _animateMarkersAndPolylines
                            ? MinMaxZoomPreference.unbounded
                            : MinMaxZoomPreference(16, 17),
                        animateMarkersPolyLinesBounds:
                            _animateMarkersAndPolylines,
                        markers: _markers(),
                        polylines: _polylines,
                        myLocationButtonEnabled: false,
                        showFakeMarker: _showFakeMarker,
                        showBlackScreen: showBlackScreen,
                        blackScreenBottomTextMargin: 110,
                        notifyParent: mezPickGoogleMapNotifyParent,
                        location: LatLng(getLocationBySelectedField()!.latitude,
                            getLocationBySelectedField()!.longitude))
                    : Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                          strokeWidth: 1,
                        ),
                      ),
              ),
              Container(
                height: 40,
                width: Get.width,
                color: Colors.white,
              ),
              Positioned(
                top: 5,
                left: 15,
                right: 15,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color.fromARGB(60, 0, 0, 0),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0, 10)),
                    ],
                  ),
                  child: Row(
                    children: [
                      topBarFromTextField(),
                      topBarMiddleLogo(),
                      topBarToTextField()
                    ],
                  ),
                ),
              ),
              locationPickChoicesWidget(),
              _polylines.isNotEmpty ? bottomBarWidget() : SizedBox(),
              Positioned(
                bottom: 10,
                left: 15,
                right: 15,
                child:
                    Obx(() => controller.getCustomerTaxiOrder?.orderId == null
                        ? Container(
                            margin: EdgeInsets.only(bottom: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(81, 132, 255, 1),
                                    Color.fromRGBO(206, 73, 252, 1)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                            ),
                            child: TextButton(
                                style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all(Size(
                                        Get.width,
                                        getSizeRelativeToScreen(
                                            20, Get.height, Get.width))),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.transparent)),
                                onPressed: onConfirmButtonClick,
                                child: Text(
                                    _polylines.isNotEmpty
                                        ? "CONFIRM"
                                        : _lang.strings["shared"]
                                            ["pickLocation"]["pick"],
                                    style: TextStyle(
                                      fontFamily: 'psr',
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                    ))),
                          )
                        : cancelTextButton()),
              ),
            ]),
      ),
    );
  }
}

// StreamBuilder<List<Taxist>> getTaxistas() {
//   return StreamBuilder<List<Taxist>>(
//     stream: Get.find<TaxiController>().getTaxistsStream(),
//     builder: (ctx, snap) {
//       if (snap.hasData) {
//         mezDbgPrint("Stream Has DATA ====> ${snap.data}");
//         _taxists.assignAll(snap.data!);
//         _markers.clear();
//         snap.data!.forEach((taxisto) {
//           _markers.add(Marker(
//               markerId: MarkerId(taxisto.id),
//               icon: BitmapDescriptor.defaultMarker,
//               position: LatLng(
//                   taxisto.location.latitude!, taxisto.location.longitude!)));
//         });
//       }
//       return Container(
//         width: Get.width,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5), color: Colors.white),
//         child: _selectedLocation != null
//             ? MezPickGoogleMap(
//                 markers: _markers(),
//                 showFakeMarker: false,
//                 showBlackScreen: showBlackScreen,
//                 notifyParent: (Location location, bool showBlackScreen) {
//                   setState(() {
//                     this.showBlackScreen = showBlackScreen;
//                     _selectedLocation = location;
//                   });
//                 },
//                 location: LatLng(
//                     _selectedLocation!.latitude, _selectedLocation!.longitude))
//             : Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.black,
//                   strokeWidth: 1,
//                 ),
//               ),
//       );
//     },
//   );
// }
