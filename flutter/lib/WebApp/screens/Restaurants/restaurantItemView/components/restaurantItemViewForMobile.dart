import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
// import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/BottomBarItemViewScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/ItemOptionCard.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/AuthController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/WebApp/controllers/mezWebSideBarController.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/restaurantItemView/components/ITemSliverAppBar.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/restaurantItemView/components/RestaurantItemViewForMobile.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/restaurantItemView/restaurantItemView.dart';
import 'package:mezcalmos/WebApp/screens/restaurants/restaurantItemView/components/BottomBarItemViewScreen.dart';
import 'package:mezcalmos/WebApp/screens/restaurants/restaurantItemView/components/itemNotesComponentWidget.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart';

final NumberFormat currency = new NumberFormat("#,##0.00", "en_US");

// ignore_for_file: constant_identifier_names

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewItemScreen"]["ViewItemScreen"];

class RestaurantItemViewForMobile extends StatefulWidget {
  const RestaurantItemViewForMobile(
      {Key? key,
      required this.viewItemScreenMode,
      required this.cartItem,
      required this.currentRestaurant,
      required this.mezWebSideBarController,
      this.showViewRestaurant = false,
      this.isSpecial = false})
      : super(key: key);
  final ViewItemScreenMode viewItemScreenMode;
  final Rxn<CartItem> cartItem;
  final Rx<Restaurant?> currentRestaurant;
  final bool? showViewRestaurant;
  final bool? isSpecial;
  final MezWebSideBarController mezWebSideBarController;

  @override
  _RestaurantItemViewForMobileState createState() =>
      _RestaurantItemViewForMobileState();
}

class _RestaurantItemViewForMobileState
    extends State<RestaurantItemViewForMobile> {
  /// LanguageType
  LanguageType userLanguage = Get.find<LanguageController>().userLanguageKey;

  /// AuthController
  AuthController auth = Get.find<AuthController>();

  /// cartItem
  // Rxn<CartItem> cartItem = Rxn<CartItem>();

  /// RestaurantController
  // RestaurantController restaurantCartController =
  //     Get.find<RestaurantController>();

  /// RestaurantsInfoController
  // RestaurantsInfoController controller = Get.find<RestaurantsInfoController>();

  /// currentRestaurant
  //Restaurant? currentRestaurant;
  TextEditingController _noteTextEdittingController = TextEditingController();
  //RxBool showImage = RxBool(true);bool isSpecial = false;

  @override
  void dispose() {
    _noteTextEdittingController.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   mezDbgPrint("Args : ${Get.arguments.toString()}");
  //   mezDbgPrint("params : ${Get.parameters.toString()}");
  //   mezDbgPrint("widget.viewItemScreenMode => ${widget.viewItemScreenMode}");
  //   showViewRestaurant = Get.arguments?["showViewRestaurant"] ?? false;
  //   isSpecial = Get.arguments?["isSpecial"] ?? false;
  //   if (widget.viewItemScreenMode == ViewItemScreenMode.AddItemMode) {
  //     final String? restaurantId = Get.parameters['restaurantId'];
  //     if (restaurantId == null) {
  //       Get.back<void>();
  //     }
  //     controller.getRestaurant("$restaurantId").then((Restaurant? value) {
  //       setState(() {
  //         currentRestaurant = value;
  //       });
  //     });
  //     final String? itemId = Get.parameters['itemId'];
  //     mezDbgPrint("IS SPECIAL ITEM==========>>>>$isSpecial");
  //     controller.getRestaurant(restaurantId!).then((Restaurant? restaurant) {
  //       if (restaurant?.findItemById(id: itemId!) != null) {
  //         cartItem.value = CartItem(
  //             restaurant!.findItemById(
  //               id: itemId!,
  //             )!,
  //             restaurantId);
  //       } else {
  //         Future.delayed(Duration.zero, () {
  //           Get.back();
  //         });
  //       }
  //     });
  //     mezDbgPrint(cartItem.value);
  //   } else {
  //     cartItem.value = CartItem.clone(restaurantCartController
  //         .cart.value.cartItems
  //         .firstWhere((CartItem item) {
  //       return item.idInCart == Get.parameters["cartItemId"];
  //     }));
  //     controller
  //         .getRestaurant(cartItem.value!.restaurantId)
  //         .then((Restaurant? value) {
  //       setState(() {
  //         currentRestaurant = value;
  //       });
  //     });
  //   }
  //   cartItem.refresh();
  //   // mezDbgPrint(
  //   //     "cart item ===============>${cartItem.value!.toFirebaseFunctionFormattedJson()}");
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // return Scaffold();
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: true,
        bottomSheet:
            (widget.cartItem.value != null && widget.currentRestaurant != null)
                ? BottomBarItemViewScreen(
                    currentRestaurantId: widget
                        .currentRestaurant.value?.info.descriptionId
                        .toString(),
                    cartItem: widget.cartItem,
                    mode: widget.viewItemScreenMode,
                    navigationCallback: () {
                      mezDbgPrint(
                          "============|||||| lets go to cart view 🔥 ||||||=========");
                      QR.to("/cart");
                    },
                  )
                : null,
        body: (widget.cartItem.value == null)
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : itemViewScreenBody(context, widget.cartItem.value!.item),
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
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment:
                        (widget.currentRestaurant.value != null &&
                                widget.showViewRestaurant!)
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          item.cost.toPriceString(),
                          style: Get.textTheme.headline3
                              ?.copyWith(color: primaryBlueColor),
                        ),
                      ),
                      if (widget.currentRestaurant != null &&
                          widget.showViewRestaurant!)
                        InkWell(
                          borderRadius: BorderRadius.circular(18),
                          onTap: () {
                            ///TODO:change this to QR route
                            // Get.toNamed(
                            //     getRestaurantRoute(
                            //       currentRestaurant!.info.id,
                            //     ),
                            //   arguments: currentRestaurant);
                          },
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 12),
                            decoration: BoxDecoration(
                                color: secondaryLightBlueColor,
                                borderRadius: BorderRadius.circular(18)),
                            child: Text(
                              '${_i18n()["viewRestaurant"]}',
                              style: Get.textTheme.bodyText1
                                  ?.copyWith(color: primaryBlueColor),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                if (item.isSpecial)
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.fastfood,
                              color: Colors.grey.shade900,
                              size: 15.sp,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('${_i18n()["special"]}'),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.watch_later,
                              color: Colors.grey.shade900,
                              size: 15.sp,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              item.getPeriod.toString().inCaps,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                if (item.description?[userLanguage] != null &&
                    item.description![userLanguage]!.isNotEmpty)
                  _itemDescription(context, item),
                if (item.options.isNotEmpty)
                  Column(
                    children: List.generate(
                        widget.cartItem.value!.item.options.length,
                        (int index) => ItemOptionCard(
                            cartItem: widget.cartItem,
                            editMode: widget.viewItemScreenMode ==
                                ViewItemScreenMode.EditItemMode,
                            option:
                                widget.cartItem.value!.item.options[index])),
                  ),
                SizedBox(
                  height: 15,
                ),
                itemNotesComponent(widget.cartItem, context),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Container _itemDescription(BuildContext context, Item item) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${_i18n()["itemDescription"]}", style: Get.textTheme.bodyText1),
          SizedBox(
            height: 10,
          ),
          Text("${item.description![userLanguage]?.inCaps}",
              textAlign: TextAlign.left,
              style: Get.textTheme.bodyText2!.copyWith(fontSize: 12.sp)),
        ],
      ),
    );
  }
}
