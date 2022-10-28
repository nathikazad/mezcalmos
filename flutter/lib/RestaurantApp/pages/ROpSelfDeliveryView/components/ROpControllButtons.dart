import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/RestaurantApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/GradientCircularLoading.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['DeliveryApp']
        ['pages']['CurrentOrders']['CurrentOrderViewScreen']['Components']
    ['DriverBottomRestaurantOrderCard'];

class ROpControllButtons extends StatefulWidget {
  /// buttons to controll the restaurant driver order status and the final status of the order (Delivered/Canceled)

  const ROpControllButtons({Key? key, required this.order}) : super(key: key);
  final RestaurantOrder order;

  @override
  State<ROpControllButtons> createState() => _ROpControllButtonsState();
}

class _ROpControllButtonsState extends State<ROpControllButtons> {
  bool clicked = false;
  ROpOrderController restaurantOrderController = Get.find<ROpOrderController>();

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
      case RestaurantOrderStatus.OrderReceieved:
      case RestaurantOrderStatus.PreparingOrder:
        return _waitingDisabledButton(
            header: "${_i18n()["RestaurantControllButtons"]["notReadyTitle"]}",
            body: "${_i18n()["RestaurantControllButtons"]["notReadyBody"]}");

      case RestaurantOrderStatus.ReadyForPickup:
        return _startDeliveryButton();
      case RestaurantOrderStatus.OnTheWay:
        return _confirmDeliveryButton();
      case RestaurantOrderStatus.CancelledByAdmin:
      case RestaurantOrderStatus.CancelledByCustomer:
        return _canceledOrderComponent();
      case RestaurantOrderStatus.Delivered:
        return _orderDeliveredComponent();
      default:
        return Container();
    }
  }

  Widget _startDeliveryButton() {
    return !shouldDisableBottomButton()
        ? InkWell(
            onTap: () async {
              setState(() {
                clicked = true;
              });
              await restaurantOrderController
                  .startRestaurantDelivery(widget.order.orderId)
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
                "${_i18n()["RestaurantControllButtons"]["startDelivery"]}",
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
    if (widget.order.selfDelivery &&
        widget.order.selfDeliveryDetails?.estDeliveryTime != null) {
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
          await restaurantOrderController.stopLocationListener();
          await Future.delayed(Duration(seconds: 2), () {
            restaurantOrderController
                .finishRestaurantDelivery(widget.order.orderId)
                .then((ServerResponse value) {
              if (value.success) {
                setState(() {
                  clicked = false;
                });
              } else {
                restaurantOrderController.startLocationListener(widget.order);
              }
            });
          });
          // Get.back(closeOverlays: true);
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
}
