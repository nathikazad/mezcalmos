import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/Shared/constants/MezIcons.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';

class TaxiReqBottomBar extends StatefulWidget {
  final TaxiRequest taxiRequest;
  const TaxiReqBottomBar({Key? key, required this.taxiRequest})
      : super(key: key);

  @override
  _TaxiReqBottomBarState createState() => _TaxiReqBottomBarState();
}

class _TaxiReqBottomBarState extends State<TaxiReqBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 25,
      right: 25,
      left: 25,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 45),
        height: getSizeRelativeToScreen(25, Get.height, Get.width),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                width: 1, color: Theme.of(context).scaffoldBackgroundColor),
            color: Colors.white),
        child: Row(
          children: [
            incrementDecrementPrice(),
            Expanded(flex: 1, child: VerticalDivider()),
            rightRouteInfos(widget.taxiRequest)
          ],
        ),
      ),
    );
  }

  Widget incrementDecrementPrice() {
    return Flexible(
      flex: 2,
      fit: FlexFit.tight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Material(
              shape: CircleBorder(),
              child: IconButton(
                iconSize: 18,
                splashRadius: 18,
                tooltip: 'Decrease the price',
                padding: EdgeInsets.zero,
                onPressed: () {
                  widget.taxiRequest.decrementPrice();
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
              '\$' + widget.taxiRequest.estimatedPrice.toString(),
              style: TextStyle(
                  color: Colors.black, fontFamily: 'psb', fontSize: 20),
            ),
            Material(
              shape: CircleBorder(),
              child: IconButton(
                iconSize: 18,
                splashRadius: 18,
                tooltip: 'Increase the price',
                padding: EdgeInsets.zero,
                onPressed: () {
                  widget.taxiRequest.incrementPrice();
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
    );
  }

  Widget rightRouteInfos(TaxiRequest taxiRequest) {
    // setState(() {});
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(
                  MezcalmosIcons.route,
                  size: (Get.height * 0.015).sp,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  taxiRequest.routeInformation?.distance.distanceStringInKm ??
                      "-",
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Icon(
                  MezcalmosIcons.stopwatch,
                  size: (Get.height * 0.015).sp,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                    taxiRequest.routeInformation?.duration.longTextVersion ??
                        "-",
                    overflow: TextOverflow.visible),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
