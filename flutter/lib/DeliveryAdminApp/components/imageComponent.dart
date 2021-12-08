import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class ImageComponent extends StatelessWidget {
  final String? image;
  final String? title;
  ImageComponent({this.image, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
          top: Get.height * 0.015,
          child: Container(
            // alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 90),

            height: Get.height,
            width: Get.width,
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                Container(
                  height: Get.height * 0.45,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      border:
                          Border.all(color: const Color(0x5c707070), width: 1),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0x29000000),
                            offset: Offset(0, -2),
                            blurRadius: 6,
                            spreadRadius: 0)
                      ],
                      gradient: LinearGradient(
                          begin: Alignment(0.5, 0),
                          end: Alignment(0.5, 0.8458111882209778),
                          colors: [
                            const Color(0x00000f1c),
                            const Color(0xad000f1c),
                            const Color(0xff000f1c)
                          ])),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      child: handleIfNetworkImage(url: image)
                      //  Image.network(
                      //   "$image",
                      //   fit: BoxFit.cover,
                      // ),
                      ),
                ),
                Positioned(
                    top: Get.height * 0.30,
                    child: Container(
                      width: Get.width,
                      child: Text("$title",
                          style: const TextStyle(
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w400,
                              fontFamily: "ProductSans",
                              fontStyle: FontStyle.normal,
                              fontSize: 25.0),
                          textAlign: TextAlign.center),
                    ))
              ],
            ),
          )),
    );
  }
}
