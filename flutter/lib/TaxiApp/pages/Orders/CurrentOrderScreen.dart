import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezcalmosGoogleMap.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';

class CurrentOrderScreen extends GetView<CurrentOrderController> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Obx(() => controller.waitingResponse || controller.value?.id == null ? Center(child: CircularProgressIndicator()) : OrderGoogleMap(controller.value!)),
        Positioned(
            bottom: 35,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              height: getSizeRelativeToScreen(30, Get.height, Get.width),
              width: getSizeRelativeToScreen(180, Get.height, Get.width),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), boxShadow: <BoxShadow>[
                BoxShadow(color: Color.fromARGB(255, 216, 225, 249), spreadRadius: 0, blurRadius: 7, offset: Offset(0, 7)),
              ]),
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                direction: Axis.horizontal,
                children: [
                  Flexible(
                    flex: 1,
                    child: TextButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(getSizeRelativeToScreen(120, Get.height, Get.width), getSizeRelativeToScreen(20, Get.height, Get.width))),
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 79, 168, 35)),
                      ),
                      onPressed: () async => null,
                      child: Text(
                        "Start Ride",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Flexible(flex: 1, child: Text("\$50", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21))),
                  Flexible(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () => null,
                            child: Container(
                              height: getSizeRelativeToScreen(20, Get.height, Get.width),
                              width: 38,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(5),
                                // boxShadow: <BoxShadow>[BoxShadow(color: Color.fromARGB(255, 216, 225, 249), spreadRadius: 0, blurRadius: 1, offset: Offset(0, 5))],
                              ),
                              child: Center(
                                child: Icon(
                                  CupertinoIcons.location_fill,
                                  color: Colors.blue.shade200,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => null,
                            child: Container(
                              height: getSizeRelativeToScreen(20, Get.height, Get.width),
                              width: 38,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.shade50,
                                borderRadius: BorderRadius.circular(5),
                                // boxShadow: <BoxShadow>[BoxShadow(color: Color.fromARGB(255, 216, 225, 249), spreadRadius: 0, blurRadius: 1, offset: Offset(0, 5))],
                              ),
                              child: Center(
                                child: Icon(
                                  CupertinoIcons.mail,
                                  color: Colors.blue.shade200,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async => await controller.cancelTaxi("test-reasons"),
                            child: Container(
                              height: getSizeRelativeToScreen(20, Get.height, Get.width),
                              width: 38,
                              decoration: BoxDecoration(
                                color: Colors.red.shade100,
                                borderRadius: BorderRadius.circular(5),
                                // boxShadow: <BoxShadow>[BoxShadow(color: Color.fromARGB(255, 216, 225, 249), spreadRadius: 0, blurRadius: 1, offset: Offset(0, 5))],
                              ),
                              child: Center(
                                child: Icon(
                                  CupertinoIcons.clear_circled,
                                  color: Colors.red.shade300,
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
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), boxShadow: <BoxShadow>[
              BoxShadow(color: Color.fromARGB(255, 216, 225, 249), spreadRadius: 0, blurRadius: 7, offset: Offset(0, 7)),
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
                  padding: EdgeInsets.all(getSizeRelativeToScreen(2.5, Get.height, Get.width)),
                  height: getSizeRelativeToScreen(20, Get.height, Get.width),
                  width: getSizeRelativeToScreen(20, Get.height, Get.width),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: <BoxShadow>[
                      BoxShadow(color: Color.fromARGB(255, 216, 225, 249), spreadRadius: 0, blurRadius: 5, offset: Offset(0, 7)),
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
                    "from",
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
                      onTap: () => mezcalmosSnackBar("From", controller.value?.from.address ?? ""),
                      child: Obx(
                        () => Text(
                          (controller.value?.from.address.toString().substring(0, 13) ?? "..........") + " ..", //13+..
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )),
                ),
                Positioned(
                  left: (getSizeRelativeToScreen(180, Get.height, Get.width) / 2) + 40,
                  top: 13,
                  child: Text(
                    "to",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  left: (getSizeRelativeToScreen(180, Get.height, Get.width) / 2) + 40,
                  top: 30,
                  child: GestureDetector(
                      onTap: () => mezcalmosSnackBar("Destination", controller.value?.to.address ?? ""),
                      child: Obx(
                        () => Text(
                          (controller.value?.to.address.toString().substring(0, 13) ?? "..........") + " ..", //13+..
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
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
