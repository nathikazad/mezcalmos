import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/controllers/restaurantController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['DeliveryApp']
        ['pages']['CurrentOrders']['CurrentOrderViewScreen']['Components']
    ['DriverBottomRestaurantOrderCard'];

class RestaurantControllButtons extends StatefulWidget {
  /// buttons to controll the restaurant driver order status and the final status of the order (Delivered/Canceled)

  const RestaurantControllButtons({Key? key, required this.order})
      : super(key: key);
  final RestaurantOrder order;

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
      height: 60,
      // color: (order.inDeliveryPhase())
      //     ? Theme.of(context).primaryColorLight
      //     : Colors.grey,
      child: Obx(() {
        if (clicked) {
          return _loadingPlaceholder();
        } else {
          return _getFooterComponent();
        }
      }),
    );
  }

  Widget _getFooterComponent() {
    switch (widget.order.status) {
      case RestaurantOrderStatus.OrderReceieved:
      case RestaurantOrderStatus.PreparingOrder:
        return _waitingDisabledButton();

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
    return TextButton(
        onPressed: () async {
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
        style: TextButton.styleFrom(shape: RoundedRectangleBorder()),
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8),
            child: Text(
                '${_i18n()["RestaurantControllButtons"]["confirmPickup"]}')));
  }

  Widget _orderDeliveredComponent() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 30.sp,
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
                DateFormat('dd MMM yy h:m').format(widget.order.orderTime),
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

  Widget _waitingDisabledButton() {
    return TextButton(
        onPressed: null,
        style: TextButton.styleFrom(
            backgroundColor: Colors.grey, shape: RoundedRectangleBorder()),
        child: Container(
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          child:
              Text('${_i18n()["RestaurantControllButtons"]["confirmPickup"]}'),
        ));
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
                DateFormat('dd MMM yy h:m').format(widget.order.orderTime),
                style: Get.textTheme.subtitle1,
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _confirmDeliveryButton() {
    return TextButton(
        onPressed: () async {
          setState(() {
            clicked = true;
          });
          await restaurantOrderController
              .finishRestaurantDelivery(widget.order.orderId)
              .then((ServerResponse value) => setState(() {
                    clicked = false;
                  }));
          // Get.back(closeOverlays: true);
        },
        style: TextButton.styleFrom(shape: RoundedRectangleBorder()),
        child: Container(
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          child: Text(
              '${_i18n()["RestaurantControllButtons"]["confirmDelivery"]}'),
        ));
  }
}
