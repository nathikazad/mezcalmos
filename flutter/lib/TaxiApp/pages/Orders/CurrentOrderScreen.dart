import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/mezcalmos_icons.dart';
import 'package:mezcalmos/Shared/widgets/MezcalmosGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/constants/taxiConstants.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';

class CurrentOrderScreen extends GetView<CurrentOrderController> {
  LanguageController lang = Get.find<LanguageController>();

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    controller.dispatchCurrentOrder();
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Obx(() => controller.waitingResponse || controller.value?.id == null
            ? Center(child: CircularProgressIndicator())
            : OrderGoogleMap(
                controller.value!,
                realtime: true,
              )),
        Positioned(
            bottom: GetStorage().read(getxGmapBottomPaddingKey),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              height: getSizeRelativeToScreen(30, Get.height, Get.width),
              width: getSizeRelativeToScreen(180, Get.height, Get.width),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                direction: Axis.horizontal,
                children: [
                  Flexible(
                    flex: 2,
                    child: Obx(() => TextButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(
                                getSizeRelativeToScreen(
                                    120, Get.height, Get.width),
                                getSizeRelativeToScreen(
                                    20, Get.height, Get.width))),
                            backgroundColor:
                                controller.value?.status != "inTransit"
                                    ? MaterialStateProperty.all(
                                        Color.fromARGB(255, 79, 168, 35))
                                    : MaterialStateProperty.all(
                                        Color.fromARGB(255, 234, 51, 38)),
                          ),
                          onPressed: () async =>
                              controller.value?.status == "inTransit"
                                  ? await MezcalmosSharedWidgets
                                      .yesNoDefaultConfirmationDialog(() async {
                                      Get.back();
                                      await controller.finishRide();
                                    },
                                          lang.strings['taxi']['taxiView']
                                              ["tooFarFromfinishRide"])
                                  : await MezcalmosSharedWidgets
                                      .yesNoDefaultConfirmationDialog(() async {
                                      Get.back();
                                      await controller.startRide();
                                    },
                                          lang.strings['taxi']['taxiView']
                                              ["tooFarFromstartRide"]),
                          child: Text(
                            controller.value?.status != "inTransit"
                                ? lang.strings['taxi']['taxiView']["startRide"]
                                : lang.strings['taxi']['taxiView']
                                    ["finishRide"],
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'psr'),
                          ),
                        )),
                  ),
                  Flexible(
                      flex: 1,
                      child: Text(
                          '\$' +
                              (controller.value?.estimatedPrice?.toString() ??
                                  "00"),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21))),
                  Flexible(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => null,
                            child: Container(
                              height: getSizeRelativeToScreen(
                                  20, Get.height, Get.width),
                              width: getSizeRelativeToScreen(
                                  20, Get.height, Get.width),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 232, 239, 254),
                                borderRadius: BorderRadius.circular(4),
                                // boxShadow: <BoxShadow>[BoxShadow(color: Color.fromARGB(255, 216, 225, 249), spreadRadius: 0, blurRadius: 1, offset: Offset(0, 5))],
                              ),
                              child: Center(
                                child: Icon(
                                  MezcalmosIcons.locationArrow,
                                  color: Color.fromARGB(255, 103, 121, 254),
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                          // GestureDetector(
                          //   onTap: () => null,
                          //   child: Container(
                          //     height: getSizeRelativeToScreen(
                          //         20, Get.height, Get.width),
                          //     width: getSizeRelativeToScreen(
                          //         20, Get.height, Get.width),
                          //     decoration: BoxDecoration(
                          //       color: Colors.blueGrey.shade50,
                          //       borderRadius: BorderRadius.circular(4),
                          //       // boxShadow: <BoxShadow>[BoxShadow(color: Color.fromARGB(255, 216, 225, 249), spreadRadius: 0, blurRadius: 1, offset: Offset(0, 5))],
                          //     ),
                          //     child: Center(
                          //       child: Icon(
                          //         CupertinoIcons.mail,
                          //         color: Colors.blue.shade200,
                          //         size: 25,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                          GestureDetector(
                            onTap: () async =>
                                await controller.cancelTaxi(null),
                            child: Container(
                              height: getSizeRelativeToScreen(
                                  20, Get.height, Get.width),
                              width: getSizeRelativeToScreen(
                                  20, Get.height, Get.width),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 247, 177, 179),
                                borderRadius: BorderRadius.circular(4),
                                // boxShadow: <BoxShadow>[BoxShadow(color: Color.fromARGB(255, 216, 225, 249), spreadRadius: 0, blurRadius: 1, offset: Offset(0, 5))],
                              ),
                              child: Center(
                                child: Icon(
                                 MezcalmosIcons.timesCircle,
                                  color: Color.fromARGB(255, 255, 0, 8),
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            )),
        Positioned(
          top: 10,
          child: Container(
            height: getSizeRelativeToScreen(30, Get.height, Get.width),
            width: getSizeRelativeToScreen(180, Get.height, Get.width),
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
            child: Stack(
              // direction: Axis.horizontal,
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              alignment: Alignment.center,
              children: [
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Container(
                  padding: EdgeInsets.all(
                      getSizeRelativeToScreen(2.5, Get.height, Get.width)),
                  height: getSizeRelativeToScreen(20, Get.height, Get.width),
                  width: getSizeRelativeToScreen(20, Get.height, Get.width),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color.fromARGB(255, 216, 225, 249),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: Offset(0, 7)),
                    ],
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 97, 127, 255),
                      Color.fromARGB(255, 198, 90, 252),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  ),
                  child: Center(
                    child: Image.asset('assets/images/logoWhite.png'),
                  ),
                ),
                Positioned(
                  left: 25,
                  top: 13,
                  child: Text(
                    lang.strings['shared']['inputLocation']["from"],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  left: 25,
                  top: 30,
                  child: GestureDetector(
                      onTap: () => mezcalmosSnackBar(
                          lang.strings['shared']['inputLocation']["from"],
                          controller.value?.from?.address ?? ""),
                      child: Obx(
                        () => Text(
                          (controller.value?.from?.address
                                      .toString()
                                      .substring(0, 13) ??
                                  "..........") +
                              " ..", //13+..
                          style: TextStyle(fontSize: 16, fontFamily: 'psr'),
                        ),
                      )),
                ),
                Positioned(
                  left: (getSizeRelativeToScreen(180, Get.height, Get.width) /
                          2) +
                      40,
                  top: 13,
                  child: Text(
                    lang.strings['shared']['inputLocation']["to"],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  left: (getSizeRelativeToScreen(180, Get.height, Get.width) /
                          2) +
                      40,
                  top: 30,
                  child: GestureDetector(
                      onTap: () => mezcalmosSnackBar(
                          lang.strings['shared']['inputLocation']["to"],
                          controller.value?.to?.address ?? ""),
                      child: Obx(
                        () => Text(
                          (controller.value?.to?.address
                                      .toString()
                                      .substring(0, 13) ??
                                  "..........") +
                              " ..", //13+..
                          style: TextStyle(fontSize: 16, fontFamily: 'psr'),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return Obx(() => controller.id == null  || controller.waitingResponse ? Center(child: CircularProgressIndicator()) : Center(child: Container(

//     alignment: Alignment.center,
//     color: Colors.white,

//     child: Flex(direction: Axis.vertical,
//       mainAxisAlignment: MainAxisAlignment.center,

//       children: [
//         Flexible(child: Text('CURRENT ORDER ID :')),
//         SizedBox(height: 20,),
//         Flexible(child: Text(controller.id)),
//         SizedBox(height: 50,),
//         TextButton(onPressed: () async  =>  await   controller.cancelTaxi("Testing purposes !"), child: Text("CANCEL TAXI" , style: TextStyle(color: Colors.white , fontSize: 20),),
//           style: ButtonStyle(
//             fixedSize: MaterialStateProperty.all(Size(200, 50)) ,
//             backgroundColor: MaterialStateProperty.all(Colors.black)
//           ),
//         ),
//         SizedBox(height: 20,),
//         TextButton(onPressed: () async  =>  await   controller.startRide(), child: Text("START RIDE" , style: TextStyle(color: Colors.white , fontSize: 20),),
//           style: ButtonStyle(
//             fixedSize: MaterialStateProperty.all(Size(200, 50)) ,
//             backgroundColor: MaterialStateProperty.all(Colors.black)
//           ),
//         ),
//         SizedBox(height: 20,),
//         TextButton(onPressed:  () async  =>  await controller.finishRide() , child: Text("FINISH RIDE" , style: TextStyle(color: Colors.white , fontSize: 20),),
//           style: ButtonStyle(
//             fixedSize: MaterialStateProperty.all(Size(200, 50)) ,
//             backgroundColor: MaterialStateProperty.all(Colors.black)
//           ),
//         ),
//         SizedBox(height: 20,),
//       ],
//     ),

//   )));
// }
