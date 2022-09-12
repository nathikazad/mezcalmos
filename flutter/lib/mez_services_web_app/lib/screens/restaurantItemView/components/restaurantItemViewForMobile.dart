import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/controllers/restaurantsInfoController.dart';
import 'package:mez_services_web_app/helpers/StringHelper.dart';
import 'package:mez_services_web_app/models/Generic.dart';
import 'package:mez_services_web_app/models/Services/Restaurant.dart';
import 'package:mez_services_web_app/screens/restaurantItemView/components/ITemSliverAppBar.dart';
import 'package:mez_services_web_app/screens/restaurantItemView/components/ItemOptionCard.dart';

import 'package:sizer/sizer.dart';

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
    // print("Args : ${Get.arguments.toString()}");
    // print("params : ${Get.parameters.toString()}");
    // print("widget.viewItemScreenMode => ${widget.viewItemScreenMode}");
    // if (widget.viewItemScreenMode == ViewItemScreenMode.AddItemMode) {
    //   final String? restaurantId = Get.parameters['restaurantId'];
    //   controller.getRestaurant("$restaurantId").then((Restaurant? value) {
    //     setState(() {
    //       currentRestaurant = value;
    //     });
    //   });
    //   final String? itemId = Get.parameters['itemId'];

    //   controller.getRestaurant(restaurantId!).then((Restaurant? restaurant) {
    //     if (restaurant?.findItemById(itemId!) != null) {
    //       cartItem.value =
    //           CartItem(restaurant!.findItemById(itemId!)!, restaurantId);
    //     } else {
    //       Future.delayed(Duration.zero, () {
    //         Get.back();
    //       });
    //     }
    //   });
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: itemViewScreenBody(context, widget.item),
      ),
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
                if (widget.item.description != null) _itemDescription(context),
                SizedBox(
                  height: 10,
                ),
                if (widget.item.options.isNotEmpty)
                  Column(
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
          Text("${_i18n()["itemDescription"]}", style: Get.textTheme.bodyText1),
          SizedBox(
            height: 10,
          ),
          Text("${widget.item.description![userLanguage]!.inCaps}",
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: 12.sp)),
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
