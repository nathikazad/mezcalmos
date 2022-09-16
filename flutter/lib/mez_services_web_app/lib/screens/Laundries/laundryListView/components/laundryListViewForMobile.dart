import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/models/Services/Laundry.dart';
import 'package:mez_services_web_app/screens/Laundries/laundryListView/components/laundryListViewCardForMobileComponent.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Laundry"]["LaundriesListView"];

class LaundryListViewForMobile extends StatelessWidget {
  const LaundryListViewForMobile({Key? key, required this.laundries})
      : super(key: key);
  final List<Laundry> laundries;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Text(
              "${_i18n()["title"]}",
              style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: List.generate(
                laundries.length,
                (int index) => LaundryListViewCardForMobileComponent(
                      laundry: laundries[index],
                    )),
          )
        ],
      ),
    );
  }
}
