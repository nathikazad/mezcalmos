import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/BottomBarItemViewScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/ItemOptionCard.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
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
    mezDbgPrint("widget.viewItemScreenMode => ${widget.viewItemScreenMode}");
    if (widget.viewItemScreenMode == ViewItemScreenMode.AddItemMode) {
      final String? restaurantId = Get.parameters['restaurantId'];
      controller.getRestaurant("$restaurantId").then((Restaurant? value) {
        setState(() {
          currentRestaurant = value;
        });
      });
      final String? itemId = Get.parameters['itemId'];

      controller.getRestaurant(restaurantId!).then((Restaurant? restaurant) {
        if (restaurant?.findItemById(itemId!) != null) {
          cartItem.value =
              CartItem(restaurant!.findItemById(itemId!)!, restaurantId);
        } else {
          Future.delayed(Duration.zero, () {
            Get.back();
          });
        }
      });
    } else {
      cartItem.value = CartItem.clone(restaurantCartController
          .cart.value.cartItems
          .firstWhere((CartItem item) {
        return item.idInCart == Get.parameters["cartItemId"];
      }));
      controller
          .getRestaurant(cartItem.value!.restaurantId)
          .then((Restaurant? value) {
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
              ? "${cartItem.value!.item.name[userLanguage]}"
              : "",
          autoBack: true,
        ),
        body: (cartItem.value == null)
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
                  if (cartItem.value?.item.image != null && showImage.value)
                    CircleAvatar(
                      radius: 120,
                      backgroundImage: CachedNetworkImageProvider(
                          cartItem.value!.item.image!),
                      onBackgroundImageError:
                          (Object obj, StackTrace? stackTrace) {
                        showImage.value = false;
                      },
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  if (cartItem.value?.item.description != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                          "${cartItem.value!.item.description![userLanguage]!.inCaps}",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 12.sp)),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  if (cartItem.value!.item.options != null)
                    Column(
                      children: List.generate(
                          cartItem.value!.item.options.length,
                          (int index) => ItemOptionCard(
                              cartItem: cartItem,
                              editMode: widget.viewItemScreenMode ==
                                  ViewItemScreenMode.EditItemMode,
                              option: cartItem.value!.item.options[index])),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
          BottomBarItemViewScreen(
            currentRestaurantId: currentRestaurant?.info.id,
            isAvailable: checkRestaurantAvailability(
                schedule: currentRestaurant?.schedule),
            cartItem: cartItem,
            mode: widget.viewItemScreenMode,
          ),
        ],
      )
    );
  }

  bool checkRestaurantAvailability({Schedule? schedule}) {
    final String dayNane = DateFormat('EEEE').format(DateTime.now());

    final DateTime x = DateTime.now();

    if (schedule != null) {
      bool isOpen = false;
      schedule.openHours.forEach((Weekday key, OpenHours value) {
        if (key.toFirebaseFormatString() == dayNane.toLowerCase()) {
          if (value.isOpen == true) {
            final DateTime dateOfStart =
                DateTime(x.year, x.month, x.day, value.from[0], value.from[1]);
            final DateTime dateOfClose =
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
