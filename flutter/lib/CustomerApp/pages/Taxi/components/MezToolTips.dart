import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/Shared/widgets/ToolTipTrianglePainter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MezToolTips extends StatefulWidget {
  @override
  _MezToolTipsState createState() => _MezToolTipsState();
}

class _MezToolTipsState extends State<MezToolTips> {
  int hintIndex = 1;
  final _lang = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return hintIndex > 2
        ? SizedBox()
        : Container(
            color: Colors.black26,
            width: Get.width,
            height: Get.height,
            child: Stack(
              alignment: Alignment.bottomLeft,
              fit: StackFit.passthrough,
              children: [
                Positioned(
                    bottom: 150,
                    left: 25,
                    right: 50,
                    child: Stack(
                      fit: StackFit.passthrough,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10, left: 5, right: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children:
                                hintIndex == 1 ? firstHint() : secondHint(),
                          ),
                        ),
                        Positioned(
                            top: 5,
                            right: 5,
                            child: InkWell(
                              onTap: () {
                                if (hintIndex == 2) {
                                  Get.find<TaxiController>()
                                      .increaseNumOfTimesToolTipShownToUser();
                                }
                                setState(() {
                                  hintIndex += 1;
                                  mezDbgPrint("Added one +> $hintIndex");
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    shape: BoxShape.circle),
                                height: 20,
                                width: 20,
                                child: Center(
                                  child: Icon(
                                    Icons.close,
                                    size: 15,
                                    color: Colors.purple.shade400,
                                  ),
                                ),
                              ),
                            )),
                      ],
                    )),
                AnimatedPositioned(
                    duration: Duration(milliseconds: 500),
                    bottom: 150.5,
                    left: hintIndex == 1 ? 80 : 210,
                    child: CustomPaint(
                        painter: ToolTipTrianglePainter(
                            backGroundColor: Colors.white))),
              ],
            ),
          );
  }

  List<Widget> secondHint() {
    return [
      SizedBox(
        height: 10,
      ),
      Center(
        child: Text(
          _lang.strings['customer']['taxiView']['taxiRideCheckedTooltip'],
          textAlign: TextAlign.center,
          softWrap: true,
          maxLines: 10,
        ),
      ),
      SizedBox(
        height: 10,
      )
    ];
  }

  List<Widget> firstHint() {
    return [
      // Container(
      //   child: Image.asset(
      //     aTaxiRidePriceController,
      //     height: 80,
      //     width: 140,
      //   ),
      // ),
      SizedBox(
        height: 10,
      ),
      Center(
        child: Text(
          _lang.strings['customer']['taxiView']['taxiRidePriceTooltip'],
          textAlign: TextAlign.center,
          softWrap: true,
          maxLines: 10,
        ),
      ),
      SizedBox(
        height: 10,
      )
    ];
  }
}
