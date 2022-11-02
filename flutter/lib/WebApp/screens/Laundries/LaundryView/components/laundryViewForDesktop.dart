import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/WebApp/screens/Laundries/LaundryView/components/buildTagWidget.dart';
import 'package:mezcalmos/WebApp/widgets/MezServiceOpenHours.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';

const Color backgroundColorForIcons = Color.fromRGBO(235, 237, 250, 1);
dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Laundry"]["SingleLaundryScreen"];

class LaundryViewForDesktop extends StatelessWidget {
  LaundryViewForDesktop({Key? key, required this.laundry}) : super(key: key);
  final Laundry laundry;
  LanguageController lang = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size(Get.width, kToolbarHeight),
      //   child: Container(
      //     height: kToolbarHeight,
      //     padding: EdgeInsets.symmetric(
      //         horizontal:
      //             MezCalmosResizer.getWepPageHorizontalPadding(context)),
      //     child: Row(
      //       children: [
      //         BackButtonAppBar(scale: 0.8, padding: 8),
      //         Expanded(
      //             child: Center(
      //           child: Text("${laundry.info.name}",
      //               style: GoogleFonts.montserrat(
      //                   fontSize: 18,
      //                   fontWeight: FontWeight.w700,
      //                   color: Colors.black)),
      //         ))
      //       ],
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
                  MezCalmosResizer.getWepPageHorizontalPadding(context)),
          child: Column(children: [
            Container(
              height: 300,
              width: Get.width,
              child: Image.network(
                "${laundry.info.image}",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text("${laundry.info.name}",
                            style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      buildTagWidget(
                          context: context,
                          text:
                              "${_i18n()["minimumCost"]} \$${laundry.getAverageCost.round()}")
                      // Row(
                      //   children: [
                      //     buildTagWidget(
                      //         context: context,
                      //         text:
                      //             "${laundry.averageNumberOfDays} ${_i18n()["retaurnsIn"]}"),
                      //     SizedBox(
                      //       width: 5,
                      //     ),

                      //   ],
                      // )
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "${_i18n()["startingFrom"]}",
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(73, 73, 73, 1)),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          "\$${laundry.getCheapestCategory.round()}/kg",
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(103, 121, 254, 1)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Container(
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     "Description",
            //     style: GoogleFonts.montserrat(
            //         fontSize: 16,
            //         fontWeight: FontWeight.w600,
            //         color: Colors.black),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     "",
            //     style: GoogleFonts.nunito(
            //         color: Color.fromRGBO(73, 73, 73, 1),
            //         fontSize: 12,
            //         fontWeight: FontWeight.w600),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "${_i18n()["categories"]}",
                style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: getServices(laundry.laundryCosts.lineItems),
            ),
            // Row(
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: getServices(laundry.laundryCosts.lineItems)[0],
            //     ),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: getServices(laundry.laundryCosts.lineItems)[1],
            //     )
            //   ],
            // ),
            SizedBox(
              height: 20,
            ),
            MezServiceOpenHours(schedule: laundry.schedule!),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "${_i18n()["location"]}",
                style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "${laundry.info.location.address}",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color.fromRGBO(120, 120, 120, 1),
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),
          ]),
        ),
      ),
    );
  }
}
