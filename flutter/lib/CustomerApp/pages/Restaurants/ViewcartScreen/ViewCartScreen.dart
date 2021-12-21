import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/appbar.dart';
import 'package:mezcalmos/CustomerApp/components/buttonComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewcartScreen/components/viewCartBody.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'components/cartIsEmptyScreen.dart';
import 'package:intl/intl.dart';

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

  TextEditingController textcontoller = new TextEditingController();
  CustomerAuthController customerAuthController =
      Get.find<CustomerAuthController>();
  var listOfSavedLoacations = <SavedLocation>[];
  SavedLocation? dropDownListValue;

  @override
  void initState() {
    super.initState();
    // check if cart empty
    // if yes redirect to home page
    controller.cart.value.items.map((item) {
      mezDbgPrint(
          "+++ From ViewCartScreen ==> ${item.id} <= notes => ${item.notes}");
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint(controller.cart.value.toLocation?.toFirebaseFormattedJson());

    responsiveSize(context);
    return Scaffold(
      appBar: CustomerAppBar(
        autoBack: true,
        title: "${lang.strings["customer"]["restaurant"]["cart"]["myCart"]}",
      ),
      body: Obx(() {
        if (controller.cart.value.items.length > 0) {
          return GetBuilder<RestaurantController>(
              // specify type as Controller
              init: RestaurantController(), // intialize with the Controller
              builder: (_) => SingleChildScrollView(child: ViewCartBody(
                    onValueChangeCallback: ({String? newValue}) {
                      mezDbgPrint("onValueChangeCallback :: $newValue");
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
                  )));
        } else {
          return CartIsEmptyScreen();
        }
      }),
      bottomNavigationBar: ButtonComponent(
          bgColor: getTheRightButtonColor(),
          widget: Center(
              child: getTheRightWidgetForOrderNowButton(!_clickedOrderNow)),
          function: checkoutActionButton),
    );
  }

  Color getTheRightButtonColor() {
    // it returns the pruple or the grey color for the order now button

    if (ddResult == DropDownResult.Null ||
        !checkRestaurantAvailability(
            schedule: controller.associatedRestaurant!.schedule)) {
      return Color(0xdddddddd);
    } else {
      return Color(0xffac59fc);
    }
  }

  Widget getTheRightWidgetForOrderNowButton(bool clicked) {
    if (!checkRestaurantAvailability(
        schedule: controller.associatedRestaurant!.schedule)) {
      return Text("This restaurant is closed",
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.white));
    }
    if (!clicked) {
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

//itemviewscreen
  void checkoutActionButton() async {
    // if (controller.cart.value.toLocation != null) {
    mezDbgPrint("Called : checkoutActionButton : DdResult ($ddResult}");
    if (ddResult != DropDownResult.Null) {
      setState(() {
        _clickedOrderNow = true;
      });
      controller.cart.value.notes = textcontoller.text;
      mezDbgPrint(controller.cart.value.toFirebaseFormattedJson().toString());

      var response = await controller.checkout();
      print(response.errorCode.toString());
      if (response.success) {
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

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}
