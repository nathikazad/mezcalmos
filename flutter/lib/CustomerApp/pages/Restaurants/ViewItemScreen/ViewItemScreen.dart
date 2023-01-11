import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/BottomBarItemViewScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/ITemSliverAppBar.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/ItemOptionCard.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/item/hsItem.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:sizer/sizer.dart';

final NumberFormat currency = new NumberFormat("#,##0.00", "en_US");

// ignore_for_file: constant_identifier_names
enum ViewItemScreenMode { AddItemMode, EditItemMode }

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewItemScreen"]["ViewItemScreen"];

class ViewItemScreen extends StatefulWidget {
  const ViewItemScreen({Key? key, required this.viewItemScreenMode})
      : super(key: key);
  final ViewItemScreenMode viewItemScreenMode;

  @override
  _ViewItemScreenState createState() => _ViewItemScreenState();
}

class _ViewItemScreenState extends State<ViewItemScreen> {
  /// LanguageType
  LanguageType userLanguage = Get.find<LanguageController>().userLanguageKey;

  /// AuthController
  AuthController auth = Get.find<AuthController>();

  /// cartItem
  Rxn<CartItem> cartItem = Rxn<CartItem>();

  /// RestaurantController
  RestaurantController restaurantCartController =
      Get.find<RestaurantController>();

  /// RestaurantsInfoController

  /// currentRestaurant
  Restaurant? currentRestaurant;
  TextEditingController _noteTextEdittingController = TextEditingController();
  RxBool showImage = RxBool(true);
  bool showViewRestaurant = false;
  bool isSpecial = false;

  @override
  void dispose() {
    _noteTextEdittingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    mezDbgPrint("Args : ${Get.arguments.toString()}");
    mezDbgPrint("params : ${Get.parameters.toString()}");
    mezDbgPrint("widget.viewItemScreenMode => ${widget.viewItemScreenMode}");
    showViewRestaurant = Get.arguments?["showViewRestaurant"] ?? false;
    isSpecial = Get.arguments?["isSpecial"] ?? false;
    Get.find<RestaurantController>().fetchCart();
    if (widget.viewItemScreenMode == ViewItemScreenMode.AddItemMode) {
      final int? restaurantId = Get.parameters['restaurantId'] == null
          ? null
          : int.parse(Get.parameters['restaurantId']!);
      if (restaurantId != null) {
        get_restaurant_by_id(id: restaurantId, withCache: false)
            .then((Restaurant? rest) {
          setState(() {
            currentRestaurant = rest;
          });
        });
      }

      final String? itemId = Get.parameters['itemId'];
      get_one_item_by_id(int.parse(itemId!)).then((Item? _item) {
        if (_item != null) {
          mezDbgPrint("[66] Got Item ==> |item : ${_item.id}|");
          cartItem.value = CartItem(_item, restaurantId!);
        } else {
          mezDbgPrint("[66] Failed getting Item ==> |item|");
        }
      });
      mezDbgPrint("IS SPECIAL ITEM==========>>>>$isSpecial");
      mezDbgPrint("CartValue =--> ${cartItem.value}");
    } else {
      cartItem.value = CartItem.clone(restaurantCartController
          .cart.value.cartItems
          .firstWhere((CartItem item) {
        return item.idInCart == Get.parameters["cartItemId"];
      }));
      get_restaurant_by_id(id: cartItem.value!.restaurantId, withCache: false)
          .then((Restaurant? rest) {
        setState(() {
          currentRestaurant = rest;
        });
      });
    }
    cartItem.refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: true,
        bottomSheet: (cartItem.value != null && currentRestaurant != null)
            ? BottomBarItemViewScreen(
                restaurant: currentRestaurant!,
                currentRestaurantId: currentRestaurant?.info.hasuraId,
                cartItem: cartItem,
                mode: widget.viewItemScreenMode,
              )
            : null,
        body: (cartItem.value == null)
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : itemViewScreenBody(context, cartItem.value!.item),
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
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          item.cost.toPriceString(),
                          style: Get.textTheme.headline3
                              ?.copyWith(color: primaryBlueColor),
                        ),
                      ),
                      if (currentRestaurant != null && showViewRestaurant)
                        InkWell(
                          borderRadius: BorderRadius.circular(18),
                          onTap: () {
                            MezRouter.toNamed(
                              getRestaurantRoute(
                                currentRestaurant!.info.hasuraId,
                              ),
                              arguments: currentRestaurant,
                            );
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
                    item.description![userLanguage]!
                        .toString()
                        .removeAllWhitespace
                        .isNotEmpty)
                  _itemDescription(context, item),
                if (item.options.isNotEmpty)
                  Column(
                    children: List.generate(
                      cartItem.value!.item.options.length,
                      (int index) => ItemOptionCard(
                        cartItem: cartItem,
                        editMode: widget.viewItemScreenMode ==
                            ViewItemScreenMode.EditItemMode,
                        option: cartItem.value!.item.options[index],
                      ),
                    ),
                  ),
                SizedBox(
                  height: 15,
                ),
                _itemNotesComponent(),
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
          Text(
            "${item.description![userLanguage]?.inCaps}",
            textAlign: TextAlign.left,
            style: Get.textTheme.bodyText2!.copyWith(
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }

  Container _itemNotesComponent() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              child: Text(
            "${_i18n()["itemNotes"]}",
            style: Get.textTheme.bodyText1,
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
                cartItem.value!.notes = v;
              },
              style: Get.textTheme.bodyText2,
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
}
