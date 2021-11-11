import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';

class IncomingPositionedFromToTopBar extends StatelessWidget {
  IncomingOrdersController controller = Get.find<IncomingOrdersController>();
  LanguageController lang = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      child: Container(
        // height: 65,
        width: Get.width / 1.05,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color.fromARGB(255, 216, 225, 249),
                  spreadRadius: 0,
                  blurRadius: 7,
                  offset: Offset(0, 7)),
            ]),

        child: Flex(
          clipBehavior: Clip.hardEdge,
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              // fit: FlexFit.tight,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, top: 12, bottom: 12, right: 8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => Text(
                              lang.strings['shared']['inputLocation']["from"],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        Obx(
                          () => GestureDetector(
                            onTap: () => mezcalmosSnackBar(
                                lang.strings['shared']['inputLocation']["from"],
                                controller
                                        .selectedIncommingOrder?.from.address ??
                                    ""),
                            child: Text(
                              controller.selectedIncommingOrder?.from.address ??
                                  ".........",
                              style: TextStyle(fontSize: 15, fontFamily: 'psr'),
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                // fit: FlexFit.tight,
                child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.passthrough,
                    children: [
                      VerticalDivider(
                        color: Color.fromARGB(255, 236, 236, 236),
                        thickness: 1,
                      ),
                      Container(
                        padding: EdgeInsets.all(getSizeRelativeToScreen(
                            2.5, Get.height, Get.width)),
                        height:
                            getSizeRelativeToScreen(17, Get.height, Get.width),
                        width:
                            getSizeRelativeToScreen(17, Get.height, Get.width),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Color.fromARGB(255, 216, 225, 249),
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
                          child: Image.asset('assets/images/logoWhite.png'),
                        ),
                      ),
                    ])),
            Expanded(
              flex: 2,
              // fit: FlexFit.tight,
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 0, top: 12, bottom: 12, right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Text(
                          lang.strings['shared']['inputLocation']["to"],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Obx(
                        () => GestureDetector(
                          onTap: () => mezcalmosSnackBar(
                              lang.strings['shared']['inputLocation']["to"],
                              controller.selectedIncommingOrder?.to.address ??
                                  ""),
                          child: Text(
                            controller.selectedIncommingOrder?.to.address ??
                                ".........",
                            style: TextStyle(fontSize: 16, fontFamily: 'psr'),
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
