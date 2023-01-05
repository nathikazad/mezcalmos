import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/controllers/restaurantController.dart';
import 'package:mezcalmos/DeliveryApp/models/DeliveryOrder.dart';
import 'package:mezcalmos/DeliveryApp/models/utilities/DeliveryOrderStatus.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/Restaurant/controllers/DvRestaurantOrderViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/GradientCircularLoading.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['DeliveryApp']
        ['pages']['CurrentOrders']['CurrentOrderViewScreen']['Components']
    ['DriverBottomRestaurantOrderCard'];

class RestaurantControllButtons extends StatefulWidget {
  /// buttons to controll the restaurant driver order status and the final status of the order (Delivered/Canceled)

  const RestaurantControllButtons(
      {Key? key, required this.order, required this.viewController})
      : super(key: key);
  final DeliveryOrder order;
  final DvRestaurantOrderViewController viewController;

  @override
  State<RestaurantControllButtons> createState() =>
      _RestaurantControllButtonsState();
}

class _RestaurantControllButtonsState extends State<RestaurantControllButtons> {
  bool clicked = false;
  RestaurantOrderController restaurantOrderController =
      Get.find<RestaurantOrderController>();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      height: 70,
      // color: (order.inDeliveryPhase())
      //     ? Theme.of(context).primaryColorLight
      //     : Colors.grey,
      child: (clicked) ? _loadingPlaceholder() : _getFooterComponent(),
    );
  }

  Widget _getFooterComponent() {
    switch (widget.order.status) {
      case DeliveryOrderStatus.OrderReceived:
        return _waitingDisabledButton(
            header: "${_i18n()["RestaurantControllButtons"]["notReadyTitle"]}",
            body: "${_i18n()["RestaurantControllButtons"]["notReadyBody"]}");

      case DeliveryOrderStatus.CancelledByDeliverer:
      case DeliveryOrderStatus.CancelledByServiceProvider:
      case DeliveryOrderStatus.CancelledByCustomer:
        return _canceledOrderComponent();
      case DeliveryOrderStatus.Delivered:
        return _orderDeliveredComponent();
      default:
        return MezButton(
          label: _getBtnTitle(),
          borderRadius: 0,
          onClick: () async {
            switch (widget.order.status) {
              case DeliveryOrderStatus.PackageReady:
                await widget.viewController.atPickup();

                break;
              case DeliveryOrderStatus.AtPickup:
                await widget.viewController.startDelivery();
                break;
              case DeliveryOrderStatus.OnTheWayToDropoff:
                await widget.viewController.atDropoff();
                break;
              case DeliveryOrderStatus.AtDropoff:
                await widget.viewController.finishDelivery();
                break;

              default:
            }
          },
        );
    }
  }

  Widget _startDeliveryButton() {
    return !shouldDisableBottomButton()
        ? InkWell(
            onTap: () async {
              setState(() {
                clicked = true;
              });
              await widget.viewController
                  .startDelivery()
                  .then((ServerResponse value) {
                setState(() {
                  clicked = false;
                });
              });
            },
            child: Container(
              decoration: BoxDecoration(gradient: bluePurpleGradient),
              alignment: Alignment.center,
              padding: EdgeInsets.all(8),
              child: Text(
                '${_i18n()["RestaurantControllButtons"]["confirmPickup"]}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          )
        : _waitingDisabledButton(
            header: '${_i18n()["RestaurantControllButtons"]["timeErrorTitle"]}',
            body: '${_i18n()["RestaurantControllButtons"]["timeErrorBody"]}',
            child: Icon(Icons.error),
          );
  }

  bool shouldDisableBottomButton() {
    if (widget.order.estimatedArrivalAtDropoffTime != null &&
        widget.order.estimatedArrivalAtPickupTime != null) {
      return false;
    }

    return true;
  }

  Widget _orderDeliveredComponent() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(225, 228, 255, 1),
            ),
            child: Center(
              child: Icon(
                Icons.check,
                color: Color.fromRGBO(103, 121, 254, 1),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${_i18n()["orderStatus"]["delivered"]}',
                style: Get.textTheme.bodyText1,
              ),
              Text(
                DateFormat('dd MMM yy h:m')
                    .format(widget.order.orderTime.toLocal()),
                style: Get.textTheme.subtitle1,
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _loadingPlaceholder() {
    return Container(
      color: Get.theme.primaryColorLight,
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _waitingDisabledButton({
    String header = 'Waiting for order',
    String body = 'Order is not ready yet for delivery',
    Widget? child,
  }) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 35,
            width: 35,
            child: child ??
                GradientProgressIndicator(
                  radius: 11,
                  duration: 3,
                  strokeWidth: 1,
                  gradientStops: const [
                    0.2,
                    0.8,
                  ],
                  gradientColors: const [
                    Colors.white,
                    Colors.grey,
                  ],
                  child: SizedBox(),
                ),
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                header,
                style: Get.textTheme.bodyText1,
              ),
              Text(
                body,
                style: Get.textTheme.subtitle1,
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _canceledOrderComponent() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.cancel,
            color: Colors.redAccent,
            size: 30.sp,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${_i18n()["orderStatus"]["canceled"]}',
                style: Get.textTheme.bodyText1,
              ),
              Text(
                DateFormat('dd MMM yy h:m')
                    .format(widget.order.orderTime.toLocal()),
                style: Get.textTheme.subtitle1,
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _confirmDeliveryButton() {
    return InkWell(
        onTap: () async {
          setState(() {
            clicked = true;
          });
          // await restaurantOrderController
          //     .finishRestaurantDelivery(widget.order.orderId)
          //     .then((ServerResponse value) => setState(() {
          //           clicked = false;
          //         }));
          // MezRouter.back(closeOverlays: true);
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(gradient: bluePurpleGradient),
          alignment: Alignment.center,
          child: Text(
            '${_i18n()["RestaurantControllButtons"]["confirmDelivery"]}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat',
            ),
          ),
        ));
  }

  String _getBtnTitle() {
    switch (widget.order.status) {
      case DeliveryOrderStatus.PackageReady:
        return "Confirm pickup";
      case DeliveryOrderStatus.AtPickup:
        return "Start Delivery";
      case DeliveryOrderStatus.OnTheWayToDropoff:
        return "At dropoff";
      case DeliveryOrderStatus.AtDropoff:
        return "Finish delivery";

      default:
        return "";
    }
  }
}
