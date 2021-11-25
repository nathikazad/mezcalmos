import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef LocationChangesNotifier = void Function(
    Location location, bool showBlackScreen);

// Google Map Pick Widget
class MezPickGoogleMap extends StatefulWidget {
  final LatLng location;
  final LocationChangesNotifier notifyParent;
  bool showBlackScreen;
  double blackScreenBottomTextMargin;
  bool showFakeMarker;
  List<Marker> markers;
  Set<Polyline> polylines;
  bool myLocationButtonEnabled;
  bool animateMarkersPolyLinesBounds;
  MinMaxZoomPreference minMaxZoomPrefs;

  MezPickGoogleMap(
      {Key? key,
      required this.location,
      required this.notifyParent,
      this.blackScreenBottomTextMargin = 0,
      this.myLocationButtonEnabled = true,
      this.showFakeMarker = true,
      this.showBlackScreen = true,
      this.polylines = const {},
      this.animateMarkersPolyLinesBounds = true,
      this.minMaxZoomPrefs = MinMaxZoomPreference.unbounded,
      this.markers = const []})
      : super(key: key);
  @override
  MezPickGoogleMapState createState() => MezPickGoogleMapState();
}

class MezPickGoogleMapState extends State<MezPickGoogleMap> {
  // shared original google map Key
  final GlobalKey<MGoogleMapState> mGoogleMapKey = GlobalKey();
  final LanguageController _lang = Get.find<LanguageController>();

  bool _showLoading = false;

  Future<LatLng?> getMapCenter() async {
    return await mGoogleMapKey.currentState?.getMapCenter();
  }

  @override
  void didUpdateWidget(MezPickGoogleMap oldWidget) {
    if (this.widget.location != oldWidget.location) {
      mezDbgPrint("MezPickedGMap did updated => Location changed !!!");
      setState(() {
        _showLoading = true;
        mGoogleMapKey.currentState?.moveToNewLatLng(
            widget.location.latitude, widget.location.longitude);
        _showLoading = false;
        // _showBlackScreen = true;
      });
    }

    super.didUpdateWidget(oldWidget);
  }

  Widget pickerMarker() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 30),
        color: Colors.transparent,
        height: 30,
        width: 20,
        child: ClipRect(
          child: Image.asset(
            "assets/images/PurpleLocationPicker.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void _notifierLocationChange(Location newLoc, bool showBlackScreen) {
    widget.notifyParent(newLoc, showBlackScreen);
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return _showLoading == false
        ? Stack(
            alignment: Alignment.center,
            children: [
              MGoogleMap(
                polylines: widget.polylines,
                animateMarkersPolyLinesBounds:
                    widget.animateMarkersPolyLinesBounds,
                notifyParent: _notifierLocationChange,
                markers: widget.markers,
                initialLocation: widget.location,
                key: mGoogleMapKey,
                minMaxZoomPrefs: widget.minMaxZoomPrefs,
                periodicRedrendring: false,
                myLocationButtonEnabled: widget.myLocationButtonEnabled,
              ),
              widget.showFakeMarker ? pickerMarker() : SizedBox(),
              widget.showBlackScreen
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.showBlackScreen = false;
                        });
                      },
                      child: Container(
                        width: Get.width,
                        color: Colors.black45,
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.only(
                            bottom: widget.blackScreenBottomTextMargin,
                            left: 10,
                            right: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Icon(
                                Icons.open_with,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                _lang.strings["shared"]["inputLocation"]
                                    ["moveMapIfNotPrecise"],
                                // "You can move the map if position is not precise.",
                                overflow: TextOverflow.visible,
                                softWrap: true,
                                textAlign: TextAlign.center,
                                // maxLines: ,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'psb',
                                    fontSize: 20.sp),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          )
        : Center(child: CircularProgressIndicator());
  }
}
