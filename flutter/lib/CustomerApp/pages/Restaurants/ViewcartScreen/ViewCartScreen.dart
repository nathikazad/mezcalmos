import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/buttonComponent.dart';
import 'package:mezcalmos/CustomerApp/components/customerAppBar.dart';
import 'package:mezcalmos/CustomerApp/components/textFieldComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantCartController.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/MapViews/savedLocationView.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';

import 'components/buildCart.dart';
import 'components/buildItems.dart';

final currency = new NumberFormat("#,##0.00", "en_US");

class ViewCartScreen extends StatefulWidget {
  @override
  _ViewCartScreenState createState() => _ViewCartScreenState();
}

class _ViewCartScreenState extends State<ViewCartScreen> {
  MyPopupMenuController _popUpController = MyPopupMenuController();

  LanguageController lang = Get.find<LanguageController>();
  RestaurantCartController controller = Get.find<RestaurantCartController>();
  bool _clickedOrderNow = false;
  TextEditingController textcontoller = new TextEditingController();
  // Rxn<Cart> cart = Rxn();

  List<DropdownMenuItem<String>> pickLocationDropDownList() {
    List<DropdownMenuItem<String>> dropDownList = <DropdownMenuItem<String>>[
      DropdownMenuItem(
        child: Text(lang.strings["shared"]["inputLocation"]["pickFromMap"]),
        value: "_pick_",
      ),
    ];
    mezDbgPrint(controller.cart.value.toFirebaseFormattedJson());
    if (controller.cart.value.toLocation != null) {
      dropDownList.add(DropdownMenuItem<String>(
          child: Text(controller.cart.value.toLocation!.address),
          value: controller.cart.value.toLocation.toString()));
    }
    return dropDownList;
  }

  @override
  void initState() {
    super.initState();
    controller.cart.value.items.map((item) {
      mezDbgPrint(
          "+++ From ViewCartScreen ==> ${item.id} <= notes => ${item.notes}");
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _popUpController.hideMenu();
    _popUpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: customerAppBar(AppBarLeftButtonType.Back, _popUpController,
          withCart: false),
      body: Obx(() => controller.cart.value.items.length > 0
          ? GetBuilder<RestaurantCartController>(
              // specify type as Controller
              init: RestaurantCartController(), // intialize with the Controller
              builder: (_) => SingleChildScrollView(
                    child: Column(
                      children: [
                        (controller.cart.value.quantity() >= 1)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  buildCart(controller.cart.value),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  buildItems(controller.cart.value.items),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              )
                            : Container(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          alignment: Alignment.centerLeft,
                          child: Text(
                              "${lang.strings['customer']['restaurant']['cart']['totalCost']}",
                              style: const TextStyle(
                                  color: const Color(0xff000f1c),
                                  fontFamily: "psb",
                                  fontSize: 14.0),
                              textAlign: TextAlign.left),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          width: Get.width,
                          height: 113,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            border: Border.all(
                                color: const Color(0xffececec), width: 0.5),
                            color: const Color(0x80ffffff),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                          "${lang.strings['customer']['restaurant']['cart']['deliveryCost']}",
                                          style: const TextStyle(
                                              color: const Color(0xff000f1c),
                                              fontFamily: "psr",
                                              fontSize: 20.0),
                                          textAlign: TextAlign.left),
                                      Spacer(),
                                      Text(" \$${currency.format(40.00)}",
                                          style: TextStyle(
                                              color: const Color(0xff000f1c),
                                              fontFamily: "psb",
                                              fontSize: 20.0.sp),
                                          textAlign: TextAlign.right)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  width: Get.width,
                                  height: 0.5,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffececec))),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    children: [
                                      // Total
                                      Text(
                                          "${lang.strings['customer']['restaurant']['cart']['total']}",
                                          style: const TextStyle(
                                              color: const Color(0xff000f1c),
                                              fontFamily: "psr",
                                              fontSize: 20.0),
                                          textAlign: TextAlign.left),
                                      Spacer(),
                                      Obx(
                                        () => Text(
                                            (controller.cart.value
                                                            .toFirebaseFormattedJson()[
                                                        "cost"] !=
                                                    null)
                                                ? "  \$ ${currency.format(controller.cart.value.toFirebaseFormattedJson()["cost"] as dynamic)}"
                                                : "0",
                                            style: TextStyle(
                                                color: const Color(0xff000f1c),
                                                fontFamily: "psb",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 20.0.sp),
                                            textAlign: TextAlign.right),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          alignment: Alignment.centerLeft,
                          child: Text(
                              "${lang.strings['customer']['restaurant']['cart']['deliveryLocation']}",
                              style: const TextStyle(
                                  color: const Color(0xff000f1c),
                                  fontFamily: "psb",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                              textAlign: TextAlign.left),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              border: Border.all(
                                  color: const Color(0xffececec), width: 0.5),
                              color: const Color(0x80ffffff)),
                          child: DropdownButtonHideUnderline(
                            child: Obx(() {
                              return DropdownButton<String>(
                                value: controller.cart.value.toLocation
                                        ?.toString() ??
                                    "_pick_",
                                // changed this to show the address much more clearly.
                                isDense: false,
                                isExpanded: true,
                                hint: Text(
                                    lang.strings["customer"]["restaurant"]
                                        ["cart"]["pickLocation"],
                                    style: const TextStyle(
                                        color: const Color(0xff000f1c),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "FontAwesome5Pro",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.0),
                                    textAlign: TextAlign.left),
                                icon: Icon(Icons.expand_more),
                                items: pickLocationDropDownList(),
                                onChanged: (newValue) async {
                                  // we will route the user back to the Map
                                  if (newValue == "_pick_") {
                                    var _loc;
                                    // await Get.toNamed(kPickLocationRoute);
                                    Get.to(() => SavedLocationView());
                                    if (_loc != null) {
                                      mezDbgPrint(
                                          "Get.back executed with  res : ${(_loc as Location?)!.toString()}");
                                      controller.cart.value.toLocation = _loc;
                                      controller.saveCart();
                                      controller.refresh();
                                    } else {
                                      mezDbgPrint(
                                          "Pick map view returned Null !!!");
                                    }
                                  }
                                },
                              );
                            }),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          alignment: Alignment.centerLeft,
                          child: Text(
                              "${lang.strings['customer']['restaurant']['menu']['notes']}",
                              style: const TextStyle(
                                  color: const Color(0xff000f1c),
                                  fontFamily: "psb",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                              textAlign: TextAlign.left),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFieldComponent(
                          textController: textcontoller,
                          hint: lang.strings["customer"]["restaurant"]["menu"]
                              ["notes"],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        ButtonComponent(
                            bgColor: controller.cart.value.toLocation == null
                                ? const Color(0xdddddddd)
                                : const Color(0xffac59fc),
                            widget: Center(
                              child: !_clickedOrderNow
                                  ? Text(
                                      "${lang.strings['customer']['restaurant']['cart']['orderNow']}",
                                      style: TextStyle(
                                          color: const Color(0xffffffff),
                                          fontFamily: "psb",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.0),
                                      textAlign: TextAlign.center)
                                  : Container(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 1,
                                      ),
                                    ),
                            ),
                            function:
                                controller.cart.value.toLocation != null &&
                                        !_clickedOrderNow
                                    ? () async {
                                        if (controller.cart.value.toLocation !=
                                            null) {
                                          setState(() {
                                            _clickedOrderNow = true;
                                          });
                                          controller.cart.value.notes =
                                              textcontoller.text;
                                          mezDbgPrint(controller.cart.value
                                              .toFirebaseFormattedJson()
                                              .toString());

                                          var response =
                                              await controller.checkout();
                                          print(response.errorCode.toString());
                                          if (response.success) {
                                            controller.clearCart();
                                            popEverythingAndNavigateTo(
                                                getRestaurantOrderRoute(
                                                    response.data["orderId"]));
                                          } else {
                                            print(response);
                                            if (response.errorCode ==
                                                "serverError") {
                                              // do something
                                            } else if (response.errorCode ==
                                                "inMoreThanThreeOrders") {
                                              // do something
                                            } else if (response.errorCode ==
                                                "restaurantClosed") {
                                              // do something
                                            } else {
                                              // do something
                                            }
                                          }

                                          setState(() {
                                            _clickedOrderNow = false;
                                          });
                                        }
                                      }
                                    : () {
                                        // TODO : maybe add a pop up notifying the user that he/she should pick lcoation !
                                      }),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ))
          : MezLogoAnimation(
              centered: true,
            )),
    );
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}
