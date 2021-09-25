import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class MakeOrderScreen extends StatelessWidget {
  LanguageController lang = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    // Get.put<MezGoogleMapController>(MezGoogleMapController());

    return SafeArea(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // MezGoogleMap(false),
          Positioned(
              bottom: GetStorage().read(getxGmapBottomPaddingKey) + 55,
              child: Container(
                  height: getSizeRelativeToScreen(30, Get.height, Get.width),
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
                  child: TextButton(
                    onPressed: () => print("Pressed confirm button !"),
                    child: Text("CONFIRM"),
                  ))),
          Positioned(
            top: 10,
            child: Container(
              height: 65,
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
                  Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, top: 12, bottom: 12, right: 8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(
                                  () => Text(
                                    lang.strings['shared']['inputLocation']
                                        ["from"],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => null,
                                  child: Text("Enter Address."),
                                ),
                              ]))),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
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
                              height: getSizeRelativeToScreen(
                                  17, Get.height, Get.width),
                              width: getSizeRelativeToScreen(
                                  17, Get.height, Get.width),
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
                                child:
                                    Image.asset('assets/images/logoWhite.png'),
                              ),
                            ),
                          ])),
                  Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, top: 12, bottom: 12, right: 8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(
                                  () => Text(
                                    lang.strings['shared']['inputLocation']
                                        ["to"],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => null,
                                  child: Text("Enter Address."),
                                ),
                              ]))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//
// Order expired
// Customer canceled the order
// Another driver has picked up the order !
//