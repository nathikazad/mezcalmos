import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/controllers/laundry/LaundryController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/WebApp/screens/Laundries/LaundryView/components/buildTagWidget.dart';
import 'package:mezcalmos/WebApp/screens/Laundries/LaundryView/components/getBackButton.dart';
import 'package:mezcalmos/WebApp/services/widgets/MezServiceOpenHours.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosResizer.dart';

import 'package:qlevar_router/qlevar_router.dart';

import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Laundry"]["SingleLaundryScreen"];

class LaundryViewForMobile extends StatelessWidget {
  LaundryController laundryController = Get.find<LaundryController>();
  LaundryViewForMobile({required this.laundry});
  final Laundry laundry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButtonAppBar(),
        title: Text(
          laundry.info.name,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: MezCalmosResizer.getWepPageHorizontalPadding(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: Get.width,
              child: Image.network(
                "${laundry.info.image}",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            _laundryInfoHeader(context),
            SizedBox(
              height: 20,
            ),
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
              height: 5,
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
              height: 5,
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
          ],
        ),
      ),
    );
  }

  Widget _laundryInfoHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  laundry.info.name,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    // Flexible(
                    //   child: buildTagWidget(
                    //       context: context,
                    //       text:
                    //           "${laundry.averageNumberOfDays} ${_i18n()["retaurnsIn"]}"),
                    // ),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    buildTagWidget(
                        context: context,
                        text:
                            "${_i18n()["minimumCost"]} \$${laundry.getAverageCost.round()}")
                  ],
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${_i18n()["startingFrom"]}",
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  color: Color.fromRGBO(73, 73, 73, 1),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(5),
                child: Text(
                  "\$${laundry.getCheapestCategory.round()}/kg",
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(103, 121, 254, 1)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
