import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(81, 132, 255, 1),
                Color.fromRGBO(206, 73, 252, 1)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: Get.width * 0.6,
                          width: Get.width * 0.6,
                          child: ClipOval(
                            child: Container(
                                color: Colors.white,
                                child: Transform.scale(
                                    scale: 1.5, child: MezLogoAnimation())),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.06,
                        ),
                        Text(
                          "MEZCALMOS",
                          style: TextStyle(fontSize: 45, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Loading",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.5,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 25,
                          margin: const EdgeInsets.only(top: 5),
                          child: CollectionScaleTransition(
                            children: <Widget>[
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
        // body: SafeArea(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Center(child: CircularProgressIndicator()),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       Center(
        //         child: Text(
        //           "Application is loading ...",
        //           style: TextStyle(
        //             color: Colors.black,
        //             fontWeight: FontWeight.w600,
        //             fontSize: 20,
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
