import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewItemScreen"]["ViewItemScreen"];

Container itemNotesComponent(Rx<CartItem?> item, BuildContext context) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            child: Text(
          "${_i18n()["itemNotes"]}",
          style: GoogleFonts.montserrat(
              fontSize: (MezCalmosResizer.isMobile(context) ||
                      MezCalmosResizer.isSmallMobile(context))
                  ? Get.textTheme.bodyText1?.fontSize
                  : 18,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        )),
        SizedBox(
          height: 5,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            minLines: 3,
            maxLines: 10,
            onChanged: (String v) {
              item.value?.notes = v;
            },
            style: (MezCalmosResizer.isMobile(context) ||
                    MezCalmosResizer.isSmallMobile(context))
                ? Get.textTheme.bodyText2?.copyWith(color: Colors.grey)
                : GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
            decoration: InputDecoration(
              alignLabelWithHint: false,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
