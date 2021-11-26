import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/components/buttonComponent.dart';
import 'package:mezcalmos/CustomerApp/components/textFieldComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import '../../../../router.dart';
import 'buildCart.dart';
import 'buildItems.dart';
import 'dropDownListCartView.dart';

final currency = new NumberFormat("#,##0.00", "en_US");

class ViewCartBody extends StatefulWidget {
  ViewCartBody({Key? key}) : super(key: key);

  @override
  _ViewCartBodyState createState() => _ViewCartBodyState();
}

class _ViewCartBodyState extends State<ViewCartBody> {
  LanguageController lang = Get.find<LanguageController>();
  RestaurantController controller = Get.find<RestaurantController>();
  bool _clickedOrderNow = false;
  TextEditingController textcontoller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
              border: Border.all(color: const Color(0xffececec), width: 0.5),
              color: const Color(0x80ffffff),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
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
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    width: Get.width,
                    height: 0.5,
                    decoration: BoxDecoration(color: const Color(0xffececec))),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
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
                                          .toFirebaseFormattedJson()["cost"] !=
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
          DropDownListCartView(),
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
            hint: lang.strings["customer"]["restaurant"]["menu"]["notes"],
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
                          popEverythingAndNavigateTo(getRestaurantOrderRoute(
                              response.data["orderId"]));
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
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
