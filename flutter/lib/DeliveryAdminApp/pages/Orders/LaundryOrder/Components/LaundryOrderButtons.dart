import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/buttonComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/dailogComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp/constants/global.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryOrderController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:sizer/sizer.dart';

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
            Get.back(closeOverlays: true);
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
  static Widget startPickUp(
    String orderId,
  ) {
    LaundryOrderController controller = Get.find<LaundryOrderController>();
    LanguageController lang = Get.find<LanguageController>();
    return ButtonComponent(
        widget: Text(lang.strings['deliveryAdminApp']['laundry']['startPickUp'],
            style: TextStyle(
                color: const Color(0xffffffff),
                fontFamily: "psb",
                fontSize: 16.0.sp),
            textAlign: TextAlign.center),
        gradient: LinearGradient(
            begin: Alignment(-0.10374055057764053, 0),
            end: Alignment(1.1447703838348389, 1.1694844961166382),
            colors: [const Color(0xffd3bc0b), const Color(0xdbd17c18)]),
        function: () async {
          var res = await dailogComponent(
              lang.strings['deliveryAdminApp']['laundry']['startPickUpTitle'],
              lang.strings['deliveryAdminApp']['laundry']['startPickUpText'],
              () {
            Get.back(result: true);
          }, () {
            Get.back(result: false);
          },
              Icon(
                Icons.local_shipping_rounded,
                size: 70,
                color: Colors.purple,
              ),
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
      widget: Text(lang.strings['deliveryAdminApp']['laundry']['pickedUp'],
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
            lang.strings['deliveryAdminApp']['laundry']['pickedUpTitle'],
            lang.strings['deliveryAdminApp']['laundry']['pickedUpText'], () {
          Get.back(result: true);
        }, () {
          Get.back(result: false);
        },
            Icon(
              Icons.check_circle,
              size: 70,
              color: Colors.grey,
            ),
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
        widget: Text(lang.strings['deliveryAdminApp']['laundry']['atLaundry'],
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
              lang.strings['deliveryAdminApp']['laundry']['atLaundryTitle'],
              lang.strings['deliveryAdminApp']['laundry']['atLaundryText'],
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
            Get.snackbar(
                'Error',
                lang.strings['deliveryAdminApp']['laundry']
                    ['orderWeightError']);
          }
        });
  }

  //this button for readyforDelivery
  static Widget readyForDeliveryButton(LaundryOrder order) {
    LaundryOrderController controller = Get.find<LaundryOrderController>();
    LanguageController lang = Get.find<LanguageController>();
    return ButtonComponent(
        widget: Text(
            lang.strings['deliveryAdminApp']['laundry']['readyForDelivery'],
            style: TextStyle(
                color: const Color(0xffffffff),
                fontFamily: "psb",
                fontSize: 16.0.sp),
            textAlign: TextAlign.center),
        gradient: LinearGradient(
          begin: Alignment(-0.10374055057764053, 0),
          end: Alignment(1.1447703838348389, 1.1694844961166382),
          colors: (order.dropoffDriver != null)
              ? [Colors.grey, Colors.grey]
              : [const Color(0xffff9300), const Color(0xdbd15f18)],
        ),
        function: () async {
          if (order.dropoffDriver != null) {
            var res = await dailogComponent(
                lang.strings["deliveryAdminApp"]["laundry"]
                    ["readyForDeliveryTitle"],
                lang.strings["deliveryAdminApp"]["laundry"]
                    ["readyForDeliveryText"], () {
              Get.back(result: true);
            }, () {
              Get.back(result: false);
            },
                Icon(
                  Icons.dry_cleaning_rounded,
                  size: 70,
                  color: Colors.purple,
                ),
                LinearGradient(
                    begin: Alignment(-0.10374055057764053, 0),
                    end: Alignment(1.1447703838348389, 1.1694844961166382),
                    colors: [
                      const Color(0xffff9300),
                      const Color(0xdbd15f18)
                    ]));
            if (res) {
              Get.snackbar("Loading", "");
              controller.readyForDeliveryOrder(order.orderId);
              Get.back(closeOverlays: true);
            }
          } else {
            Get.snackbar('Error', 'Please Select a driver');
          }
        });
  }

  //this button for otwDelivery
  static Widget otwDeliveryButton(String orderId) {
    LaundryOrderController controller = Get.find<LaundryOrderController>();
    LanguageController lang = Get.find<LanguageController>();
    return ButtonComponent(
        widget: Text(lang.strings['deliveryAdminApp']['laundry']['otwDelivery'],
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
              lang.strings["deliveryAdminApp"]["laundry"]["otwDeliveryTitle"],
              lang.strings["deliveryAdminApp"]["laundry"]["otwDeliveryText"],
              () {
            Get.back(result: true);
          }, () {
            Get.back(result: false);
          },
              Icon(
                Icons.local_shipping_rounded,
                size: 70,
                color: Colors.purple,
              ),
              LinearGradient(
                  begin: Alignment(-0.10374055057764053, 0),
                  end: Alignment(1.1447703838348389, 1.1694844961166382),
                  colors: [const Color(0xff5572ea), const Color(0xdb1f18d1)]));
          if (res) {
            Get.snackbar("Loading", "");
            controller.otwDeliveryOrder(orderId);
            Get.back(closeOverlays: true);
          }
        });
  }

  //this button for deliverd
  static Widget deliverdButton(String orderId) {
    LaundryOrderController controller = Get.find<LaundryOrderController>();
    LanguageController lang = Get.find<LanguageController>();
    return ButtonComponent(
        widget: Text(lang.strings['deliveryAdminApp']['laundry']['delivered'],
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
              lang.strings["deliveryAdminApp"]["laundry"]["deliveredTitle"],
              lang.strings["deliveryAdminApp"]["laundry"]["deliveredText"], () {
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
            Get.back(closeOverlays: true);
          }
        });
  }
}
