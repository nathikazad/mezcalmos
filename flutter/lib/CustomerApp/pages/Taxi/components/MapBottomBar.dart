import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/Shared/Themes/styles/textStyleTheme.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapBottomBar extends StatefulWidget {
  TaxiRequest taxiRequest;
  bool isOrderCanceled;
  MapBottomBar({required this.taxiRequest, required this.isOrderCanceled});

  @override
  State<MapBottomBar> createState() {
    return _MapBottomBarState();
  }
}

class _MapBottomBarState extends State<MapBottomBar> {
  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Positioned(
        bottom: 10 + getSizeRelativeToScreen(20, Get.height, Get.width),
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
              child: !widget.isOrderCanceled
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    widget.taxiRequest.decrementPrice();
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
                                Text(
                                  widget.taxiRequest.estimatedPrice.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'psb',
                                      fontSize: 20),
                                ),
                                InkWell(
                                  onTap: () {
                                    widget.taxiRequest.incrementPrice();
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
                        Expanded(
                            flex: 1,
                            child: VerticalDivider(
                                width: 1, color: Colors.grey.shade300)),
                        Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Icon(MezcalmosIcons.route,
                                        size: getSizeRelativeToScreen(
                                                32, Get.width.w, Get.height.h)
                                            .w),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(widget.taxiRequest.routeInformation
                                            ?.distance.distanceStringInKm ??
                                        "-"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(MezcalmosIcons.stopwatch,
                                        size: getSizeRelativeToScreen(
                                                32, Get.width.w, Get.height.h)
                                            .w),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(widget.taxiRequest.routeInformation
                                            ?.duration.daysHoursString ??
                                        "-"),
                                  ],
                                )
                              ],
                            ))
                      ],
                    )
                  : Center(
                      child: Text(
                        "Order has been canceled !",
                        style: textStyleTheme.headline1!.copyWith(
                          color: Colors.red,
                        ),
                      ),
                    ),
            )));
  }
}
