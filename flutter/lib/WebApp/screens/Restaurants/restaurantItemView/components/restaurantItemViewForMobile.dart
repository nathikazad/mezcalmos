import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/restaurantItemView/components/ITemSliverAppBar.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/restaurantItemView/components/ItemOptionCard.dart';
import 'package:mezcalmos/WebApp/screens/components/installAppBarComponent.dart';

final NumberFormat currency = new NumberFormat("#,##0.00", "en_US");

// ignore_for_file: constant_identifier_names
// enum ViewItemScreenMode { AddItemMode, EditItemMode }

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewItemScreen"]["ViewItemScreen"];

class RestaurantItemViewForMobile extends StatefulWidget {
  const RestaurantItemViewForMobile({Key? key, required this.item})
      : super(key: key);
  final Item item;

  @override
  _RestaurantItemViewForMobileState createState() =>
      _RestaurantItemViewForMobileState();
}

class _RestaurantItemViewForMobileState
    extends State<RestaurantItemViewForMobile> {
  /// LanguageType
  LanguageType userLanguage = Get.find<LanguageController>().userLanguageKey;

  /// RestaurantsInfoController
  RestaurantsInfoController controller = Get.find<RestaurantsInfoController>();

  /// currentRestaurant
  Restaurant? currentRestaurant;

  RxBool showImage = RxBool(true);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: itemViewScreenBody(context, widget.item),
    );
  }

  Widget itemViewScreenBody(BuildContext context, Item item) {
    return CustomScrollView(
      slivers: [
        ItemSliverAppBar(item: item),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "\$${item.cost.round()}",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: primaryColor),
                  ),
                ),
                if (widget.item.description != null) _itemDescription(context),
                SizedBox(
                  height: 10,
                ),
                if (widget.item.options.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        widget.item.options.length,
                        (int index) => ItemOptionCard(
                            isRunningOnWeb: false,
                            option: widget.item.options[index])),
                  ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Container _itemDescription(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${_i18n()["itemDescription"]}",
              style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
          SizedBox(
            height: 5,
          ),
          Text("${widget.item.description![userLanguage]!.inCaps}",
              textAlign: TextAlign.left,
              style: GoogleFonts.montserrat(
                  fontSize: 13,
                  color: Color.fromRGBO(73, 73, 73, 1),
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  // Container _itemNotesComponent() {
  //   return Container(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Container(
  //             child: Text(
  //           "${_i18n()["itemNotes"]}",
  //           style: Get.textTheme.bodyText1,
  //         )),
  //         SizedBox(
  //           height: 5,
  //         ),
  //         Container(
  //           margin: const EdgeInsets.symmetric(vertical: 8),
  //           child: TextFormField(
  //             minLines: 3,
  //             maxLines: 10,
  //             onChanged: (String v) {
  //               cartItem.value!.notes = v;
  //             },
  //             style: Get.textTheme.bodyText2,
  //             decoration: InputDecoration(
  //               alignLabelWithHint: false,
  //               floatingLabelBehavior: FloatingLabelBehavior.never,
  //               filled: true,
  //               fillColor: Colors.white,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
