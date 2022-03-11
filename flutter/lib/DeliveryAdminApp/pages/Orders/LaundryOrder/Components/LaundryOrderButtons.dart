import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/DialogComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/buttonComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp/constants/global.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryOrderController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n = Get.find<LanguageController>().strings["DeliveryAdminApp"]['pages']
['Orders']["LaundryOrder"]["Components"]["LaundryOrderButtons"];

// the styles of status buttons inside the order screen
class OrderButtons {
  // this button for cancel order
  static Widget cancelButtonWidget(String orderId) {
    LaundryOrderController controller = Get.find<LaundryOrderController>();
    

    return Expanded(
      child: ButtonComponent(
        function: () async {
          var res = await dialogComponent(
              _i18n["title"],
              _i18n["subTitle"], () {
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

  // this button for startPickUp
  static Widget startPickUp(
    String orderId,
  ) {
    LaundryOrderController controller = Get.find<LaundryOrderController>();
    
    return ButtonComponent(
        widget: Text(_i18n['startPickUp'],
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
          var res = await dialogComponent(
              _i18n['startPickUpTitle'],
              _i18n['startPickUpText'],
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
    
    return ButtonComponent(
      widget: Text(_i18n['pickedUp'],
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
        var res = await dialogComponent(
            _i18n['pickedUpTitle'],
            _i18n['pickedUpText'], () {
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
    

    return ButtonComponent(
        widget: Text(_i18n['atLaundry'],
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
              _i18n['atLaundryTitle'],
              _i18n['atLaundryText'],
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
                _i18n['orderWeightError']);
          }
        });
  }

  //this button for readyforDelivery
  static Widget readyForDeliveryButton(LaundryOrder order) {
    LaundryOrderController controller = Get.find<LaundryOrderController>();
    
    return ButtonComponent(
        widget: Text(
            _i18n['readyForDelivery'],
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
        function: (order.dropoffDriver != null)
            ? () async {
                var res = await dialogComponent(
                    _i18n["readyForDeliveryTitle"],
                    _i18n["readyForDeliveryText"], () {
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
                  Get.back();
                }
              }
            : () {
                Get.snackbar("Please select a driver ", "");
              });
  }

  //this button for otwDelivery
  static Widget otwDeliveryButton(String orderId) {
    LaundryOrderController controller = Get.find<LaundryOrderController>();
    
    return ButtonComponent(
        widget: Text(_i18n['otwDelivery'],
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
              _i18n["otwDeliveryTitle"],
              _i18n["otwDeliveryText"],
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
            Get.back();
          }
        });
  }

  //this button for deliverd
  static Widget deliverdButton(String orderId) {
    LaundryOrderController controller = Get.find<LaundryOrderController>();
    
    return ButtonComponent(
        widget: Text(_i18n['delivered'],
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
              _i18n["deliveredTitle"],
              _i18n["deliveredText"], () {
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
