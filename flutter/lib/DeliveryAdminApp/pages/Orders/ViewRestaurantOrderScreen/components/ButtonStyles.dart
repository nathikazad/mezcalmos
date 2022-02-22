import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/buttonComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/DialogComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp/constants/global.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n = Get.find<LanguageController>().strings["DeliveryAdminApp"]["pages"]
["Orders"]["ViewRestaurantOrderScreen"]["components"]
    ["ButtonStyles"];
// the styles of status buttons inside the order screen
class ButtonsStyle {
  // this button for cancel order
  static Widget cancelButtonWidget(String orderId) {
    OrderController controller = Get.find<OrderController>();


    return Expanded(
      child: ButtonComponent(
        function: () async {
          var res = await dialogComponent(
              _i18n["cancelAlert"]["title"],
              _i18n["cancelAlert"]["subTitle"], () {
            Get.back(result: true);
          }, () {
            Get.back(result: false);
          },
              Container(height: 40, width: 40, child: Image.asset(cancelIcon)),
              LinearGradient(
                  begin: Alignment(-0.10374055057764053, 0),
                  end: Alignment(1.1447703838348389, 1.1694844961166382),
                  colors: [const Color(0xede21132), const Color(0xdbd11835)]));
          if (res) {
            controller.cancelOrder(orderId);
            Get.back();
          }
        },
        widget: Text(
            _i18n["cancel"]
                .toUpperCase(),
            style: TextStyle(
                color: const Color(0xffffffff),
                fontFamily: "psb",
                fontStyle: FontStyle.normal,
                fontSize: 16.0.sp),
            textAlign: TextAlign.center),
        gradient: const LinearGradient(
            begin: Alignment(-0.10374055057764053, 0),
            end: Alignment(1.1447703838348389, 1.1694844961166382),
            colors: [const Color(0xede21132), const Color(0xdbd11835)]),
      ),
    );
  }

  // this button for PreparingOrder
  static Widget preparingOrderButtonWidget(String orderId) {
    OrderController controller = Get.find<OrderController>();
    return ButtonComponent(
        widget: Text(
            _i18n["readyForPickUp"],
            style: TextStyle(
                color: const Color(0xffffffff),
                fontFamily: "psb",
                fontSize: 16.0.sp),
            textAlign: TextAlign.center),
        gradient: LinearGradient(
            begin: Alignment(-0.10374055057764053, 0),
            end: Alignment(1.1447703838348389, 1.1694844961166382),
            colors: [
              // const Color(0xede29211),
              const Color(0xffd3bc0b),
              const Color(0xdbd17c18)
            ]),
        function: () async {
          var res = await dialogComponent(
              _i18n["readyAlert"]["title"],
              _i18n["readyAlert"]["subTitle"], () {
            Get.back(result: true);
          }, () {
            Get.back(result: false);
          },
              Container(height: 70, width: 70, child: Image.asset(box)),
              LinearGradient(
                  begin: Alignment(-0.10374055057764053, 0),
                  end: Alignment(1.1447703838348389, 1.1694844961166382),
                  colors: [
                    // const Color(0xede29211),
                    const Color(0xffd3bc0b),
                    const Color(0xdbd17c18)
                  ]));
          if (res) {
            Get.snackbar("Loading", "");
            controller.readyForPickupOrder(orderId);
          }
        });
  }

  // this button for ReadyForPickup
  static Widget readyForPickupButtonWidget(String orderId) {
    OrderController controller = Get.find<OrderController>();
    return ButtonComponent(
      widget: Text(_i18n["deliver"],
          style: TextStyle(
              color: const Color(0xffffffff),
              fontFamily: "psb",
              fontSize: 16.0.sp),
          textAlign: TextAlign.center),
      gradient: LinearGradient(
          begin: Alignment(-0.10374055057764053, 0),
          end: Alignment(1.1447703838348389, 1.1694844961166382),
          colors: [const Color(0xff5572ea), const Color(0xdb1f18d1)]),
      function: () async {
        var res = await dialogComponent(
            _i18n["onTheWayAlert"]["title"],
            _i18n["onTheWayAlert"]["subTitle"], () {
          Get.back(result: true);
        }, () {
          Get.back(result: false);
        },
            Container(height: 70, width: 70, child: Image.asset(truck)),
            LinearGradient(
                begin: Alignment(-0.10374055057764053, 0),
                end: Alignment(1.1447703838348389, 1.1694844961166382),
                colors: [const Color(0xff5572ea), const Color(0xdb1f18d1)]));
        if (res) {
          Get.snackbar("Loading", "");
          controller.deliverOrder(orderId);
        }
      },
    );
  }

  // this button for OrderReceieved
  static Widget orderReceievedButtonWidget(String orderId) {
    OrderController controller = Get.find<OrderController>();
    return ButtonComponent(
        widget: Text(
            _i18n["preparing"],
            style: TextStyle(
                color: const Color(0xffffffff),
                fontFamily: "psb",
                fontStyle: FontStyle.normal,
                fontSize: 16.0.sp),
            textAlign: TextAlign.center),
        gradient: LinearGradient(
            begin: Alignment(-0.10374055057764053, 0),
            end: Alignment(1.1447703838348389, 1.1694844961166382),
            colors: [const Color(0xffff9300), const Color(0xdbd15f18)]),
        function: () async {
          var res = await dialogComponent(
              _i18n["prepareAlert"]["title"],
              _i18n["prepareAlert"]["subTitle"], () {
            Get.back(result: true);
          }, () {
            Get.back(result: false);
          },
              Container(height: 70, width: 70, child: Image.asset(stoveIcon)),
              LinearGradient(
                  begin: Alignment(-0.10374055057764053, 0),
                  end: Alignment(1.1447703838348389, 1.1694844961166382),
                  colors: [const Color(0xffff9300), const Color(0xdbd15f18)]));

          if (res) {
            Get.snackbar("Loading", "");
            controller.prepareOrder(orderId);
          }
        });
  }

  //this button for OnTheWay
  static Widget onTheWayButtonWidget(String orderId) {
    OrderController controller = Get.find<OrderController>();
    return ButtonComponent(
        widget: Text(
            _i18n["received"],
            style: TextStyle(
                color: const Color(0xffffffff),
                fontFamily: "psb",
                fontSize: 16.0.sp),
            textAlign: TextAlign.center),
        gradient: LinearGradient(
            begin: Alignment(-0.10374055057764053, 0),
            end: Alignment(1.1447703838348389, 1.1694844961166382),
            colors: [const Color(0xff13cb29), const Color(0xdb219125)]),
        function: () async {
          var res = await dialogComponent(
              _i18n["deliveredAlert"]["title"],
              _i18n["deliveredAlert"]["subTitle"],
              () {
            Get.back(result: true);
          }, () {
            Get.back(result: false);
          },
              Container(height: 70, width: 70, child: Image.asset(tick)),
              LinearGradient(
                  begin: Alignment(-0.10374055057764053, 0),
                  end: Alignment(1.1447703838348389, 1.1694844961166382),
                  colors: [const Color(0xff13cb29), const Color(0xdb219125)]));
          if (res) {
            Get.snackbar("Loading", "");
            controller.dropOrder(orderId);
            Get.back();
          }
        });
  }
}
