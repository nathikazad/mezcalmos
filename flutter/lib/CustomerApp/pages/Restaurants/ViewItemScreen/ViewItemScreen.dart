import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/appbar.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewcartScreen/components/textFieldComponent.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

import 'components/BottomBarItemViewScreen.dart';
import 'components/chooseOneCheckBox.dart';
import 'components/choosenManyCheckBox.dart';

final currency = new NumberFormat("#,##0.00", "en_US");
enum ViewItemScreenMode { AddItemMode, EditItemMode }

class ViewItemScreen extends StatefulWidget {
  ViewItemScreen({Key? key, required this.viewItemScreenMode})
      : super(key: key);
  final ViewItemScreenMode viewItemScreenMode;

  @override
  _ViewItemScreenState createState() => _ViewItemScreenState();
}

class _ViewItemScreenState extends State<ViewItemScreen> {
  LanguageController lang = Get.find<LanguageController>();
  AuthController auth = Get.find<AuthController>();
  Rxn<CartItem> cartItem = Rxn();
  late RestaurantController restaurantCartController;
  RestaurantsInfoController controller = Get.find<RestaurantsInfoController>();
  Restaurant? currentRestaurant;
  TextEditingController _noteTextEdittingController = TextEditingController();

  @override
  void dispose() {
    _noteTextEdittingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    mezDbgPrint("Args : ${Get.arguments.toString()}");
    mezDbgPrint("params : ${Get.parameters.toString()}");
    restaurantCartController = Get.find<RestaurantController>();
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
    controller.refresh();
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
                              child: cartItem.value?.item.image != null &&
                                      cartItem.value?.item.image != ""
                                  ? CachedNetworkImage(
                                      imageUrl: cartItem.value!.item.image!,
                                      imageBuilder: (context, imageProvider) {
                                        return Container(
                                          width: 150,
                                          height: 150,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: imageProvider)),
                                        );
                                      },
                                      fit: BoxFit.cover,
                                      errorWidget: (context, url, error) {
                                        return Container();
                                      },
                                      placeholder: (context, url) {
                                        return Container(
                                          width: 15,
                                          height: 15,
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      },
                                    )
                                  : Container(),
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
                                  style: Theme.of(context).textTheme.bodyText2),
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
                            TextFieldComponent(
                              textController: _noteTextEdittingController,
                              hint: lang.strings["customer"]["restaurant"]
                                  ["menu"]["notes"],
                              onChangeCallback: (String value) {
                                cartItem.value?.notes = value;
                              },
                            ),
                            SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                    BottomBarItemViewScreen(
                      isAvailable: checkRestaurantAvailability(
                          schedule: currentRestaurant?.schedule),
                      cartItem: cartItem,
                      mode: widget.viewItemScreenMode,
                      currentRestaurantId: currentRestaurant?.id,
                    )
                  ],
                ),
              ),
      ),
    );
  }

  bool checkRestaurantAvailability({Schedule? schedule}) {
    var dayNane = DateFormat('EEEE').format(DateTime.now());

    var x = DateTime.now();

    if (schedule != null) {
      bool isOpen = false;
      schedule.openHours.forEach((key, value) {
        if (key.toFirebaseFormatString() == dayNane.toLowerCase()) {
          var dateOfStart =
              DateTime(x.year, x.month, x.day, value.from[0], value.from[1]);
          var dateOfClose =
              DateTime(x.year, x.month, x.day, value.to[0], value.to[1]);
          mezDbgPrint(dateOfStart.toString());
          mezDbgPrint(dateOfClose.toString());
          if (dateOfStart.isBefore(x) && dateOfClose.isAfter(x)) {
            mezDbgPrint("Today is $dayNane");
            isOpen = true;
          }
        }
      });
      return isOpen;
    } else {
      return true;
    }
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}
