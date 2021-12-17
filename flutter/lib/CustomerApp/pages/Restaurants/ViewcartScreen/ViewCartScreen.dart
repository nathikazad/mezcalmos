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
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/ResponsiveUtilities.dart';
import 'components/cartIsEmptyScreen.dart';

class ViewCartScreen extends StatefulWidget {
  @override
  _ViewCartScreenState createState() => _ViewCartScreenState();
}

class _ViewCartScreenState extends State<ViewCartScreen> {
  LanguageController lang = Get.find<LanguageController>();
  RestaurantController controller = Get.find<RestaurantController>();
  bool _clickedOrderNow = false;
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
              builder: (_) => SingleChildScrollView(child: ViewCartBody()));
        } else {
          return CartIsEmptyScreen();
        }
      }),
      bottomNavigationBar: Obx(
        () => ButtonComponent(
            bgColor: getTheRightButtonColor(),
            widget: Center(
                child: getTheRightWidgetForOrderNowButton(!_clickedOrderNow)),
            function: checkoutActionButton),
      ),
    );
  }

  Color getTheRightButtonColor() {
    // it returns the pruple or the grey color for the order now button
    if (controller.cart.value.toLocation == null ||
        controller.cart.value.toLocation?.address ==
            "Unnamed Road, Cupertino, CA 95014, USA") {
      return Color(0xdddddddd);
    } else {
      return Color(0xffac59fc);
    }
  }

  Widget getTheRightWidgetForOrderNowButton(bool clicked) {
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

  void checkoutActionButton() async {
    if (controller.cart.value.toLocation == null ||
        controller.cart.value.toLocation?.address ==
            "Unnamed Road, Cupertino, CA 95014, USA") {
//do nothing ...
    } else {
      if (controller.cart.value.toLocation != null) {
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
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}
