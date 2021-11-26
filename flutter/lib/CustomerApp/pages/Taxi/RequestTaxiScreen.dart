import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/componenets/FromToLocationBar.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/componenets/LocationChoicesDropDown.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezPickGoogleMap.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as GeoLoc;

class RequestTaxiScreen extends StatefulWidget {
  @override
  _RequestTaxiScreenState createState() => _RequestTaxiScreenState();
}

class _RequestTaxiScreenState extends State<RequestTaxiScreen> {
  // MyPopupMenuController _popUpController = MyPopupMenuController();
  SearchComponentType _currentFocusedTextField = SearchComponentType.From;
  Rx<TaxiRequest> taxiRequest = TaxiRequest().obs;
  TaxiController controller = Get.find<TaxiController>();
  MezPickGoogleMapController mezPickGoogleMapController =
      MezPickGoogleMapController();

  RxList<Marker> _markers = <Marker>[].obs;
  Set<Polyline> _polylines = <Polyline>{};

  DropDownState ddState = DropDownState.Collapse;

  void checkPolylines() {}

  void newLocationFromChildren(
      Location newLocation, SearchComponentType textFieldType) {
    // from - to
    setState(() {
      _currentFocusedTextField = textFieldType;
      if (textFieldType == SearchComponentType.From) {
        taxiRequest.value.to = newLocation;
      } else if (textFieldType == SearchComponentType.To) {
        taxiRequest.value.to = newLocation;
      }
      mezPickGoogleMapController.setLocation
          ?.call(LatLng(newLocation.latitude, newLocation.longitude));
      // centers the map on location
      // onPick set > from / to
      // onConfirm only available when both from . to  are set !
    });

    checkPolylines();
  }

  void newLocationFromMezPickGoogleMap(Location location) {
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


  @override
  Widget build(BuildContext context) {
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
                      mezPickGoogleMapController:
                            this.mezPickGoogleMapController,
                        minMaxZoomPrefs: false
                            ? MinMaxZoomPreference.unbounded
                            : MinMaxZoomPreference(16, 17),
                      animateMarkersPolyLinesBounds: false,
                        markers: _markers(),
                        polylines: _polylines,
                        myLocationButtonEnabled: false,
                      blackScreenBottomTextMargin: 110,
                      notifyParent: newLocationFromMezPickGoogleMap)
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

            FromToLocationBar(taxiRequest, newLocationFromChildren,
                  (dropDownState) {
                setState(() {
                  this.ddState = dropDownState;
                });
              }),
              LocationChoicesDropDown(
              newLocationFromChildren,
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
