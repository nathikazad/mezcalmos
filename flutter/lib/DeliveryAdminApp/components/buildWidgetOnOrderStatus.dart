import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:rive/rive.dart' as rive;
import 'package:intl/intl.dart';

final f = new DateFormat('dd/MM/yyyy hh:mm a');

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
            child: Text("Preparing the order",
                style: const TextStyle(
                    color: const Color(0xff7e7a7a),
                    fontWeight: FontWeight.w400,
                    fontFamily: "ProductSans",
                    fontStyle: FontStyle.normal,
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
              width: 61,
              height: 35,
              child: Icon(
                Icons.check,
                color: Colors.green,
              )),
          Container(
            child: Text("Ready For Pickup",
                style: const TextStyle(
                    color: const Color(0xff7e7a7a),
                    fontWeight: FontWeight.w400,
                    fontFamily: "ProductSans",
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
            child: Text("On The Way",
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
            child: Text("Delivered ${f.format(orderTime).toString()}",
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
            child: Text("Receieved ${f.format(orderTime).toString()}",
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
    case RestaurantOrderStatus.Cancelled:
      mezDbgPrint("Cancelled");
      myWidget = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: 61,
              height: 35,
              child: Icon(
                Icons.close_rounded,
                color: Colors.red,
              )),
          Container(
            child: Text("Cancelled",
                style: const TextStyle(
                    color: const Color(0xff7e7a7a),
                    fontWeight: FontWeight.w400,
                    fontFamily: "ProductSans",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0),
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
