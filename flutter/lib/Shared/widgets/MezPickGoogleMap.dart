import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  MezPickGoogleMap(
      {Key? key,
      required this.location,
      required this.notifyParent,
      this.showBlackScreen = true})
      : super(key: key);
  @override
  MezPickGoogleMapState createState() => MezPickGoogleMapState();
}

class MezPickGoogleMapState extends State<MezPickGoogleMap> {
  // shared original google map Key
  final GlobalKey<MGoogleMapState> mGoogleMapKey = GlobalKey();

  bool _showFakeMarker = true;
  bool _showLoading = false;

  RxList<Marker> markers = <Marker>[].obs;

  Future<LatLng?> getMapCenter() async {
    mezDbgPrint("ahahahahahh");
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
                notifyParent: _notifierLocationChange,
                markers: markers,
                initialLocation: widget.location,
                key: mGoogleMapKey,
                periodicRedrendring: false,
                myLocationButtonEnabled: true,
              ),
              _showFakeMarker ? pickerMarker() : SizedBox(),
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
                        padding:
                            EdgeInsets.only(bottom: 50, left: 20, right: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "You can Move the map if position is not precise.",
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
