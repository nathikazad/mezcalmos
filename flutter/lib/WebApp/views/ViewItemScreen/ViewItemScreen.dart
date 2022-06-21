import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/WebApp/views/ViewItemScreen/components/ItemSliverAppBar.dart';
import 'package:mezcalmos/WebApp/views/ViewItemScreen/components/ItemOptionCard.dart';
import 'package:sizer/sizer.dart';

final NumberFormat currency = new NumberFormat("#,##0.00", "en_US");

// ignore_for_file: constant_identifier_names
//enum ViewItemScreenMode { AddItemMode, EditItemMode }

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewItemScreen"]["ViewItemScreen"];

class ViewItemScreen extends StatefulWidget {
  const ViewItemScreen({
    Key? key,
  }) : super(key: key);
  //final Restaurant restaurant;

  @override
  _ViewItemScreenState createState() => _ViewItemScreenState();
}

class _ViewItemScreenState extends State<ViewItemScreen> {
  /// LanguageType
  LanguageType userLanguage = Get.find<LanguageController>().userLanguageKey;

  /// AuthController
  // AuthController auth = Get.find<AuthController>();

  /// cartItem
  Rxn<Item> cartItem = Rxn<Item>();

  /// RestaurantController
  // RestaurantController restaurantCartController =
  //     Get.find<RestaurantController>();

  /// RestaurantsInfoController
  RestaurantsInfoController controller = Get.find<RestaurantsInfoController>();

  /// currentRestaurant
  Restaurant? currentRestaurant;
  TextEditingController _noteTextEdittingController = TextEditingController();
  RxBool showImage = RxBool(true);

  @override
  void dispose() {
    _noteTextEdittingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    mezDbgPrint("Args : ${Get.arguments.toString()}");
    mezDbgPrint("params : ${Get.parameters.toString()}");
    //mezDbgPrint("widget.viewItemScreenMode => ${widget.viewItemScreenMode}");

    final String? restaurantId = Get.parameters["id"];
    controller.getRestaurant("$restaurantId").then((Restaurant? value) {
      setState(() {
        currentRestaurant = value;
      });
    });
    final String? itemId = Get.parameters['itemId'];

    controller.getRestaurant(restaurantId!).then((Restaurant? restaurant) {
      if (restaurant?.findItemById(itemId!) != null) {
        cartItem.value = restaurant!.findItemById(itemId!);
        mezDbgPrint(
            "this is a test the item value resault is ${cartItem.value?.toJson()}");
        //     CartItem(restaurant!.findItemById(itemId!)!, restaurantId);
      } else {
        Future.delayed(Duration.zero, () {
          Get.back();
        });
      }
    });

    // else {
    //   cartItem.value = CartItem.clone(restaurantCartController
    //       .cart.value.cartItems
    //       .firstWhere((CartItem item) {
    //     return item.idInCart == Get.parameters["cartItemId"];
    //   }));
    //   controller
    //       .getRestaurant(cartItem.value!.restaurantId)
    //       .then((Restaurant? value) {
    //     setState(() {
    //       currentRestaurant = value;
    //     });
    //   });
    // }
    cartItem.refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // bottomNavigationBar: (cartItem.value != null)
        //     ? BottomBarItemViewScreen(
        //         currentRestaurantId: currentRestaurant?.info.id,
        //         isAvailable: (currentRestaurant?.isOpen() ?? false),
        //         cartItem: cartItem,
        //         mode: widget.viewItemScreenMode,
        //       )
        //     : null,
        body: (cartItem.value == null)
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : itemViewScreenBody(context, cartItem.value!),
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
                if (cartItem.value?.description != null)
                  _itemDescription(context),
                SizedBox(
                  height: 10,
                ),
                if (cartItem.value!.options.isNotEmpty)
                  Column(
                    children: List.generate(
                        cartItem.value!.options.length,
                        (int index) => ItemOptionCard(
                            cartItem: cartItem,
                            option: cartItem.value!.options[index])),
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
          Text("${cartItem.value!.description![userLanguage]!.inCaps}",
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: 12.sp)),
        ],
      ),
    );
  }
}
