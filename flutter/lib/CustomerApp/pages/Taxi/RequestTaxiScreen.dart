import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/components/customerAppBar.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/componenets/FromToLocationBar.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/componenets/LocationChoicesDropDown.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezPickGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as GeoLoc;

class RequestTaxiScreen extends StatefulWidget {
  @override
  _RequestTaxiScreenState createState() => _RequestTaxiScreenState();
}

class _RequestTaxiScreenState extends State<RequestTaxiScreen> {
  MyPopupMenuController _popUpController = MyPopupMenuController();
  SearchComponentType _currentFocusedTextField = SearchComponentType.From;
  bool _animateMarkersAndPolylines = false;
  Rx<TaxiRequest> taxiRequest = TaxiRequest().obs;
  TaxiController controller = Get.find<TaxiController>();
  bool _showBlackScreen = false;

  RxList<Marker> _markers = <Marker>[].obs;
  Set<Polyline> _polylines = <Polyline>{};
  bool _showFakeMarker = false;
  late Marker _circleMarker;

  DropDownState ddState = DropDownState.Collapse;

  void checkPolylines() {}
  void notifier(Location? newLocation, SearchComponentType textFieldType) {
    // from - to
    setState(() {
      _currentFocusedTextField = textFieldType;
      if (textFieldType == SearchComponentType.From) {
        _showBlackScreen = true;
        taxiRequest.value.from = newLocation;
      } else if (textFieldType == SearchComponentType.To) {
        _showBlackScreen = true;
        taxiRequest.value.to = newLocation;
      }
      // centers the map on location
      // onPick set > from / to
      // onConfirm only available when both from . to  are set !
    });

    checkPolylines();
  }

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

  @override
  void initState() {
    GeoLoc.Location().getLocation().then((locData) {
      setUpCircleMarker(locData).then((_) {
        mezDbgPrint("Sat to current Location $locData!");
        // get address once !
        MapHelper.getAdressFromLatLng(
                LatLng(locData.latitude!, locData.longitude!))
            .then((address) {
          setState(() {
            taxiRequest.value.from = Location.fromData({
              "address": address,
              "lat": locData.latitude,
              "lng": locData.longitude,
            });
          });
          mezDbgPrint(taxiRequest);
          mezDbgPrint(taxiRequest.value.from);
        });
      });
    });
    super.initState();
  }

  void mezPickGoogleMapNotifyParent(Location location) {
    setState(() {
      if (_currentFocusedTextField == SearchComponentType.From) {
        taxiRequest.value.from = location;
        mezDbgPrint(
            "New < FROM > Location ===> ${location.toFirebaseFormattedJson()}");
      } else if (_currentFocusedTextField == SearchComponentType.To) {
        taxiRequest.value.to = location;
        mezDbgPrint(
            "New < TO > Location ===> ${location.toFirebaseFormattedJson()}");
      }
    });
  }

  Location? getLocationBySelectedField() {
    mezDbgPrint(_currentFocusedTextField);
    mezDbgPrint("From ===> ${taxiRequest.value.from?.toJson()}");
    mezDbgPrint("To ===> ${taxiRequest.value.to?.toJson()}");

    mezDbgPrint(_currentFocusedTextField);
    if (_currentFocusedTextField == SearchComponentType.From) {
      return taxiRequest.value.from;
    } else if (_currentFocusedTextField == SearchComponentType.To) {
      return taxiRequest.value.to;
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    // return Column(children: [
    //   FromToLocationBar(taxiRequest, notifier),
    //   LocationChoicesDropDown(notifier),
    //   MezPickGoogleMap(location: _fromLocation, notifyParent: (newLocation) {})
    // ]);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: customerAppBar(AppBarLeftButtonType.Menu),
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: taxiRequest.value.from != null
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
                        showBlackScreen: _showBlackScreen,
                        blackScreenBottomTextMargin: 110,
                        notifyParent: mezPickGoogleMapNotifyParent,
                        location: LatLng(getLocationBySelectedField()!.latitude,
                            getLocationBySelectedField()!.longitude))
                    : Center(
                        child: CircularProgressIndicator(
                          color: Colors.purple,
                          strokeWidth: 1,
                        ),
                      ),
              ),
              Container(
                height: 40,
                width: Get.width,
                color: Colors.white,
              ),

              FromToLocationBar(taxiRequest, notifier, (dropDownState) {
                setState(() {
                  this.ddState = dropDownState;
                });
              }),
              LocationChoicesDropDown(
                notifier,
                initialDropDownState: this.ddState,
              ),
              // _polylines.isNotEmpty ? bottomBarWidget() : SizedBox(),
              // Positioned(
              //   bottom: 10,
              //   left: 15,
              //   right: 15,
              //   child:
              //       Obx(() => controller.getCustomerTaxiOrder?.orderId == null
              //           ? Container(
              //               margin: EdgeInsets.only(bottom: 30),
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(5),
              //                 gradient: LinearGradient(
              //                     colors: [
              //                       Color.fromRGBO(81, 132, 255, 1),
              //                       Color.fromRGBO(206, 73, 252, 1)
              //                     ],
              //                     begin: Alignment.topLeft,
              //                     end: Alignment.bottomRight),
              //               ),
              //               child: TextButton(
              //                   style: ButtonStyle(
              //                       fixedSize: MaterialStateProperty.all(Size(
              //                           Get.width,
              //                           getSizeRelativeToScreen(
              //                               20, Get.height, Get.width))),
              //                       backgroundColor: MaterialStateProperty.all(
              //                           Colors.transparent)),
              //                   onPressed: onConfirmButtonClick,
              //                   child: Text(
              //                       _polylines.isNotEmpty
              //                           ? "CONFIRM"
              //                           : _lang.strings["shared"]
              //                               ["pickLocation"]["pick"],
              //                       style: TextStyle(
              //                         fontFamily: 'psr',
              //                         color: Colors.white,
              //                         fontSize: 18.sp,
              //                       ))),
              //             )
              //           : cancelTextButton()),
              // ),
            ]),
      ),
    );
  }
}
