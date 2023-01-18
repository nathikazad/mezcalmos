import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/old/customerApp/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/BottomBarComponents.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/RecreateOrderBtn.dart';
import 'package:mezcalmos/Shared/constants/MezIcons.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Taxi"]["components"]["TaxiBottomBars"]["TaxiOrderBottomBar"];

class TaxiOrderBottomBar extends StatefulWidget {
  /// Show a bottom bar that depends on the status
  /// normally shows taxi avatar and name but if order is looking
  /// then shows increment and decrement price buttons
  const TaxiOrderBottomBar({Key? key, required this.order}) : super(key: key);
  final Rxn<TaxiOrder> order;
  @override
  _TaxiOrderBottomBarState createState() => _TaxiOrderBottomBarState();
}

class _TaxiOrderBottomBarState extends State<TaxiOrderBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Positioned(
        bottom: 20,
        right: 15,
        left: 15,
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: EdgeInsets.only(
              bottom: (widget.order.value!.status ==
                          TaxiOrdersStatus.LookingForTaxi ||
                      widget.order.value!.status ==
                          TaxiOrdersStatus.LookingForTaxiScheduled)
                  ? 45
                  : 0),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                offset: Offset(2.47, 2.47),
                blurRadius: 8.23,
                color: Color.fromRGBO(175, 175, 175, 0.25),
              )
            ],
            // border: Border.all(
            //     width: 1, color: Theme.of(context).scaffoldBackgroundColor),
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: buildBottomByStatus(context),
          ),
        ),
      ),
    );
  }

  Widget incrementDecrementPrice() {
    final TaxiController taxiController =
        Get.put<TaxiController>(TaxiController());
    return Flexible(
      flex: 2,
      // fit: FlexFit.tight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Material(
                shape: CircleBorder(),
                child: IconButton(
                  iconSize: 13.sp,
                  splashRadius: 18,
                  tooltip: 'Decrease the price',
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    // final Order? order = Get.find<OrderController>()
                    //     .hasOrderOfType(typeToCheck: OrderType.Taxi);
                    // if (order != null) {
                    //   taxiController.updateRideCost(
                    //     orderId: order.orderId,
                    //     cost:
                    //         widget.order.value!.toTaxiRequest().estimatedPrice -
                    //             5,
                    //   );
                    // }
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
                color: Colors.black,
                fontFamily: 'psb',
                fontSize: 13.sp,
              ),
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
                    // final Order? order = Get.find<OrderController>()
                    //     .hasOrderOfType(typeToCheck: OrderType.Taxi);
                    // if (order != null) {
                    //   taxiController.updateRideCost(
                    //     orderId: order.orderId,
                    //     cost:
                    //         widget.order.value!.toTaxiRequest().estimatedPrice +
                    //             5,
                    //   );
                    // }
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
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Icon(
                  MezcalmosIcons.route,
                  size: 11.sp,
                ),
                SizedBox(width: 2.w),
                Text(
                  taxiRequest.routeInformation?.distance.distanceStringInKm ??
                      "-",
                  style: TextStyle(
                    fontSize: 11.sp,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Icon(
                MezcalmosIcons.stopwatch,
                size: 11.sp,
              ),
              SizedBox(width: 2.w),
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
          Obx(
            () => Center(
              child: Text(
                widget.order.value!.numberOfTaxiReadNotification().toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Icon(Icons.taxi_alert_rounded, size: 26),
        ],
      ),
    );
  }

  List<Widget> buildBottomByStatus(BuildContext pContext) {
    final List<Widget> _widgies = [];
    switch (widget.order.value!.status) {
      case TaxiOrdersStatus.Scheduled:
        _widgies.assignAll(
          <Widget>[
            avatarWithTitleAndDesc(
              // description: _i18n()?['rideFinished'],
              description:
                  "${widget.order.value!.driver!.name} has accepted your order.",
              pContext: pContext,
              order: widget.order.value!,
              title: 'Scheduled',
              asset: widget.order.value?.driver?.image,
            ),
            SizedBox(height: 35, child: VerticalDivider()),
            messageBtn(order: widget.order),
            SizedBox(height: 35, child: VerticalDivider()),
            cancelBtn(widget.order.value!, context)
          ],
        );
        break;
      case TaxiOrdersStatus.LookingForTaxiScheduled:
      case TaxiOrdersStatus.LookingForTaxi:
        _widgies.assignAll(
          <Widget>[
            incrementDecrementPrice(),
            VerticalDivider(),
            getHowManyDriverReadTheOrder(),
            // if (orderController
            //     .hasNewAdminMessageNotification(widget.order.value!.orderId))
            //   VerticalDivider(),
            // if (orderController
            //     .hasNewAdminMessageNotification(widget.order.value!.orderId))
            //   messageBtn(order: widget.order)
          ],
        );
        break;

      case TaxiOrdersStatus.DroppedOff:
        _widgies.assignAll(<Widget>[
          avatarWithTitleAndDesc(
            // description: _i18n()?['rideFinished'],
            description: "Reached your destination.",
            pContext: pContext,
            order: widget.order.value!,
            title: 'Dropped off',
            asset: widget.order.value?.driver?.image,
          ),
          SizedBox(height: 35, child: VerticalDivider()),
          messageBtn(order: widget.order)
        ]);
        break;
      case TaxiOrdersStatus.OnTheWay:
        final String _driverName =
            widget.order.value?.driver?.name ?? "Unknown driver";
        _widgies.assignAll(<Widget>[
          avatarWithTitleAndDesc(
            // description: _i18n()?['rideFinished'],
            description: "$_driverName is on the way to pick you up.",
            pContext: pContext,
            order: widget.order.value!,
            title: '$_driverName ${widget.order.value?.driver?.taxiNumber}',
            asset: widget.order.value?.driver?.image,
          ),
          SizedBox(height: 35, child: VerticalDivider()),
          messageBtn(order: widget.order),
          SizedBox(height: 35, child: VerticalDivider()),
          cancelBtn(widget.order.value!, context)
        ]);

        break;
      case TaxiOrdersStatus.InTransit:
        _widgies.assignAll(<Widget>[
          avatarWithTitleAndDesc(
            // description: _i18n()?['rideFinished'],
            description: "On the way to your destination.",
            pContext: pContext,
            order: widget.order.value!,
            title: 'In transit',
            imgUrl: widget.order.value?.driver?.image,
          ),
          SizedBox(height: 35, child: VerticalDivider()),
          messageBtn(order: widget.order),
          SizedBox(height: 35, child: VerticalDivider()),
          cancelBtn(widget.order.value!, context)
        ]);

        break;
      case TaxiOrdersStatus.CancelledByTaxi:
        _widgies.assignAll(
          <Widget>[
            avatarWithTitleAndDesc(
              pContext: pContext,
              asset: taxi_driver_marker_asset,
              isCanelIcon: true,
              title: 'Cancelled by taxi',
              // "${Get.find<AuthController>().fireAuthUser!.displayName}'s ${_i18n()?['ride']}.",
              // description: _i18n()?['rideCancelledByTaxi'],
              description: "The driver has camcelled the ride.",
              order: widget.order.value!,
            ),
            RecreateOrderButton(
                taxiRequest: widget.order.value!.toTaxiRequest())
          ],
        );

        break;
      case TaxiOrdersStatus.Expired:
        _widgies.assignAll(
          <Widget>[
            avatarWithTitleAndDesc(
              pContext: pContext,
              isCanelIcon: true,
              avatarGradient: null,
              title: 'Expired',
              description: _i18n()?['rideExpired'],
              order: widget.order.value!,
            ),
            RecreateOrderButton(
              taxiRequest: widget.order.value!.toTaxiRequest(),
            )
          ],
        );
        // widget.bottomPadding = 10.0;
        break;

      case TaxiOrdersStatus.CancelledByCustomer:
        _widgies.assignAll(
          <Widget>[
            avatarWithTitleAndDesc(
              order: widget.order.value!,
              pContext: pContext,
              asset: taxi_driver_marker_asset,
              isCanelIcon: true,
              title: 'Canceled',
              // "${Get.find<AuthController>().fireAuthUser!.displayName}'s ${_i18n()?['ride']}.",
              description: _i18n()?['rideCancelledByCustomer'],
            ),
            RecreateOrderButton(
              taxiRequest: widget.order.value!.toTaxiRequest(),
            ),
          ],
        );
        // widget.bottomPadding = 10.0;
        break;
      case TaxiOrdersStatus.ForwardingToLocalCompany:
        _widgies.assignAll(
          <Widget>[
            avatarWithTitleAndDesc(
                isCanelIcon: true,
                order: widget.order.value!,
                pContext: pContext,
                avatarGradient: [
                  Color.fromRGBO(172, 89, 252, 1),
                  Color.fromRGBO(103, 121, 254, 1),
                ],
                avatarChild: Icon(
                  Icons.local_taxi_rounded,
                  color: Colors.white,
                ),
                title: 'Forwarding',
                // "${Get.find<AuthController>().fireAuthUser!.displayName}'s ${_i18n()?['ride']}.",
                description: "Calling local company for a driver."
                //  _i18n()?['forwarding'],
                ),
            SizedBox(height: 35, child: VerticalDivider()),
            messageBtn(order: widget.order),
            SizedBox(height: 35, child: VerticalDivider()),
            cancelBtn(widget.order.value!, context)
          ],
        );
        // widget.bottomPadding = 10.0;
        break;
      case TaxiOrdersStatus.ForwardingSuccessful:
        _widgies.assignAll(
          <Widget>[
            avatarWithTitleAndDesc(
              order: widget.order.value!,
              pContext: pContext,
              isCanelIcon: true,
              avatarGradient: [
                Color.fromRGBO(172, 89, 252, 1),
                Color.fromRGBO(103, 121, 254, 1),
              ],
              avatarChild: Icon(
                Icons.local_taxi_rounded,
                color: Colors.white,
              ),
              title: 'Forwarded',
              // "${Get.find<AuthController>().fireAuthUser!.displayName}'s ${_i18n()?['ride']}.",
              description: "Taxi 21-123 has been sent to you.",
              //  "${_i18n()?['forwardSuccess']}",
            ),
            SizedBox(height: 35, child: VerticalDivider()),
            messageBtn(order: widget.order),
          ],
        );
        // widget.bottomPadding = 10.0;
        break;
      case TaxiOrdersStatus.ForwardingUnsuccessful:
        _widgies.assignAll(
          <Widget>[
            avatarWithTitleAndDesc(
              order: widget.order.value!,
              pContext: pContext,
              asset: taxi_driver_marker_asset,
              isCanelIcon: true,
              title: 'Forwarding unsuccessful',
              // "${Get.find<AuthController>().fireAuthUser!.displayName}'s ${_i18n()?['ride']}.",
              description:
                  'Local company couldn’t find a driver.', //_i18n()?['rideCancelledByCustomer'],
            ),
            RecreateOrderButton(
              taxiRequest: widget.order.value!.toTaxiRequest(),
            )
          ],
        );
        // widget.bottomPadding = 10.0;
        break;
    }
    return _widgies;
  }
}
