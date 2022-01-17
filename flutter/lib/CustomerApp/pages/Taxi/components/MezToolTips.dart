import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 50),
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
                        children: hintIndex == 1 ? firstHint() : secondHint(),
                      ),
                    )
                  ]),
            ),
          );
  }

  List<Widget> secondHint() {
    return [
      Container(
          padding: EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.mark_email_read, size: 30),
              SizedBox(
                width: 10,
              ),
              Text(
                " 21",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )
            ],
          )),
      SizedBox(
        height: 20,
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
        height: 20,
      )
    ];
  }

  List<Widget> firstHint() {
    return [
      Container(
        child: Image.asset(
          aTaxiRidePriceController,
          height: 80,
          width: 140,
        ),
      ),
      SizedBox(
        height: 20,
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
        height: 20,
      )
    ];
  }
}
