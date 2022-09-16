import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/helpers/StringHelper.dart';
import 'package:mez_services_web_app/models/Generic.dart';
import 'package:mez_services_web_app/models/Services/Restaurant.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart';

class RestaurantgridItemCard extends StatefulWidget {
  const RestaurantgridItemCard(
      {Key? key, required this.item, required this.restaurant})
      : super(key: key);
  final Item item;
  final Restaurant restaurant;

  @override
  State<RestaurantgridItemCard> createState() => _RestaurantgridItemCardState();
}

class _RestaurantgridItemCardState extends State<RestaurantgridItemCard> {
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  bool isImageExist = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          var xPath = getCurrentPath();
          QR.to("${xPath[0]}/${widget.item.id}${xPath[1]}");
        },
        child: Container(
          //  padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (isImageExist)
                CircleAvatar(
                  radius: 35.sp,
                  backgroundImage:
                      CachedNetworkImageProvider(widget.item.image ?? ""),
                  onBackgroundImageError: (Object e, StackTrace? s) {
                    setState(() {
                      isImageExist = false;
                    });
                  },
                ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.item.name[userLanguage] ?? "",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "\$${widget.item.cost}",
                style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
