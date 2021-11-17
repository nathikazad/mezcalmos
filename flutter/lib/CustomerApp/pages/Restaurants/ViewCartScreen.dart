import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/components/ItemComponent.dart';
import 'package:mezcalmos/CustomerApp/components/actionIconsComponents.dart';
import 'package:mezcalmos/CustomerApp/components/buttonComponent.dart';
import 'package:mezcalmos/CustomerApp/components/customerAppBar.dart';
import 'package:mezcalmos/CustomerApp/components/incrementalComponent.dart';
import 'package:mezcalmos/CustomerApp/components/myExpensionPanelComponent.dart';
import 'package:mezcalmos/CustomerApp/components/textFieldComponent.dart';
import 'package:mezcalmos/CustomerApp/components/titlesComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantCartController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/fbNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/widgets/CancelAlertDailog.dart';
import 'package:mezcalmos/Shared/widgets/MezClearButton.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

final currency = new NumberFormat("#,##0.00", "en_US");

class ViewCartScreen extends StatefulWidget {
  @override
  _ViewCartScreenState createState() => _ViewCartScreenState();
}

class _ViewCartScreenState extends State<ViewCartScreen> {
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
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: customerAppBar(AppBarLeftButtonType.Back, withCart: false),
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
                                    Location _loc =
                                        await Get.toNamed(kPickLocationRoute);
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

  Widget buildCart(Cart cart) {
    return Column(
      children: [
        SizedBox(
          height: 15.sp,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Text("${lang.strings['customer']['restaurant']['cart']['cart']}",
                  style: TextStyle(
                      color: const Color(0xff1d1d1d),
                      fontFamily: "psr",
                      fontSize: 45.0.sp),
                  textAlign: TextAlign.left),
              Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  gradient: LinearGradient(
                    begin: Alignment(0.1689453125, 0),
                    end: Alignment(1, 1),
                    colors: [
                      const Color(0xff5582ff).withOpacity(0.05000000074505806),
                      const Color(0xffc54efc).withOpacity(0.05000000074505806)
                    ],
                  ),
                ),
                child:
                    Text((cart.quantity() != null) ? "${cart.quantity()}" : "0",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: const Color(0xff5c7fff),
                          fontFamily: "psr",
                          fontSize: 30.0.sp,
                        ),
                        textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Container(
                child: Text(
                    lang.strings['customer']['restaurant']['cart']['inCart'],
                    style: TextStyle(
                        color: const Color(0xff000f1c),
                        // fontWeight: FontWeight.w700,
                        fontFamily: "psb",
                        fontSize: 14.0),
                    textAlign: TextAlign.left),
              ),
              Spacer(),
              MezClearButton(
                onTapFunction: () async {
                  bool yesNoRes = await cancelAlertDailog(
                      lang.strings["customer"]["restaurant"]["cart"]
                          ["clearCart"],
                      lang.strings["customer"]["restaurant"]["cart"]
                          ["clearCartConfirm"], () {
                    Get.back(result: true);
                  }, () {
                    Get.back(result: false);
                  });

                  if (yesNoRes) {
                    controller.clearCart();
                    Get.back();
                  }
                },
              ),
            ],
          ),
        ),
        // SizedBox(
        //   height: 15,
        // ),
      ],
    );
  }

  List<Widget> choosenOneOption(Map<dynamic, dynamic> data) {
    List<Widget> myWidgets = [
      SizedBox(
        height: 15,
      )
    ];

    data.forEach((key, value) {
      myWidgets.add(MenuTitles(
        title: key.toUpperCase(),
      ));

      myWidgets.addAll([
        Container(
          width: Get.width,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 25, top: 5),
          child: Text(data[key].toString().inCaps,
              style: TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  fontFamily: "psr",
                  fontStyle: FontStyle.normal,
                  fontSize: 17.0.sp),
              textAlign: TextAlign.left),
        ),
        SizedBox(
          height: 10,
        )
      ]);
    });
    return myWidgets;
  }

  List<Widget> choosenMannyOption(Map<dynamic, dynamic> data) {
    List<Widget> myWidgets = [
      SizedBox(
        height: 5,
      ),
      MenuTitles(
          title: lang.strings["customer"]["restaurant"]["cart"]["options"]),
    ];

    data.forEach((key, value) {
      if (value == true) {
        myWidgets.add(
          Container(
            width: Get.width,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 25, top: 5),
            child: Text("${key}".inCaps,
                style: const TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "ProductSans",
                    fontStyle: FontStyle.normal,
                    fontSize: 17.0),
                textAlign: TextAlign.left),
          ),
        );
      }
    });
    return myWidgets;
  }

  Widget buildItems(List<CartItem> cartItems) {
    print(cartItems.toString());
    return Column(
      children: cartItems.fold<List<Widget>>(<Widget>[], (children, element) {
        var counter = element.totalCost().obs;
        print("${element.toFirebaseFunctionFormattedJson()}");
        mezDbgPrint("${element.id}");
        children.add(
          Container(
            padding: const EdgeInsets.only(bottom: 15),
            margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: const Color(0xffececec), width: 0.5),
              color: const Color(0x80ffffff),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyExpensionPanelComponent(
                    child: Container(
                      // width: 200,

                      child: ItemComponent(
                        imgUrl: "${element.item.image}",
                        title: "${element.item.name?.inCaps}",
                      ),
                    ),
                    children: choosenOneOption(element.chosenOneOptions) +
                        choosenMannyOption(element.chosenManyOptions),
                    onEdit: () {
                      mezDbgPrint(
                          " the data inside the expansion ${element.toFirebaseFunctionFormattedJson()}");
                      Get.toNamed(editCartItemRoute("${element.id}"));
                    }),
                SizedBox(
                  height: 15,
                ),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        IncrementalComponent(
                            minVal: 0,
                            increment: () {
                              counter.value =
                                  counter.value + element.costPerOne();
                              print("${element.item.id}");
                              controller.incrementItem(element.id!, 1);
                              controller.refresh();
                            },
                            onChangedToZero: (isZero) async {
                              if (isZero) {
                                controller.refresh();
                                bool yesNoResult = await cancelAlertDailog(
                                  lang.strings["customer"]["restaurant"]["cart"]
                                      ["deleteItem"],
                                  lang.strings["customer"]["restaurant"]["cart"]
                                      ["deleteItemConfirm"],
                                  () {
                                    Get.back(result: true);
                                  },
                                  () {
                                    Get.back(result: false);
                                  },
                                );
                                mezDbgPrint(
                                    " the returend value from the dailog $yesNoResult");
                                if (yesNoResult == true) {
                                  controller.deleteItem("${element.id}");

                                  if (controller.cart.value.quantity() == 0) {
                                    Get.until((route) =>
                                        route.settings.name == kHomeRoute);
                                  }
                                  // controller.refresh();
                                }
                              }
                            },
                            value: element.quantity,
                            decrement: () {
                              if (element.quantity <= 1) {
                              } else {
                                counter.value =
                                    counter.value + element.costPerOne();
                                controller.incrementItem(element.id!, -1);
                                controller.refresh();
                              }
                            }),
                        Spacer(),
                        Obx(
                          () => Text("\$${currency.format(counter.value)}",
                              style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                    color: const Color(0xff000f1c),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "ProductSans",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20.0),
                              ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        );
        return children;
      }),
    );
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}
