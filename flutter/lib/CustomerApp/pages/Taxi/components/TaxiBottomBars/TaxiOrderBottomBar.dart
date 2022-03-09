import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/RecreateOrderBtn.dart';
import 'package:mezcalmos/Shared/constants/MezIcons.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:sizer/sizer.dart';

import '../BottomBarComponents.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]
["Taxi"]["components"]["TaxiBottomBars"]["TaxiOrderBottomBar"];

class TaxiOrderBottomBar extends StatefulWidget {
  Rxn<TaxiOrder> order;
  /// Show a bottom bar that depends on the status
  /// normally shows taxi avatar and name but if order is looking
  /// then shows increment and decrement price buttons
  TaxiOrderBottomBar({Key? key, required this.order}) : super(key: key);

  @override
  _TaxiOrderBottomBarState createState() => _TaxiOrderBottomBarState();
}

class _TaxiOrderBottomBarState extends State<TaxiOrderBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 25,
      right: 15,
      left: 15,
      child: Obx(
        () => Container(
          padding: const EdgeInsets.all(8),
          margin: EdgeInsets.only(
              bottom: (widget.order.value!.status ==
                      TaxiOrdersStatus.LookingForTaxi)
                  ? 45
                  : 0),
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  width: 1, color: Theme.of(context).scaffoldBackgroundColor),
              color: Colors.white),
          child: Row(
            children: buildBottomBarByStatus(context),
          ),
        ),
      ),
    );
  }

  Widget incrementDecrementPrice() {
    TaxiController taxiController = Get.put<TaxiController>(TaxiController());
    return Flexible(
      flex: 2,
      // fit: FlexFit.tight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Material(
                shape: CircleBorder(),
                child: IconButton(
                  iconSize: 13.sp,
                  splashRadius: 18,
                  tooltip: 'Decrease the price',
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Order? order = Get.find<OrderController>()
                        .hasOrderOfType(typeToCheck: OrderType.Taxi);
                    if (order != null) {
                      taxiController.updateRideCost(
                          orderId: order.orderId,
                          cost: widget.order.value!
                                  .toTaxiRequest()
                                  .estimatedPrice -
                              5);
                    }
                  },
                  icon: Icon(
                    Icons.remove_circle_outline,
                    //size: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Text(
              '\$' +
                  widget.order.value!.toTaxiRequest().estimatedPrice.toString(),
              style: TextStyle(
                  color: Colors.black, fontFamily: 'psb', fontSize: 13.sp),
            ),
            Flexible(
              child: Material(
                shape: CircleBorder(),
                child: IconButton(
                  iconSize: 13.sp,
                  splashRadius: 18,
                  tooltip: 'Increase the price',
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Order? order = Get.find<OrderController>()
                        .hasOrderOfType(typeToCheck: OrderType.Taxi);
                    if (order != null) {
                      taxiController.updateRideCost(
                          orderId: order.orderId,
                          cost: widget.order.value!
                                  .toTaxiRequest()
                                  .estimatedPrice +
                              5);
                    }
                  },
                  icon: Icon(
                    Icons.add_circle_outline,
                    //size: 18,
                    color: Colors.black,
                  ),
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
    return Flexible(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(
                  MezcalmosIcons.route,
                  size: 11.sp,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  taxiRequest.routeInformation?.distance.distanceStringInKm ??
                      "-",
                  style: TextStyle(fontSize: 11.sp),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(
                MezcalmosIcons.stopwatch,
                size: 11.sp,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                taxiRequest.routeInformation?.duration.longTextVersion ?? "-",
                style: TextStyle(fontSize: 11.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getHowManyDriverReadTheOrder() {
    return Flexible(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.mark_email_read, size: 14.sp),
          SizedBox(
            width: 10,
          ),
          Obx(
            () => Text(
              widget.order.value!.numberOfTaxiReadNotification().toString(),
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> buildBottomBarByStatus(BuildContext pContext) {
    List<Widget> _widgies = [];
    switch (widget.order.value!.status) {
      case TaxiOrdersStatus.LookingForTaxi:
        _widgies.assignAll([
          incrementDecrementPrice(),
          VerticalDivider(),
          getHowManyDriverReadTheOrder(),
          VerticalDivider(),
          rightRouteInfos(widget.order.value!.toTaxiRequest())
        ]);

        break;

      case TaxiOrdersStatus.DroppedOff:
        _widgies.assignAll([
          taxiAvatarAndName(
              description: _i18n()?['rideFinished'],
              pContext: pContext,
              order: widget.order.value!),
          VerticalDivider(),
          rideCost(
              widget.order.value!.toTaxiRequest().estimatedPrice.toString()),
          VerticalDivider(),
          messageBtn(
              order: widget.order.value!,
              margin: EdgeInsets.symmetric(horizontal: 6))
        ]);
        // widget.bottomPadding = 10.0;

        break;

      case TaxiOrdersStatus.Expired:
        _widgies.assignAll([
          taxiAvatarAndName(
              pContext: pContext,
              asset: taxi_driver_marker_asset,
              name:
                  "${Get.find<AuthController>().fireAuthUser!.displayName}'s ${_i18n()?['ride']}.",
              description: _i18n()?['rideExpired'],
              order: widget.order.value!),
          RecreateOrderButton(taxiRequest: widget.order.value!.toTaxiRequest())
        ]);
        // widget.bottomPadding = 10.0;
        break;

      case TaxiOrdersStatus.CancelledByTaxi:
        _widgies.assignAll([
          taxiAvatarAndName(
              order: widget.order.value!,
              pContext: pContext,
              description: _i18n()?['rideCancelledByTaxi']),
          messageBtn(
              order: widget.order.value!,
              margin: EdgeInsets.symmetric(horizontal: 6)),
          RecreateOrderButton(taxiRequest: widget.order.value!.toTaxiRequest()),
        ]);
        // widget.bottomPadding = 10.0;
        break;

      case TaxiOrdersStatus.CancelledByCustomer:
        _widgies.assignAll([
          taxiAvatarAndName(
              order: widget.order.value!,
              pContext: pContext,
              asset: taxi_driver_marker_asset,
              name:
                  "${Get.find<AuthController>().fireAuthUser!.displayName}'s ${_i18n()?['ride']}.",
              description: _i18n()?['rideCancelledByCustomer']),
          RecreateOrderButton(taxiRequest: widget.order.value!.toTaxiRequest())
        ]);
        // widget.bottomPadding = 10.0;
        break;

      default:
        _widgies.assignAll([
          taxiAvatarAndName(
            order: widget.order.value!,
            pContext: pContext,
          ),
          verticalSeparator(),
          rideCost(
              widget.order.value!.toTaxiRequest().estimatedPrice.toString()),
          verticalSeparator(),
          buildMsgAndCancelBtn(widget.order.value!)
        ]);
      // widget.bottomPadding = 10.0;
    }
    return _widgies;
  }
}
