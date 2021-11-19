// Example of the View
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/components/customerAppBar.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/LocationSearchComponent.dart';
import 'package:mezcalmos/Shared/widgets/MezPickGoogleMap.dart';
import 'package:location/location.dart' as GeoLoc;
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  LanguageController _lang = Get.find<LanguageController>();
  RxList<Marker> _markers = <Marker>[].obs;
  Set<Polyline> _polylines = {};
  late Marker _circleMarker;
  double _locationPickOptionsHeight = 0;
  FocusNode _fromFocusNode = FocusNode();
  FocusNode _toFocusNode = FocusNode();

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

  // void buttonPressFunction() {
  //   if (_polylines.isEmpty) {
  //     Location loc = getLocationBySelectedField()!;
  //     setLocationBySelectedField(
  //         GeoLoc.LocationData.fromMap(
  //           loc.toJson(),
  //         ),
  //         address:
  //             "${loc.position.latitude.toString()}, ${loc.position.longitude.toString()}");
  //     unfocusBySelectedField();
  //   } else {
  //     // confirm !
  //     mezDbgPrint("To handle on confirm !");
  //   }
  // }

  @override
  void initState() {
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
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customerAppBar(AppBarLeftButtonType.Menu),
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
                        animateMarkersPolyLinesBounds: false,
                        markers: _markers(),
                        myLocationButtonEnabled: false,
                        showFakeMarker: _showFakeMarker,
                        showBlackScreen: showBlackScreen,
                        blackScreenBottomTextMargin: 110,
                        notifyParent:
                            (Location location, bool showBlackScreen) {
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
                        },
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
                      Expanded(
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
                            labelStyle:
                                TextStyle(fontFamily: 'psb', fontSize: 14),
                            label: "From",
                            text: _selectedFromLocation?.address,
                            onClear: () {
                              setState(() {
                                _showFakeMarker = false;
                                _selectedFromLocation!.address = "";
                                _fromReadOnly = false;
                                hideFakeMarkerInCaseEmptyAddress();
                              });
                            },
                            onTextChange: (_) {
                              if (_.length >= 1) {
                                setState(() {
                                  _locationPickOptionsHeight = 0;
                                });
                              } else {
                                setState(() {
                                  _locationPickOptionsHeight = 100;
                                });
                              }
                            },
                            onFocus: () {
                              setState(() {
                                selectedType = SearchComponentType.From;
                                _flexValueTo = 1;
                                if (_locationPickOptionsHeight == 0) {
                                  _locationPickOptionsHeight = 100;
                                }
                              });
                            },
                            onFocusLost: () {
                              setState(() {
                                _flexValueTo = 3;
                                _locationPickOptionsHeight = 0;
                              });
                            },
                            notifyParent:
                                (Location location, bool showBlackScreen) {
                              mezDbgPrint(
                                  "Ontap on suggestion  => ${location.toJson()} ");
                              setState(() {
                                this.showBlackScreen = showBlackScreen;
                                _selectedFromLocation = location;
                                _fromReadOnly = true;
                                _flexValueFrom = 3;
                                _flexValueTo = 3;
                              });
                            }),
                      ),
                      Expanded(
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
                                      getSizeRelativeToScreen(
                                          2.5, Get.height, Get.width)),
                                  height: getSizeRelativeToScreen(
                                      17, Get.height, Get.width),
                                  width: getSizeRelativeToScreen(
                                      17, Get.height, Get.width),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Color.fromARGB(
                                              255, 216, 225, 249),
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
                                        'assets/images/logoWhite.png'),
                                  ),
                                ),
                              ])),
                      Expanded(
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
                            labelStyle:
                                TextStyle(fontFamily: 'psb', fontSize: 14),
                            label: "To",
                            text: _selectedToLocation?.address,
                            onClear: () {
                              setState(() {
                                _selectedToLocation!.address = "";
                                _toReadOnly = false;
                                hideFakeMarkerInCaseEmptyAddress();
                              });
                            },
                            onTextChange: (_) {
                              if (_.length >= 1) {
                                setState(() {
                                  _locationPickOptionsHeight = 0;
                                });
                              } else {
                                setState(() {
                                  _locationPickOptionsHeight = 100;
                                });
                              }
                            },
                            onFocus: () {
                              setState(() {
                                selectedType = SearchComponentType.To;
                                _flexValueFrom = 1;
                                if (_locationPickOptionsHeight == 0) {
                                  _locationPickOptionsHeight = 100;
                                }
                              });
                            },
                            onFocusLost: () {
                              setState(() {
                                _flexValueFrom = 3;
                                _locationPickOptionsHeight = 0;
                              });
                            },
                            notifyParent:
                                (Location location, bool showBlackScreen) {
                              mezDbgPrint(
                                  "notifyParent ===> TO ==> ${location.toFirebaseFormattedJson()} - $showBlackScreen");
                              setState(() {
                                this.showBlackScreen = showBlackScreen;
                                _selectedToLocation = location;
                                _toReadOnly = true;
                                _flexValueFrom = 3;
                                _flexValueTo = 3;
                              });
                            }),
                      )
                    ],
                  ),
                ),
              ),

              // Choice container :
              // - Current location
              // - Pick from map
              // - Saved locations
              Positioned(
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
                            onTap: () async {
                              unfocusBySelectedField();
                              GeoLoc.LocationData _loc =
                                  await GeoLoc.Location().getLocation();
                              setLocationBySelectedField(_loc,
                                  address: "Current location.");
                              setState(() {
                                _showFakeMarker = true;
                                _locationPickOptionsHeight = 0;
                                this.showBlackScreen = true;
                              });
                            },
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
                            onTap: () {
                              setState(() {
                                _locationPickOptionsHeight = 0;
                                _showFakeMarker = true;
                                unfocusBySelectedField();
                              });
                            },
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
                      ))),
              Positioned(
                bottom: 10,
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
                  child: TextButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(
                              Get.width,
                              getSizeRelativeToScreen(
                                  20, Get.height, Get.width))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent)

                          // MaterialStateProperty.all(Color(0xffa8a8a8)),
                          ),
                      onPressed: () {
                        mezDbgPrint("Not implemented Yet !");
                      },
                      child:
                          Text(_lang.strings["shared"]["pickLocation"]["pick"],
                              style: TextStyle(
                                fontFamily: 'psr',
                                color: Colors.white,
                                fontSize: 18.sp,
                              ))),
                ),
              ),
            ]),
      ),
    );
  }
}
