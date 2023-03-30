import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Restaurants/CustItemView/components/ItemOptionCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Restaurants/CustItemView/components/ItemViewBottomBar.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Restaurants/CustItemView/controllers/CustItemViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Restaurants/CustRestaurantView/CustomerRestaurantView.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/restaurantRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSliverAppbar.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewItemScreen"]["ViewItemScreen"];

class CustItemView extends StatefulWidget {
  const CustItemView({Key? key}) : super(key: key);
  static Future<void> navigateToRestaurantItem(
      {required int itemId, required int restaurantId}) {
    return MezRouter.toPath(
        RestaurantRoutes.restaurantItemViewRoute
            .replaceAll(":restaurantId", restaurantId.toString())
            .replaceAll(":itemId", itemId.toString()),
        arguments: <String, dynamic>{
          "viewItemScreenMode": ViewItemScreenMode.AddItemMode
        });
  }

  static Future<void> navigateToCartItem({required int cartItemId}) {
    return MezRouter.toPath(
        RestaurantRoutes.cartItemViewRoute
            .replaceAll(":cartItemId", cartItemId.toString()),
        arguments: <String, dynamic>{
          "viewItemScreenMode": ViewItemScreenMode.EditItemMode
        });
  }

  @override
  _CustItemViewState createState() => _CustItemViewState();
}

class _CustItemViewState extends State<CustItemView> {
  CustItemViewController viewController = CustItemViewController();

  @override
  void dispose() {
    viewController.dipose();
    super.dispose();
  }

  @override
  void initState() {
    final int? restaurantId =
        int.tryParse(MezRouter.urlArguments['restaurantId'].toString());
    final int? itemId =
        int.tryParse(MezRouter.urlArguments['itemId'].toString());
    final int? cartItemId =
        int.tryParse(MezRouter.urlArguments["cartItemId"].toString());
    viewController.init(
        itemId: itemId,
        restaurantId: restaurantId,
        itemIdInCart: cartItemId,
        mode: MezRouter.bodyArguments?["viewItemScreenMode"] ??
            ViewItemScreenMode.AddItemMode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        bottomSheet: (viewController.hasData)
            ? ItemViewBottomBar(
                viewController: viewController,
              )
            : null,
        body: (viewController.hasData)
            ? CustomScrollView(
                slivers: [
                  MezSliverAppBar(
                    image: viewController.getItem?.image,
                    ordersRoute: CustomerRoutes.customerOrdersRoute,
                    title:
                        viewController.getItem?.name[userLanguage] ?? "Error",
                  ),
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
                                (int index) => Column(
                                  children: [
                                    ItemOptionCard(
                                      cartItem: viewController.cartItem,
                                      editMode: viewController.currentMode ==
                                          ViewItemScreenMode.EditItemMode,
                                      option: viewController
                                          .getItem!.options[index],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          _itemNotesComponent(),
                          SizedBox(
                            height: 15.h,
                          ),
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
              style:
                  context.txt.displaySmall?.copyWith(color: primaryBlueColor),
            ),
          ),
          // if (viewController.showRestaurant())
          InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: () {
              CustomerRestaurantView.navigate(
                restaurantId: viewController.restaurant.value!.restaurantId,
              );
            },
            child: Ink(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              decoration: BoxDecoration(
                  color: secondaryLightBlueColor,
                  borderRadius: BorderRadius.circular(18)),
              child: Text(
                '${_i18n()["viewRestaurant"]}',
                style: context.txt.bodyLarge?.copyWith(color: primaryBlueColor),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _itemDescription(BuildContext context, Item item) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${_i18n()["itemDescription"]}", style: context.txt.bodyLarge),
          SizedBox(height: 5),
          Text(
            "${item.description![userLanguage]?.inCaps}",
            textAlign: TextAlign.left,
            style: context.txt.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _itemNotesComponent() {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              child: Text(
            "${_i18n()["itemNotes"]}",
            style: context.txt.bodyLarge,
          )),
          SizedBox(height: 2),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: TextFormField(
              controller: viewController.notesController,
              minLines: 3,
              maxLines: 7,
              style: context.txt.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                alignLabelWithHint: false,
                hintText: "${_i18n()["hintNote"]}",
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
