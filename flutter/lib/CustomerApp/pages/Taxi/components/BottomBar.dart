import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/RecreateOrderBtn.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/BottomBarComponents.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';

// @SAAD - TODO : REFACTORE THIS.
class BottomBar extends StatefulWidget {
  TaxiRequest taxiRequest;
  double? bottomPadding;
  BottomBar({required this.taxiRequest, this.bottomPadding});
  @override
  State<BottomBar> createState() {
    return _BottomBarState();
  }
}

class _BottomBarState extends State<BottomBar> {
  LanguageController lang = Get.find<LanguageController>();

  @override
  void initState() {
    if (widget.bottomPadding == null) {
      widget.bottomPadding = 45;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Positioned(
      bottom: 25,
      left: 15,
      right: 15,
      child: Container(
          margin: EdgeInsets.only(
              bottom: getTheRightMargin(widget.taxiRequest.status) ? 45 : 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(81, 132, 255, 1),
              Color.fromRGBO(206, 73, 252, 1)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Container(
              height: getSizeRelativeToScreen(25, Get.height, Get.width),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: buildBottomBatByStatus(widget.taxiRequest, context),
              ))),
    );
  }

  bool getTheRightMargin(TaxiOrdersStatus? taxiOrdersStatus) {
    switch (taxiOrdersStatus) {
      case TaxiOrdersStatus.CancelledByTaxi:
      case TaxiOrdersStatus.Expired:
      case TaxiOrdersStatus.CancelledByCustomer:
        return false;
      default:
        return true;
    }
  }

  Widget incrementDecrementPrice() {
    TaxiController taxiController = Get.put<TaxiController>(TaxiController());
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                if (widget.taxiRequest.status == null) {
                  widget.taxiRequest.decrementPrice();
                  setState(() {});
                } else {
                  Order? order = Get.find<OrderController>()
                      .hasOrderOfType(typeToCheck: OrderType.Taxi);
                  if (order != null) {
                    taxiController.updateRideCost(
                        orderId: order.orderId,
                        cost: widget.taxiRequest.estimatedPrice - 5);
                  }
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1)),
                child: Icon(
                  Icons.remove,
                  size: 18,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              widget.taxiRequest.estimatedPrice.toString(),
              style: TextStyle(
                  color: Colors.black, fontFamily: 'psb', fontSize: 20),
            ),
            InkWell(
              onTap: () {
                if (widget.taxiRequest.status == null) {
                  widget.taxiRequest.incrementPrice();
                  setState(() {});
                } else {
                  Order? order = Get.find<OrderController>()
                      .hasOrderOfType(typeToCheck: OrderType.Taxi);
                  if (order != null) {
                    taxiController.updateRideCost(
                        orderId: order.orderId,
                        cost: widget.taxiRequest.estimatedPrice + 5);
                  }
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1)),
                child: Icon(
                  Icons.add,
                  size: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildBottomBatByStatus(
      TaxiRequest? taxiRequest, BuildContext pContext) {
    List<Widget> _widgies = [];
    switch (taxiRequest?.status) {
      case null:
        _widgies.assignAll([
          incrementDecrementPrice(),
          Expanded(flex: 1, child: verticalSeparator()),
          rightRouteInfos(taxiRequest!)
        ]);

        break;
      case TaxiOrdersStatus.LookingForTaxi:
        _widgies.assignAll([
          incrementDecrementPrice(),
          Expanded(flex: 1, child: verticalSeparator()),
          rightRouteInfos(taxiRequest!)
        ]);

        break;

      case TaxiOrdersStatus.DroppedOff:
        _widgies.assignAll([
          taxiAvatarAndName(
              description: lang.strings?['customer']?['taxiView']
                  ?['rideFinished'],
              pContext: pContext,
              taxiRequest: taxiRequest!),
          verticalSeparator(),
          rideCost(widget.taxiRequest.estimatedPrice.toString()),
          verticalSeparator(),
          messageBtn(
              taxiRequest: widget.taxiRequest,
              margin: EdgeInsets.symmetric(horizontal: 6))
        ]);
        // widget.bottomPadding = 10.0;

        break;

      case TaxiOrdersStatus.Expired:
        _widgies.assignAll([
          taxiAvatarAndName(
              pContext: pContext,
              taxiRequest: taxiRequest!,
              asset: taxi_driver_marker_asset,
              name:
                  "${Get.find<AuthController>().fireAuthUser!.displayName}'s ${lang.strings?['customer']?['taxiView']?['ride']}.",
              description: lang.strings?['customer']?['taxiView']
                  ?['rideExpired']),
          reCreateOrderBtn(widget.taxiRequest)
        ]);
        // widget.bottomPadding = 10.0;
        break;

      case TaxiOrdersStatus.CancelledByTaxi:
        _widgies.assignAll([
          taxiAvatarAndName(
              taxiRequest: taxiRequest!,
              pContext: pContext,
              description: lang.strings?['customer']?['taxiView']
                  ?['rideCancelledByTaxi']),
          messageBtn(
              taxiRequest: widget.taxiRequest,
              margin: EdgeInsets.symmetric(horizontal: 6)),
          reCreateOrderBtn(widget.taxiRequest),
        ]);
        // widget.bottomPadding = 10.0;
        break;

      case TaxiOrdersStatus.CancelledByCustomer:
        _widgies.assignAll([
          taxiAvatarAndName(
              taxiRequest: taxiRequest!,
              pContext: pContext,
              asset: taxi_driver_marker_asset,
              name:
                  "${Get.find<AuthController>().fireAuthUser!.displayName}'s ${lang.strings?['customer']?['taxiView']?['ride']}.",
              description: lang.strings?['customer']?['taxiView']
                  ?['rideCancelledByCustomer']),
          reCreateOrderBtn(widget.taxiRequest)
        ]);
        // widget.bottomPadding = 10.0;
        break;

      default:
        _widgies.assignAll([
          taxiAvatarAndName(
            taxiRequest: taxiRequest,
            pContext: pContext,
          ),
          verticalSeparator(),
          rideCost(widget.taxiRequest.estimatedPrice.toString()),
          verticalSeparator(),
          buildMsgAndCancelBtn(taxiRequest!)
        ]);
      // widget.bottomPadding = 10.0;
    }
    return _widgies;
  }
}
