import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/RecreateOrderBtn.dart';
import 'package:mezcalmos/Shared/constants/MezIcons.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';

import '../BottomBarComponents.dart';

class TaxiOrderBottomBar extends StatefulWidget {
  final TaxiOrder order;
  const TaxiOrderBottomBar({Key? key, required this.order}) : super(key: key);

  @override
  _TaxiOrderBottomBarState createState() => _TaxiOrderBottomBarState();
}

class _TaxiOrderBottomBarState extends State<TaxiOrderBottomBar> {
  LanguageController lang = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    mezDbgPrint(widget.order.status.toFirebaseFormatString());
    return Positioned(
      bottom: 25,
      right: 25,
      left: 25,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.only(
            bottom: (widget.order.status == TaxiOrdersStatus.LookingForTaxi)
                ? 45
                : 0),
        height: getSizeRelativeToScreen(30, Get.height, Get.width),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                width: 1, color: Theme.of(context).scaffoldBackgroundColor),
            color: Colors.white),
        child: Row(
          children: buildBottomBatByStatus(context),
        ),
      ),
    );
  }

  Widget incrementDecrementPrice() {
    TaxiController taxiController = Get.put<TaxiController>(TaxiController());
    return Flexible(
      flex: 2,
      fit: FlexFit.tight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Material(
              shape: CircleBorder(),
              child: IconButton(
                iconSize: 18,
                splashRadius: 18,
                tooltip: 'Decrease the price',
                padding: EdgeInsets.zero,
                onPressed: () {
                  Order? order = Get.find<OrderController>()
                      .hasOrderOfType(typeToCheck: OrderType.Taxi);
                  if (order != null) {
                    taxiController.updateRideCost(
                        orderId: order.orderId,
                        cost: widget.order.toTaxiRequest().estimatedPrice - 5);
                  }
                },
                icon: Icon(
                  Icons.remove_circle_outline,
                  //size: 18,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              '\$' + widget.order.toTaxiRequest().estimatedPrice.toString(),
              style: TextStyle(
                  color: Colors.black, fontFamily: 'psb', fontSize: 20),
            ),
            Material(
              shape: CircleBorder(),
              child: IconButton(
                iconSize: 18,
                splashRadius: 18,
                tooltip: 'Increase the price',
                padding: EdgeInsets.zero,
                onPressed: () {
                  Order? order = Get.find<OrderController>()
                      .hasOrderOfType(typeToCheck: OrderType.Taxi);
                  if (order != null) {
                    taxiController.updateRideCost(
                        orderId: order.orderId,
                        cost: widget.order.toTaxiRequest().estimatedPrice + 5);
                  }
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  //size: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rightRouteInfos(TaxiRequest taxiRequest) {
    // setState(() {});
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                MezcalmosIcons.route,
                size: (Get.height * 0.015).sp,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(taxiRequest.routeInformation?.distance.distanceStringInKm ??
                  "-"),
            ],
          ),
          Row(
            children: [
              Icon(
                MezcalmosIcons.stopwatch,
                size: (Get.height * 0.015).sp,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(taxiRequest.routeInformation?.duration.longTextVersion ??
                  "-"),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> buildBottomBatByStatus(BuildContext pContext) {
    List<Widget> _widgies = [];
    switch (widget.order.status) {
      case TaxiOrdersStatus.LookingForTaxi:
        _widgies.assignAll([
          incrementDecrementPrice(),
          Expanded(flex: 1, child: VerticalDivider()),
          rightRouteInfos(widget.order.toTaxiRequest())
        ]);

        break;

      case TaxiOrdersStatus.DroppedOff:
        _widgies.assignAll([
          taxiAvatarAndName(
              description: lang.strings?['customer']?['taxiView']
                  ?['rideFinished'],
              pContext: pContext,
              order: widget.order),
          VerticalDivider(),
          rideCost(widget.order.toTaxiRequest().estimatedPrice.toString()),
          VerticalDivider(),
          messageBtn(
              order: widget.order, margin: EdgeInsets.symmetric(horizontal: 6))
        ]);
        // widget.bottomPadding = 10.0;

        break;

      case TaxiOrdersStatus.Expired:
        _widgies.assignAll([
          taxiAvatarAndName(
              pContext: pContext,
              asset: taxi_driver_marker_asset,
              name:
                  "${Get.find<AuthController>().fireAuthUser!.displayName}'s ${lang.strings?['customer']?['taxiView']?['ride']}.",
              description: lang.strings?['customer']?['taxiView']
                  ?['rideExpired'],
              order: widget.order),
          reCreateOrderBtn(widget.order.toTaxiRequest())
        ]);
        // widget.bottomPadding = 10.0;
        break;

      case TaxiOrdersStatus.CancelledByTaxi:
        _widgies.assignAll([
          taxiAvatarAndName(
              order: widget.order,
              pContext: pContext,
              description: lang.strings?['customer']?['taxiView']
                  ?['rideCancelledByTaxi']),
          messageBtn(
              order: widget.order, margin: EdgeInsets.symmetric(horizontal: 6)),
          reCreateOrderBtn(widget.order.toTaxiRequest()),
        ]);
        // widget.bottomPadding = 10.0;
        break;

      case TaxiOrdersStatus.CancelledByCustomer:
        _widgies.assignAll([
          taxiAvatarAndName(
              order: widget.order,
              pContext: pContext,
              asset: taxi_driver_marker_asset,
              name:
                  "${Get.find<AuthController>().fireAuthUser!.displayName}'s ${lang.strings?['customer']?['taxiView']?['ride']}.",
              description: lang.strings?['customer']?['taxiView']
                  ?['rideCancelledByCustomer']),
          reCreateOrderBtn(widget.order.toTaxiRequest())
        ]);
        // widget.bottomPadding = 10.0;
        break;

      default:
        _widgies.assignAll([
          taxiAvatarAndName(
            order: widget.order,
            pContext: pContext,
          ),
          verticalSeparator(),
          rideCost(widget.order.toTaxiRequest().estimatedPrice.toString()),
          verticalSeparator(),
          buildMsgAndCancelBtn(widget.order)
        ]);
      // widget.bottomPadding = 10.0;
    }
    return _widgies;
  }
}
