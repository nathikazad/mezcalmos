import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/CustomerApp_appbar.dart';
import 'package:mezcalmos/CustomerApp/components/buttonComponent.dart';
import 'package:mezcalmos/CustomerApp/components/customerAppBar.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewcartScreen/components/viewCartBody.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';

import '../../../router.dart';

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
        title: "My Cart",
      ),
      body: Obx(() => controller.cart.value.items.length > 0
          ? GetBuilder<RestaurantController>(
              // specify type as Controller
              init: RestaurantController(), // intialize with the Controller
              builder: (_) => SingleChildScrollView(child: ViewCartBody()))
          : MezLogoAnimation(
              centered: true,
            )),
      bottomNavigationBar: ButtonComponent(
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
          function: controller.cart.value.toLocation != null &&
                  !_clickedOrderNow
              ? () async {
                  if (controller.cart.value.toLocation != null) {
                    setState(() {
                      _clickedOrderNow = true;
                    });
                    controller.cart.value.notes = textcontoller.text;
                    mezDbgPrint(controller.cart.value
                        .toFirebaseFormattedJson()
                        .toString());

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
                      } else if (response.errorCode ==
                          "inMoreThanThreeOrders") {
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
              : () {
                  // TODO : maybe add a pop up notifying the user that he/she should pick lcoation !
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
