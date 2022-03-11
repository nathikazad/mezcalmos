import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/Shared/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/TextFieldComponent.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'components/BottomBarItemViewScreen.dart';
import 'components/ChooseOneCheckBox.dart';
import 'components/ChoosenManyCheckBox.dart';

final currency = new NumberFormat("#,##0.00", "en_US");
enum ViewItemScreenMode { AddItemMode, EditItemMode }

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]
    ["Restaurants"]["ViewItemScreen"]["ViewItemScreen"];

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
  RestaurantController restaurantCartController =
      Get.find<RestaurantController>();
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
          restaurantCartController.cart.value.cartItems.firstWhere((item) {
        return item.id == Get.parameters["cartItemId"];
      }));
      controller.getRestaurant(this.cartItem.value!.restaurantId).then((value) {
        setState(() {
          currentRestaurant = value;
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
        appBar: CustomerAppBar(
          title: currentRestaurant != null
              ? "${cartItem.value!.item.name[lang.userLanguageKey]}"
              : "",
          autoBack: true,
        ),
        body: (cartItem.value?.item == null)
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : itemViewScreenBody(context),
      ),
    );
  }

  Container itemViewScreenBody(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl: cartItem.value!.item.image!,
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          margin: EdgeInsets.only(top: 10),
                          width: Get.width / 1.5,
                          height: Get.width / 1.5,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover, image: imageProvider)),
                        );
                      },
                      fit: BoxFit.cover,
                      placeholder: (context, url) {
                        return Container(
                          width: Get.width / 1.5,
                          height: Get.width / 1.5,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                      errorWidget: (context, url, error) => Container(
                          height: Get.width / 1.5,
                          width: Get.width / 1.5,
                          child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade300),
                              child: Icon(
                                Icons.image,
                                color: Colors.grey,
                                size: 30,
                              ))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                        "${cartItem.value!.item.description![lang.userLanguageKey]!.inCaps}",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 12.sp)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ChooseOneCheckBox(
                    chooseOneOptions: cartItem.value!.item.chooseOneOptions,
                    cartItem: cartItem,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ChooseManyCheckBoxes(
                      chooseManyOptions: cartItem.value!.item.chooseManyOptions,
                      cartItem: cartItem),
                  TextFieldComponent(
                    textController: _noteTextEdittingController,
                    hint: _i18n()["notes"],
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
            currentRestaurantId: currentRestaurant?.info.id,
          )
        ],
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
          if (value.isOpen == true) {
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
          } else {
            isOpen = false;
          }
        }
      });
      return isOpen;
    } else {
      return true;
    }
  }
}
