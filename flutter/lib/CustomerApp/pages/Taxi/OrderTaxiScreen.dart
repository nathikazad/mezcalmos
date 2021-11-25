// Example of the View
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:mezcalmos/CustomerApp/components/customerAppBar.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/taxiController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/LocationSearchComponent.dart';
import 'package:mezcalmos/Shared/widgets/MezPickGoogleMap.dart';
import 'package:location/location.dart' as GeoLoc;
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';

class OrderTaxiScreen extends StatefulWidget {
  OrderTaxiScreen() {
    Get.lazyPut<TaxiController>(() => TaxiController());
  }

  @override
  _OrderTaxiScreenState createState() => _OrderTaxiScreenState();
}

class _OrderTaxiScreenState extends State<OrderTaxiScreen> {
  Location? _selectedLocation;
  bool showBlackScreen = true;
  // RxList<Taxist> _taxists = <Taxist>[].obs;
  LanguageController _lang = Get.find<LanguageController>();
  RxList<Marker> _markers = <Marker>[].obs;
  MyPopupMenuController _myPopupMenuController =
      Get.find<MyPopupMenuController>();
  void onPickButtonClick() async {
    mezDbgPrint(
        "Last Location Stored Address ==> ${_selectedLocation!.address}");
    mezDbgPrint("Last Location Stored Lat ==> ${_selectedLocation!.latitude}");
    mezDbgPrint("Last Location Stored Lng ==> ${_selectedLocation!.longitude}");
    if (_selectedLocation!.address == "") {
      String? address = await getAdressFromLatLng(
          LatLng(_selectedLocation!.latitude!, _selectedLocation!.longitude!));

      _selectedLocation!.address = address ??
          "${_lang.strings['shared']['pickLocation']['address']} : ${_selectedLocation!.latitude}, ${_selectedLocation!.longitude}";
    }

    Get.back<Location>(result: _selectedLocation, closeOverlays: true);
  }

  @override
  void initState() {
    GeoLoc.Location().getLocation().then((locData) {
      mezDbgPrint("Sat to current Location $locData!");
      setState(() {
        _selectedLocation = Location.fromData({
          "address": "",
          "lat": locData.latitude,
          "lng": locData.longitude,
        });
      });
    });

    // _taxiController.getTaxistsStream().listen((taxi) {
    //   if (taxi != null) {
    //     mezDbgPrint("New Data ===> $taxi");
    //   }
    // });
    super.initState();
  }
//  Get.find<TaxiController>().getTaxistsStream().listen((taxists) {
//       if (taxists.isNotEmpty) {
//         mezDbgPrint("New Data ===> $taxists");
//         setState(() {
//           _taxists.assignAll(taxists);
//         });
//       }
//     });

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
                        flex: 3,
                        child: LocationSearchComponent(
                            useBorders: false,
                            leftTopRadius: 5,
                            leftBotRaduis: 5,
                            bgColor: Colors.white,
                            labelStyle:
                                TextStyle(fontFamily: 'psb', fontSize: 14),
                            label: "From",
                            text: _selectedLocation?.address,
                            onClear: () {},
                            notifyParent:
                                (Location location, bool showBlackScreen) {
                              mezDbgPrint(
                                  "Ontap on suggestion  => ${location.toJson()} ");
                              setState(() {
                                this.showBlackScreen = showBlackScreen;
                                _selectedLocation = location;
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
                        flex: 3,
                        child: LocationSearchComponent(
                            useBorders: false,
                            rightTopRaduis: 5,
                            rightBotRaduis: 5,
                            bgColor: Colors.white,
                            labelStyle:
                                TextStyle(fontFamily: 'psb', fontSize: 14),
                            label: "To",
                            text: _selectedLocation?.address,
                            onClear: () {},
                            notifyParent:
                                (Location location, bool showBlackScreen) {
                              mezDbgPrint(
                                  "Ontap on suggestion  => ${location.toJson()} ");
                              setState(() {
                                this.showBlackScreen = showBlackScreen;
                                _selectedLocation = location;
                              });
                            }),
                      )
                    ],
                  ),
                ),
              )
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
