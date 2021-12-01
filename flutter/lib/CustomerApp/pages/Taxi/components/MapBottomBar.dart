import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class MapBottomBar extends StatefulWidget {
  Rx<TaxiRequest> taxiRequest;
  MapBottomBar({required this.taxiRequest});

  @override
  State<MapBottomBar> createState() {
    return _MapBottomBarState();
  }
}

class _MapBottomBarState extends State<MapBottomBar> {
  @override
  Widget build(BuildContext context) {
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
                              widget.taxiRequest.value.decrementPrice();
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
                            widget.taxiRequest.value.estimatedPrice.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'psb',
                                fontSize: 20),
                          ),
                          InkWell(
                            onTap: () {
                              widget.taxiRequest.value.incrementPrice();
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
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(widget.taxiRequest.value.routeInformation?.distance
                              .distanceStringInKm ??
                          "-"),
                      Text(widget.taxiRequest.value.routeInformation?.duration
                              .daysHoursString ??
                          "-"),
                    ],
                  ))
                ],
              ),
            )));
  }
}
