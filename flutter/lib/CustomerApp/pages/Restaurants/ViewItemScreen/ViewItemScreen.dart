import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/CustomerApp_appbar.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

import 'components/BottomBarItemViewScreen.dart';
import 'components/NoteComponet.dart';
import 'components/chooseOneCheckBox.dart';
import 'components/choosenManyCheckBox.dart';

final currency = new NumberFormat("#,##0.00", "en_US");
enum ViewItemScreenMode { AddItemMode, EditItemMode }

class ViewItemScreen extends StatefulWidget {
  ViewItemScreen({Key? key, required this.viewItemScreenMode})
      : super(key: key);
  final ViewItemScreenMode? viewItemScreenMode;

  @override
  _ViewItemScreenState createState() => _ViewItemScreenState();
}

class _ViewItemScreenState extends State<ViewItemScreen> {
  LanguageController lang = Get.find<LanguageController>();
  Rxn<CartItem> cartItem = Rxn();
  late RestaurantController restaurantCartController;
  RestaurantsInfoController controller = Get.find<RestaurantsInfoController>();
  Restaurant? currentRestaurant;
  @override
  void initState() {
    mezDbgPrint("Args : ${Get.arguments.toString()}");
    mezDbgPrint("params : ${Get.parameters.toString()}");

    Get.put<RestaurantsInfoController>(RestaurantsInfoController());
    restaurantCartController =
        Get.put<RestaurantController>(RestaurantController());
    mezDbgPrint("widget.viewItemScreenMode => ${widget.viewItemScreenMode}");
    if (widget.viewItemScreenMode == ViewItemScreenMode.AddItemMode) {
      String? restaurantId = Get.parameters['restaurantId'];
      controller.getRestaurant("$restaurantId").then((value) {
        setState(() {
          currentRestaurant = value;
        });
      });
      mezDbgPrint("got rest id param => $restaurantId");
      String? itemId = Get.parameters['itemId'];
      mezDbgPrint("got item id param => $itemId");

      this.controller.getItem(restaurantId!, itemId!).then((value) {
        this.cartItem.value = CartItem(value, restaurantId);
      });
    } else {
      this.cartItem.value = CartItem.clone(
          restaurantCartController.cart.value.items.firstWhere((item) {
        return item.id == Get.parameters["cartItemId"];
      }));
      controller.getRestaurant(this.cartItem.value!.restaurantId).then((value) {
        setState(() {
          currentRestaurant = value;
        });
      });
    }
    // scroll controller stuff !

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CustomerAppBar(
          title: currentRestaurant != null ? "${currentRestaurant!.name}" : "",
          autoBack: true,
        ),
        body: (cartItem.value?.item == null)
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : Container(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              alignment: Alignment.center,
                              child: Container(
                                height: Get.width - 120,
                                width: Get.width - 120,
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: cartItem.value!.item.image!,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Container(
                                      width: 15,
                                      height: 15,
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                  "${cartItem.value!.item.description!.inCaps}",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunito(
                                      textStyle: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            chooseOneCheckBoxes(
                                cartItem.value!.item.chooseOneOptions,
                                cartItem),
                            SizedBox(
                              height: 20,
                            ),
                            chooseManyCheckBoxes(
                                cartItem.value!.item.chooseManyOptions,
                                cartItem),
                            NoteComponent(
                              onChangeCallback: (String value) {
                                cartItem.value?.notes = value;
                              },
                              textController: TextEditingController(
                                  text: cartItem.value?.notes),
                            ),
                            SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                    BottomBarItemViewScreen(
                      cartItem: cartItem,
                      mode: widget.viewItemScreenMode!,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}
