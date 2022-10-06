import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/RequestTaxiScreen/controllers/RequestTaxiController.dart';
import 'package:mezcalmos/Shared/constants/MezIcons.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Taxi"]["components"]["TaxiBottomBars"]["TaxiReqBottomBar"];

class TaxiReqBottomBar extends StatefulWidget {
  final Rx<TaxiRequest> taxiRequest;
  final RequestTaxiController viewController;
  const TaxiReqBottomBar({
    Key? key,
    required this.viewController,
    required this.taxiRequest,
  }) : super(key: key);

  @override
  _TaxiReqBottomBarState createState() => _TaxiReqBottomBarState();
}

class _TaxiReqBottomBarState extends State<TaxiReqBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 25,
      right: 15,
      left: 15,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 45),
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            incrementDecrementPrice(),
            Flexible(flex: 1, child: VerticalDivider()),
            Flexible(
              flex: 1,
              child: FittedBox(
                child: Row(
                  children: <Widget>[
                    Center(
                      child: Icon(
                        Icons.airline_seat_recline_normal_outlined,
                        size: 22,
                      ),
                    ),
                    Center(
                      child: Text(
                        "4",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(flex: 1, child: VerticalDivider()),
            rightRouteInfos(widget.taxiRequest.value),
          ],
        ),
      ),
    );
  }

  Widget incrementDecrementPrice() {
    return Flexible(
      flex: 2,
      child: Container(
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Material(
                shape: CircleBorder(),
                child: IconButton(
                  iconSize: 13.sp,
                  splashRadius: 18,
                  tooltip: _i18n()['decreasePrice'],
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    widget.taxiRequest.value.decrementPrice();
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.remove_circle_outline,
                    //size: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                '\$' + widget.taxiRequest.value.estimatedPrice.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Material(
                shape: CircleBorder(),
                child: IconButton(
                  iconSize: 13.sp,
                  splashRadius: 18,
                  tooltip: _i18n()['increasePrice'],
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    widget.taxiRequest.value.incrementPrice();
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.add_circle_outline,
                    //size: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rightRouteInfos(TaxiRequest taxiRequest) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
                Transform.rotate(
                  angle: 300,
                  child: Icon(
                    Icons.route,
                    size: 11.sp,
                  ),
                ),
                SizedBox(width: 2.w),
                Text(
                  taxiRequest.routeInformation?.distance.distanceStringInKm ??
                      "-",
                  overflow: TextOverflow.visible,
                  style: TextStyle(fontSize: 11.sp),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Icon(
                  MezcalmosIcons.stopwatch,
                  size: 11.sp,
                ),
                SizedBox(width: 2.w),
                Text(
                  taxiRequest.routeInformation?.duration.longTextVersion ?? "-",
                  overflow: TextOverflow.visible,
                  style: TextStyle(fontSize: 11.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
