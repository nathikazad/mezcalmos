import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/models/Services/Restaurant.dart';
import 'package:mez_services_web_app/services/widgets/MezServiceOpenHours.dart';
import 'package:mez_services_web_app/services/widgets/mezCalmosResizer.dart';

final df = new DateFormat('hh:mm a');
dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]["Restaurants"]["ViewRestaurantScreen"]["components"]
    ["restaurantInfoTab"];

class RestaurantsInfoTapForDesktop extends StatefulWidget {
  RestaurantsInfoTapForDesktop({Key? key, required this.restaurant})
      : super(key: key);
  final Restaurant? restaurant;

  @override
  State<RestaurantsInfoTapForDesktop> createState() =>
      _RestaurantsInfoTapForDesktopState();
}

class _RestaurantsInfoTapForDesktopState
    extends State<RestaurantsInfoTapForDesktop> {
  LanguageController lang = Get.find<LanguageController>();

  var datefrom;

  var dateto;
  @override
  void initState() {
    widget.restaurant!.schedule!.concatenatedVersion().forEach((key, value) {
      datefrom = df.format(DateTime(2021, 1, 1, value.from[0], value.from[1]));
      dateto = df.format(DateTime(2021, 1, 1, value.to[0], value.to[1]));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MezCalmosResizer.getWepPageHorizontalPadding(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          if (widget.restaurant!.description![lang.userLanguageKey] != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Obx(
                    () => Text(
                      "${_i18n()["description"]} :",
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    "${widget.restaurant!.description![lang.userLanguageKey]}",
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(73, 73, 73, 1))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          MezServiceOpenHours(schedule: widget.restaurant!.schedule!),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Obx(
              () => Text(
                "${_i18n()["location"]}",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "${widget.restaurant!.info.location.address}",
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(73, 73, 73, 1))),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
