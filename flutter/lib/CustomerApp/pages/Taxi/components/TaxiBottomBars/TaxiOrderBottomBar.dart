import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/BottomBarComponents.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/RecreateOrderBtn.dart';
import 'package:mezcalmos/Shared/constants/MezIcons.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:sizer/sizer.dart';

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
        bottom: 25,
        right: 15,
        left: 15,
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: EdgeInsets.only(
              bottom: (widget.order.value!.status ==
                      TaxiOrdersStatus.LookingForTaxi)
                  ? 45
                  : 0),
          height: 70,
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
                    final Order? order = Get.find<OrderController>()
                        .hasOrderOfType(typeToCheck: OrderType.Taxi);
                    if (order != null) {
                      taxiController.updateRideCost(
                        orderId: order.orderId,
                        cost:
                            widget.order.value!.toTaxiRequest().estimatedPrice -
                                5,
                      );
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
                    final Order? order = Get.find<OrderController>()
                        .hasOrderOfType(typeToCheck: OrderType.Taxi);
                    if (order != null) {
                      taxiController.updateRideCost(
                        orderId: order.orderId,
                        cost:
                            widget.order.value!.toTaxiRequest().estimatedPrice +
                                5,
                      );
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
      case TaxiOrdersStatus.LookingForTaxi:
        _widgies.assignAll(
          <Widget>[
            incrementDecrementPrice(),
            VerticalDivider(),
            getHowManyDriverReadTheOrder(),
            if (orderController
                .hasNewAdminMessageNotification(widget.order.value!.orderId))
              VerticalDivider(),
            if (orderController
                .hasNewAdminMessageNotification(widget.order.value!.orderId))
              messageBtn(order: widget.order)
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
        final String _driverName = widget.order.value?.driver?.name ?? 'Saad';
        _widgies.assignAll(<Widget>[
          avatarWithTitleAndDesc(
            // description: _i18n()?['rideFinished'],
            description: "$_driverName is on the way to pick you up.",
            pContext: pContext,
            order: widget.order.value!,
            title:
                '$_driverName ${widget.order.value?.driver?.taxiNumber ?? "12-123"}',
            asset: widget.order.value?.driver?.image,
          ),
          SizedBox(height: 35, child: VerticalDivider()),
          messageBtn(order: widget.order),
          SizedBox(height: 35, child: VerticalDivider()),
          cancelBtn(widget.order.value!)
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
          cancelBtn(widget.order.value!)
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

        // widget.bottomPadding = 10.0;
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
            InkWell(
              onTap: () async =>
                  showConfirmationDialog(context, onYesClick: () {}),
              child: Icon(Icons.abc_outlined),
            )
            // RecreateOrderButton(
            //     taxiRequest: widget.order.value!.toTaxiRequest())
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
            )
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
            cancelBtn(widget.order.value!)
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
            // Icon(
            //   Icons.check_circle,
            //   color: Colors.green,
            //   size: 30.sp,
            // ),
            // const SizedBox(width: 10),
            // Flexible(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       Text(
            //         " ${_i18n()["taxiNumber"]} : ${widget.order.value!.driver!.taxiNumber}",
            //         style: Theme.of(context).textTheme.bodyText1,
            //       ),
            //       Text(_i18n()["forwardSuccess"],
            //           style: Theme.of(pContext).textTheme.subtitle1)
            //     ],
            //   ),
            // ),
          ],
        );
        // widget.bottomPadding = 10.0;
        break;
      case TaxiOrdersStatus.ForwardingUnsuccessful:
        _widgies.assignAll(
          <Widget>[
            Icon(
              Icons.cancel,
              color: Colors.red,
              size: 30.sp,
            ),
            const SizedBox(width: 5),
            Flexible(
                flex: 5,
                fit: FlexFit.tight,
                child: Text(_i18n()['forwardUnsuccess'],
                    style: Theme.of(pContext).textTheme.bodyText1)),
            // taxiAvatarAndName(
            //     order: widget.order.value!,
            //     pContext: pContext,
            //     description: lang.strings?['customer']?['taxiView']
            //         ?['rideCancelledByCompany']),
            const Spacer(),
            RecreateOrderButton(
                taxiRequest: widget.order.value!.toTaxiRequest()),
          ],
        );
        // widget.bottomPadding = 10.0;
        break;

      default:
        _widgies.assignAll([
          avatarWithTitleAndDesc(
            order: widget.order.value!,
            pContext: pContext,
          ),
          verticalSeparator(),
          rideCost(
              widget.order.value!.toTaxiRequest().estimatedPrice.toString()),
          verticalSeparator(),
          buildMsgAndCancelBtn(widget.order)
        ]);
      // widget.bottomPadding = 10.0;
    }
    return _widgies;
  }
}

void showConfirmationDialog(
  BuildContext context, {
  required void Function() onYesClick,
  void Function()? onNoClick,
}) async {
  return await showDialog(
      context: context,
      builder: (ctx) {
        return Center(
          child: Container(
            height: 35.h,
            width: 80.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 66,
                    width: 66,
                    child: Icon(
                      Icons.close,
                      color: Color.fromRGBO(252, 89, 99, 1),
                      size: 33,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(252, 89, 99, 0.12),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Flexible(
                  flex: 1,
                  child: Text(
                    "Cancel Order",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(height: 11),
                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      Text(
                        'Are you sure you’d like to cancel ?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'This action cannot be undone.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18),
                Flexible(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 44,
                      width: 65.w,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(252, 89, 99, 1),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: onYesClick,
                          child: Text(
                            'Yes, cancel order',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
                              fontSize: 16.34,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      onNoClick?.call();
                      Get.back<void>(closeOverlays: true);
                    },
                    child: Text(
                      'No',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(120, 120, 120, 1),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        fontSize: 16.99,
                      ),
                    ),
                  ),
                ),
                Spacer()
              ],
            ),
          ),
        );
      });
}

void showStatusInfoDialog(
  BuildContext context, {
  void Function()? onViewOrderClick,
}) async {
  return await showDialog(
      context: context,
      builder: (ctx) {
        return Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: onViewOrderClick == null ? 30.h : 35.h,
            width: 85.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 3,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 66,
                        width: 66,
                        child: Icon(
                          Icons.local_taxi,
                          color: Colors.white,
                          size: 33,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(103, 121, 254, 1),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Positioned(
                        bottom: -5,
                        right: -10,
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Center(
                            child: Icon(
                              Icons.close,
                              color: Color.fromRGBO(252, 89, 99, 1),
                              size: 18,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 235, 236, 1),
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 18),
                Flexible(
                  flex: 1,
                  child: Text(
                    "Cancelled",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(height: 11),
                Flexible(
                  flex: 2,
                  child: Text(
                    'Unfortunatly the driver has cancelled the order.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Flexible(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(225, 228, 255, 1),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () => Get.back<void>(closeOverlays: true),
                          child: Text(
                            'Ok',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(103, 121, 254, 1),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
                              fontSize: 16.34,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (onViewOrderClick != null)
                  Flexible(
                    flex: 2,
                    child: Column(
                      children: [
                        SizedBox(height: 12),
                        GestureDetector(
                          onTap: onViewOrderClick,
                          child: Text(
                            'View Order',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(120, 120, 120, 1),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
                              fontSize: 16.99,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      });
}
