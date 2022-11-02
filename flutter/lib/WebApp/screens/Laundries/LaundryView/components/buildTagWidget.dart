import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';

const Color backgroundColorForTags = Color.fromRGBO(225, 228, 255, 1);

Widget buildTagWidget({required String text, required BuildContext context}) {
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: (MezCalmosResizer.isSmallMobile(context) ||
                MezCalmosResizer.isMobile(context))
            ? 10
            : 15,
        vertical: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40), color: backgroundColorForTags),
    child: Center(
        child: Text(
      "$text",
      style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: const Color.fromRGBO(103, 121, 254, 1)),
    )),
  );
}

List<Widget> getServices(List<LaundryCostLineItem> lineItems) {
  LanguageController lang = Get.find<LanguageController>();

  List<Widget> xWidgets = [];

  lineItems.forEach((laundryCostLineItem) {
    xWidgets.add(Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 5, bottom: 5, right: 5),
          child: Text(
            "${laundryCostLineItem.name[lang.userLanguageKey]!}",
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color.fromRGBO(73, 73, 73, 1)),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Text(
            "\$${laundryCostLineItem.cost.round().toString()}/KG",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Color.fromRGBO(103, 121, 254, 1),
            ),
          ),
        ),
      ],
    ));
  });

  return xWidgets;
}
