import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/ThreeDotsLoading.dart';

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
                            child: ThreeDotsLoading(
                              dotsColor: Colors.white,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
