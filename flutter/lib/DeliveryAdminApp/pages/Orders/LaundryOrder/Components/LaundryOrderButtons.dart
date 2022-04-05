import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/DialogComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/buttonComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp/constants/global.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryOrderController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ['pages']['Orders']["LaundryOrder"]["Components"]["LaundryOrderButtons"];

// the styles of status buttons inside the order screen
class OrderButtons {
  // this button for cancel order
  static Widget cancelButtonWidget(String orderId) {
    final LaundryOrderController controller =
        Get.find<LaundryOrderController>();

    return Expanded(
      child: ButtonComponent(
        function: () async {
          final bool res = await dialogComponent(
              _i18n()["title"], _i18n()["subTitle"], () {
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
            await controller.cancelOrder(orderId);
          }
        },
        widget: Text(_i18n()["cancel"].toUpperCase(),
            style: TextStyle(
                color: const Color(0xffffffff),
                fontFamily: "psb",
                fontStyle: FontStyle.normal,
                fontSize: 16.0.sp),
            textAlign: TextAlign.center),
        gradient: const LinearGradient(
          begin: Alignment(-0.10374055057764053, 0),
          end: Alignment(1.1447703838348389, 1.1694844961166382),
          colors: <Color>[Color(0xede21132), Color(0xdbd11835)],
        ),
      ),
    );
  }

  //this button for readyforDelivery
  static Widget readyForDeliveryButton(LaundryOrder order) {
    /// LaundryOrderController
    final LaundryOrderController controller =
        Get.find<LaundryOrderController>();

    return ButtonComponent(
      widget: Text(_i18n()['readyForDelivery'],
          style: TextStyle(
              color: const Color(0xffffffff),
              fontFamily: "psb",
              fontSize: 16.0.sp),
          textAlign: TextAlign.center),
      gradient: LinearGradient(
        begin: Alignment(-0.10374055057764053, 0),
        end: Alignment(1.1447703838348389, 1.1694844961166382),
        colors: (order.dropoffDriver == null)
            ? <Color>[Colors.grey, Colors.grey]
            : <Color>[const Color(0xffff9300), const Color(0xdbd15f18)],
      ),
      function: () async {
        if (order.dropoffDriver != null) {
          final bool res = await dialogComponent(
            _i18n()['readyForDeliveryTitle'],
            _i18n()['readyForDeliveryText'],
            () {
              Get.back(result: true);
            },
            () {
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
              colors: <Color>[const Color(0xffff9300), const Color(0xdbd15f18)],
            ),
          );
          if (res) {
            Get.snackbar("Loading", "");
            await controller.readyForDeliveryOrder(order.orderId);
          }
        } else {
          Get.snackbar('${_i18n()["error"]}', '${_i18n()["error"]}');
        }
      },
    );
  }
}
