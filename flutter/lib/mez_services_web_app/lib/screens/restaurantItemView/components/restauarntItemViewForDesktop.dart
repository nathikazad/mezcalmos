import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/models/Services/Restaurant.dart';
import 'package:mez_services_web_app/screens/restaurantItemView/components/ItemOptionCard.dart';
import 'package:mez_services_web_app/services/widgets/mezCalmosResizer.dart';

class RestaurantItemViewForDesktop extends StatelessWidget {
  const RestaurantItemViewForDesktop({Key? key, required this.item})
      : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    final LanguageController lang = Get.find<LanguageController>();
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MezCalmosResizer.getWepPageHorizontalPadding(context)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (item.image != null && item.image != "")
                ? Container(
                    height: Get.height * 0.5,
                    color: Colors.grey[300],
                    constraints: BoxConstraints(
                      maxHeight: Get.height * 0.5,
                    ),
                    width: Get.width,
                    child: Image.network(
                      "${item.image}",
                      scale: 5,
                      fit: BoxFit.cover,
                    ),
                  )
                : SizedBox(),
            SizedBox(
              height: 15,
            ),
            Text(
              "${item.name[lang.userLanguageKey]}",
              style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "\$${item.cost}",
              style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(103, 121, 254, 1)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Item Description",
              style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "${item.description?[lang.userLanguageKey]}",
              style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(73, 73, 73, 1)),
            ),
            if (item.options.isNotEmpty)
              Column(
                children: List.generate(
                    item.options.length,
                    (int index) => ItemOptionCard(
                          option: item.options[index],
                          isRunningOnWeb: true,
                        )),
              ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
