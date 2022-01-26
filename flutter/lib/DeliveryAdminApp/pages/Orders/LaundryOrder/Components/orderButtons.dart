import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/buttonComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/dailogComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp/constants/global.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryOrderController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

// the styles of status buttons inside the order screen
class OrderButtons {
  // this button for cancel order
  static Widget cancelButtonWidget(String orderId) {
    LaundryOrderController controller = Get.find<LaundryOrderController>();
    LanguageController lang = Get.find<LanguageController>();

    return Expanded(
      child: ButtonComponent(
        function: () async {
          var res = await dailogComponent(
              lang.strings["deliveryAdminApp"]["cancelAlert"]["title"],
              lang.strings["deliveryAdminApp"]["cancelAlert"]["subTitle"], () {
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
            lang.strings["customer"]["restaurant"]["checkout"]["cancel"]
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

  // this button for startPickUp
  static Widget startPickUp(String orderId) {
    LaundryOrderController controller = Get.find<LaundryOrderController>();
    LanguageController lang = Get.find<LanguageController>();
    return ButtonComponent(
        widget: Text("Start Pick-up",
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
          var res = await dailogComponent('Start order Pickup',
              "The driver should be notified to pick up the order", () {
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
            controller.otwPickupOrder(orderId);
          }
        });
  }

  // this button for pickedUp
  static Widget pickedUp(String orderId) {
    LaundryOrderController controller = Get.find<LaundryOrderController>();
    LanguageController lang = Get.find<LanguageController>();
    return ButtonComponent(
      widget: Text("Picked-up",
          style: TextStyle(
              color: const Color(0xffffffff),
              fontFamily: "psb",
              fontSize: 16.0.sp),
          textAlign: TextAlign.center),
      gradient: LinearGradient(
          begin: Alignment(-0.10374055057764053, 0),
          end: Alignment(1.1447703838348389, 1.1694844961166382),
          colors: [const Color(0xffff9300), const Color(0xdbd15f18)]),
      function: () async {
        var res = await dailogComponent(
            "Order Picked up", "Confirm order picked up from the customer", () {
          Get.back(result: true);
        }, () {
          Get.back(result: false);
        },
            Container(height: 70, width: 70, child: Image.asset(truck)),
            LinearGradient(
                begin: Alignment(-0.10374055057764053, 0),
                end: Alignment(1.1447703838348389, 1.1694844961166382),
                colors: [const Color(0xffff9300), const Color(0xdbd15f18)]));
        if (res) {
          Get.snackbar("Loading", "");
          controller.pickedUpOrder(orderId);
        }
      },
    );
  }

  // this button for atTheLaundry
  static Widget atTheLaundry(String orderId) {
    LaundryOrderController controller = Get.find<LaundryOrderController>();
    LanguageController lang = Get.find<LanguageController>();

    return ButtonComponent(
        widget: Text('At laundry',
            style: TextStyle(
                color: const Color(0xffffffff),
                fontFamily: "psb",
                fontStyle: FontStyle.normal,
                fontSize: 16.0.sp),
            textAlign: TextAlign.center),
        gradient: LinearGradient(
            begin: Alignment(-0.10374055057764053, 0),
            end: Alignment(1.1447703838348389, 1.1694844961166382),
            colors: [const Color(0xff5572ea), const Color(0xdb1f18d1)]),
        function: () async {
          var res = await orderWeightDialog(
              'Order at laundry',
              'Confirm the order received by the laundry',
              () {},
              () {},
              Icon(
                Icons.local_laundry_service_rounded,
                color: Colors.blueAccent,
                size: 70,
              ),
              LinearGradient(
                  begin: Alignment(-0.10374055057764053, 0),
                  end: Alignment(1.1447703838348389, 1.1694844961166382),
                  colors: [const Color(0xff5572ea), const Color(0xdb1f18d1)]));

          if (res != 0) {
            Get.snackbar("Loading", "");
            controller.atLaundryOrder(orderId, res);
          } else {
            Get.snackbar('Error', "You must set the order weight");
          }
        });
  }

  //this button for readyforDelivery
  static Widget readyForDeliveryButton(String orderId) {
    LaundryOrderController controller = Get.find<LaundryOrderController>();
    LanguageController lang = Get.find<LanguageController>();
    return ButtonComponent(
        widget: Text('Ready for delivery',
            style: TextStyle(
                color: const Color(0xffffffff),
                fontFamily: "psb",
                fontSize: 16.0.sp),
            textAlign: TextAlign.center),
        gradient: LinearGradient(
            begin: Alignment(-0.10374055057764053, 0),
            end: Alignment(1.1447703838348389, 1.1694844961166382),
            colors: [const Color(0xffff9300), const Color(0xdbd15f18)]),
        function: () async {
          var res = await dailogComponent(
              lang.strings["deliveryAdminApp"]["deliveredAlert"]["title"],
              lang.strings["deliveryAdminApp"]["deliveredAlert"]["subTitle"],
              () {
            Get.back(result: true);
          }, () {
            Get.back(result: false);
          },
              Container(height: 70, width: 70, child: Image.asset(tick)),
              LinearGradient(
                  begin: Alignment(-0.10374055057764053, 0),
                  end: Alignment(1.1447703838348389, 1.1694844961166382),
                  colors: [const Color(0xffff9300), const Color(0xdbd15f18)]));
          if (res) {
            Get.snackbar("Loading", "");
            controller.readyForDeliveryOrder(orderId);
            Get.back();
          }
        });
  }

  //this button for otwDelivery
  static Widget otwDeliveryButton(String orderId) {
    LaundryOrderController controller = Get.find<LaundryOrderController>();
    LanguageController lang = Get.find<LanguageController>();
    return ButtonComponent(
        widget: Text('Delivery on the way',
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
          var res = await dailogComponent(
              lang.strings["deliveryAdminApp"]["deliveredAlert"]["title"],
              lang.strings["deliveryAdminApp"]["deliveredAlert"]["subTitle"],
              () {
            Get.back(result: true);
          }, () {
            Get.back(result: false);
          },
              Container(height: 70, width: 70, child: Image.asset(tick)),
              LinearGradient(
                  begin: Alignment(-0.10374055057764053, 0),
                  end: Alignment(1.1447703838348389, 1.1694844961166382),
                  colors: [const Color(0xff5572ea), const Color(0xdb1f18d1)]));
          if (res) {
            Get.snackbar("Loading", "");
            controller.otwDeliveryOrder(orderId);
            Get.back();
          }
        });
  }

  //this button for deliverd
  static Widget deliverdButton(String orderId) {
    LaundryOrderController controller = Get.find<LaundryOrderController>();
    LanguageController lang = Get.find<LanguageController>();
    return ButtonComponent(
        widget: Text("Delivered",
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
          var res = await dailogComponent(
              lang.strings["deliveryAdminApp"]["deliveredAlert"]["title"],
              lang.strings["deliveryAdminApp"]["deliveredAlert"]["subTitle"],
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
            controller.deliveredOrder(orderId);
            Get.back();
          }
        });
  }
}
