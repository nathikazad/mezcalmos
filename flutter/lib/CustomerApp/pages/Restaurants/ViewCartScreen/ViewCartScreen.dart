import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/components/ButtonComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewcartScreen/components/ViewCartBody.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';

import 'components/CartIsEmptyScreen.dart';

enum DropDownResult { Null, String }

class ViewCartScreen extends StatefulWidget {
  @override
  _ViewCartScreenState createState() => _ViewCartScreenState();
}

class _ViewCartScreenState extends State<ViewCartScreen> {
  LanguageController lang = Get.find<LanguageController>();
  RestaurantController controller = Get.find<RestaurantController>();
  bool _clickedOrderNow = false;
  DropDownResult ddResult = DropDownResult.Null;

  TextEditingController textcontoller = TextEditingController();
  CustomerAuthController customerAuthController =
      Get.find<CustomerAuthController>();
  var listOfSavedLoacations = <SavedLocation>[];
  SavedLocation? dropDownListValue;
  int nbClicks = 0;
  @override
  void initState() {
    super.initState();
    // check if cart empty
    // if yes redirect to home page
    controller.cart.value.cartItems.map((item) {
      mezDbgPrint(
          "+++ From ViewCartScreen ==> ${item.id} <= notes => ${item.notes}");
    });
  }

  @override
  void dispose() {
    textcontoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // mezDbgPrint(controller.cart.value.toLocation?.toFirebaseFormattedJson());

    responsiveSize(context);
    return Scaffold(
      appBar: CustomerAppBar(
        autoBack: true,
        title: "${lang.strings["customer"]["restaurant"]["cart"]["myCart"]}",
      ),
      body: Obx(() {
        mezDbgPrint("@sa@d@: ${controller.cart.value.cartItems.length}");
        if (controller.cart.value.cartItems.length > 0) {
          return SingleChildScrollView(child: ViewCartBody(
            onValueChangeCallback: ({String? newValue}) {
              mezDbgPrint("@sa@d@: onValueChangeCallback :: $newValue");
              if (newValue == null) {
                setState(() {
                  ddResult = DropDownResult.Null;
                });
              } else {
                setState(() {
                  ddResult = DropDownResult.String;
                });
              }
            },
          ));
        } else {
          return CartIsEmptyScreen();
        }
      }),
      bottomNavigationBar: ButtonComponent(
          bgColor: getTheRightButtonColor(),
          widget: Center(
              child: getTheRightWidgetForOrderNowButton(_clickedOrderNow)),
          function: !_clickedOrderNow ? checkoutActionButton : () {}),
    );
  }

  Color getTheRightButtonColor() {
    // it returns the pruple or the grey color for the order now button

    if (ddResult == DropDownResult.Null ||
        !checkRestaurantAvailability(
            schedule: controller.associatedRestaurant?.schedule)) {
      return Color(0xdddddddd);
    } else {
      return Color(0xffac59fc);
    }
  }

  Widget getTheRightWidgetForOrderNowButton(bool clicked) {
    if (!checkRestaurantAvailability(
        schedule: controller.associatedRestaurant?.schedule)) {
      return Text("${lang.strings["customer"]["restaurant"]["notAvailable"]}",
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.black));
    }
    if (clicked) {
      return Container(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 1,
        ),
      );
    } else {
      return Text(
          "${lang.strings['customer']['restaurant']['cart']['orderNow']}",
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.white));
    }
  }

  /// Call this right after customer presses Checkout
  /// Uses : Make sure that the order has been successfully written to database + already consumed by the listener.
  Future<void> avoidCheckoutRaceCondition(String orderId) async {
    if (Get.find<OrderController>().getOrder(orderId) == null) {
      mezDbgPrint(
          "[+] s@@d ==> [ CHECKOUT RESTAURANT ORDER ]  RACING CONDITION HAPPENING ... ");
      await Get.find<OrderController>()
          .getCurrentOrderStream(orderId)
          .firstWhere((order) => order != null);
    } else
      mezDbgPrint(
          "[+] s@@d ==> [ CHECKOUT RESTAURANT ORDER ] NO RACING CONDITION HAPPEND ! ");
  }

//itemviewscreen
  void checkoutActionButton() async {
    if (nbClicks == 0) {
      mezDbgPrint("Called : checkoutActionButton : DdResult ($ddResult}");
      if (ddResult != DropDownResult.Null) {
        setState(() {
          _clickedOrderNow = true;
        });
        controller.cart.value.notes = textcontoller.text;
        mezDbgPrint(controller.cart.value.toFirebaseFormattedJson().toString());
        //     controller.cart.value.restaurant!.id = "6Hr3Hc2hkkZa7LX7slnFo3zOTdxx";

        var response = await controller.checkout();

        if (response.success) {
          await avoidCheckoutRaceCondition(response.data["orderId"]);

          controller.clearCart();
          popEverythingAndNavigateTo(
              getRestaurantOrderRoute(response.data["orderId"]));
        } else {
          print(response);
          if (response.errorCode == "serverError") {
            // do something
          } else if (response.errorCode == "inMoreThanThreeOrders") {
            // do something
          } else if (response.errorCode == "restaurantClosed") {
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
    nbClicks++;
  }

  bool checkRestaurantAvailability({Schedule? schedule}) {
    var dayNane = DateFormat('EEEE').format(DateTime.now());

    //var xx = DateFormat.jm().format(DateFormat("hh:mm a").parse("9:00 AM"));
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
