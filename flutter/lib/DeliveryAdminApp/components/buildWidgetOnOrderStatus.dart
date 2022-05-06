import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:rive/rive.dart' as rive;
import 'package:intl/intl.dart';
import 'package:get/get.dart';

final f = new DateFormat('dd/MM/yyyy hh:mm a');

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["components"]["buildWidgetOnOrderStatus"];

Widget buildWigetOnOrderStatus(
    RestaurantOrderStatus status, DateTime orderTime) {
  Widget? myWidget;
  switch (status) {
    case RestaurantOrderStatus.PreparingOrder:
      mezDbgPrint("PreparingOrder");
      myWidget = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 61,
            height: 35,
            child: rive.RiveAnimation.asset(
              "assets/animation/cooking.riv",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            child: Text("${_i18n()["preparing"]}",
                style: const TextStyle(
                    color: const Color(0xff7e7a7a),
                    fontFamily: "psr",
                    fontSize: 18.0),
                textAlign: TextAlign.center),
          )
        ],
      );
      break;
    case RestaurantOrderStatus.ReadyForPickup:
      mezDbgPrint("ReadyForPickup");
      myWidget = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Text("${_i18n()["readyForPickUp"]}",
                style: const TextStyle(
                    color: const Color(0xff7e7a7a),
                    fontFamily: "psr",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0),
                textAlign: TextAlign.center),
          )
        ],
      );
      break;
    case RestaurantOrderStatus.OnTheWay:
      mezDbgPrint("OnTheWay");
      myWidget = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Text("${_i18n()["onTheWay"]}",
                style: const TextStyle(
                    color: const Color(0xff7e7a7a),
                    fontWeight: FontWeight.w400,
                    fontFamily: "ProductSans",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0),
                textAlign: TextAlign.center),
          ),
          Container(
            width: 61,
            height: 35,
            child: rive.RiveAnimation.asset(
              "assets/animation/motorbikeWithSmokeAnimation.riv",
              fit: BoxFit.cover,
            ),
          ),
        ],
      );
      break;
    case RestaurantOrderStatus.Delivered:
      mezDbgPrint("Delivered");
      myWidget = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              child: Icon(
            Icons.check_circle,
            color: Colors.green,
          )),
          SizedBox(
            width: 15,
          ),
          Container(
            child: Text(
                "${_i18n()["delivered"]} ${f.format(orderTime.toLocal()).toString()}",
                style: const TextStyle(
                    color: const Color(0xff7e7a7a),
                    fontFamily: "prs",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0),
                textAlign: TextAlign.center),
          )
        ],
      );
      break;
    case RestaurantOrderStatus.OrderReceieved:
      mezDbgPrint("Order Receieved");
      myWidget = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              child: Icon(
            Icons.check_circle,
            color: Colors.green,
          )),
          SizedBox(
            width: 15,
          ),
          Container(
            child: Text(
                "${_i18n()["received"]} ${f.format(orderTime.toLocal()).toString()}",
                style: const TextStyle(
                    color: const Color(0xff7e7a7a),
                    fontFamily: "prs",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
                textAlign: TextAlign.center),
          )
        ],
      );
      break;
    case RestaurantOrderStatus.CancelledByCustomer:
      mezDbgPrint("Cancelled By Customer");
      myWidget = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: 61,
              height: 35,
              child: Icon(
                Icons.highlight_off,
                color: Colors.red,
              )),
          Container(
            child: Text("${_i18n()["canceledByCustomer"]} ",
                style: const TextStyle(
                    color: const Color(0xff7e7a7a),
                    fontFamily: "psr",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
                textAlign: TextAlign.center),
          )
        ],
      );
      break;
    case RestaurantOrderStatus.CancelledByAdmin:
      mezDbgPrint("Cancelled By Admin");
      myWidget = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: 61,
              height: 35,
              child: Icon(
                Icons.highlight_off,
                color: Colors.red,
              )),
          Container(
            child: Text("${_i18n()["canceledByAdmin"]} ",
                style: const TextStyle(
                    color: const Color(0xff7e7a7a),
                    fontFamily: "psr",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
                textAlign: TextAlign.center),
          )
        ],
      );
      break;
    default:
  }
  return Container(
    child: myWidget!,
  );
}
