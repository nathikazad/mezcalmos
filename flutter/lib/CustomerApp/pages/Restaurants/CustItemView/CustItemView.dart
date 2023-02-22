import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustItemView/components/ITemSliverAppBar.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustItemView/components/ItemOptionCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustItemView/components/ItemViewBottomBar.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustItemView/controllers/CustItemViewController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewItemScreen"]["ViewItemScreen"];

class CustItemView extends StatefulWidget {
  const CustItemView({Key? key, required this.viewItemScreenMode})
      : super(key: key);
  final ViewItemScreenMode viewItemScreenMode;

  @override
  _CustItemViewState createState() => _CustItemViewState();
}

class _CustItemViewState extends State<CustItemView> {
  bool showViewRestaurant = false;
  CustItemViewController viewController = CustItemViewController();

  @override
  void dispose() {
    viewController.dipose();
    super.dispose();
  }

  @override
  void initState() {
    showViewRestaurant = Get.arguments?["showViewRestaurant"] ?? false;
    final int? restaurantId =
        int.tryParse(Get.parameters['restaurantId'] ?? "");
    final int? itemId = int.tryParse(Get.parameters['itemId'] ?? "");
    final int? cartItemId = int.tryParse(Get.parameters["cartItemId"] ?? "");
    viewController.init(
        itemId: itemId,
        restaurantId: restaurantId,
        itemIdInCart: cartItemId,
        mode: widget.viewItemScreenMode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: true,
        bottomSheet: (viewController.hasData)
            ? ItemViewBottomBar(
                viewController: viewController,
              )
            : null,
        body: (viewController.hasData)
            ? CustomScrollView(
                slivers: [
                  ItemSliverAppBar(item: viewController.getItem!),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _headerInfoElements(),
                          if (viewController.getItem!.isSpecial) _specialInfo(),
                          if (viewController.itemHasDescription)
                            _itemDescription(context, viewController.getItem!),
                          if (viewController.getItem!.options.isNotEmpty)
                            Column(
                              children: List.generate(
                                viewController.getItem!.options.length,
                                (int index) => ItemOptionCard(
                                  cartItem: viewController.cartItem,
                                  editMode: widget.viewItemScreenMode ==
                                      ViewItemScreenMode.EditItemMode,
                                  option:
                                      viewController.getItem!.options[index],
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
              )
            : Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget _specialInfo() {
    return Container(
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
                viewController.getItem!.getPeriod.toString().inCaps,
                maxLines: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerInfoElements() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              viewController.getItem!.cost.toPriceString(),
              style: Get.textTheme.headline3?.copyWith(color: primaryBlueColor),
            ),
          ),
          if (showViewRestaurant)
            InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () {
                MezRouter.toNamed<void>(
                    getRestaurantRoute(
                        viewController.restaurant.value!.restaurantId),
                    arguments: {
                      "restaurant": viewController.restaurant.value!
                    });
              },
              child: Ink(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
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

  Widget _itemNotesComponent() {
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
              controller: viewController.notesController,
              minLines: 3,
              maxLines: 10,
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
