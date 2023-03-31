import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/controllers/DvOrderViewController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/widgets/GradientCircularLoading.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['DeliveryApp']
        ['pages']['CurrentOrders']['CurrentOrderViewScreen']['Components']
    ['DriverBottomRestaurantOrderCard'];

class DvOrderStatusControllButtons extends StatefulWidget {
  /// buttons to controll the restaurant driver order status and the final status of the order (Delivered/Canceled)

  const DvOrderStatusControllButtons({Key? key, required this.viewController})
      : super(key: key);

  final DvOrderViewcontroller viewController;

  @override
  State<DvOrderStatusControllButtons> createState() =>
      _DvOrderStatusControllButtonsState();
}

class _DvOrderStatusControllButtonsState
    extends State<DvOrderStatusControllButtons> {
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      height: 70,
      child: (!widget.viewController.order.isDriverAssigned)
          ? MezButton(
              label: "${_i18n()['acceptOrder']}",
              backgroundColor: Colors.green.shade600,
              borderRadius: 0,
              onClick: () async {
                await widget.viewController.acceptOpenOrder();
              },
            )
          : (clicked)
              ? _loadingPlaceholder()
              : _getFooterComponent(),
    );
  }

  Widget _getFooterComponent() {
    switch (widget.viewController.order.status) {
      case DeliveryOrderStatus.OrderReceived:
        if (widget.viewController.isLaundryPickup ||
            widget.viewController.isCourier) {
          return _handleBtn();
        } else if (!widget.viewController.order.packageReady) {
          return _waitingDisabledButton(
              header:
                  "${_i18n()["RestaurantControllButtons"]["notReadyTitle"]}",
              body: "${_i18n()["RestaurantControllButtons"]["notReadyBody"]}");
        } else {
          return _handleBtn();
        }

      case DeliveryOrderStatus.CancelledByDeliverer:
      case DeliveryOrderStatus.CancelledByServiceProvider:
      case DeliveryOrderStatus.CancelledByCustomer:
        return _canceledOrderComponent();
      case DeliveryOrderStatus.Delivered:
        return _orderDeliveredComponent();
      default:
        return _handleBtn();
    }
  }

  MezButton _handleBtn() {
    return MezButton(
      label: _getBtnTitle(),
      borderRadius: 0,
      onClick: () async {
        if (widget.viewController.order.isTimeSetted) {
          switch (widget.viewController.order.status) {
            case DeliveryOrderStatus.OrderReceived:
              await widget.viewController.startPickup();
              break;
            case DeliveryOrderStatus.OnTheWayToPickup:
              await widget.viewController.atPickup();

              break;
            case DeliveryOrderStatus.AtPickup:
              await widget.viewController.startDropoff();
              break;
            case DeliveryOrderStatus.OnTheWayToDropoff:
              await widget.viewController.atDropoff();
              break;
            case DeliveryOrderStatus.AtDropoff:
              await widget.viewController.finishDelivery();
              break;

            default:
          }
        } else {
          showErrorSnackBar(
              errorText:
                  "Please set estimated times before starting the delivery");
        }
      },
    );
  }

  bool shouldDisableBottomButton() {
    if (widget.viewController.order.estimatedArrivalAtDropoff != null &&
        widget.viewController.order.estimatedArrivalAtPickup != null) {
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
                style: context.txt.bodyLarge,
              ),
              Text(
                DateFormat('dd MMM yy h:m')
                    .format(widget.viewController.order.orderTime.toLocal()),
                style: context.txt.titleMedium,
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
                  strokeWidth: 3,
                  gradientStops: const [
                    0.2,
                    0.8,
                  ],
                  gradientColors: const [
                    primaryBlueColor,
                    secondaryLightBlueColor
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
                style: context.txt.bodyLarge,
              ),
              Text(
                body,
                style: context.txt.titleMedium,
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
                style: context.txt.bodyLarge,
              ),
              Text(
                DateFormat('dd MMM yy h:m')
                    .format(widget.viewController.order.orderTime.toLocal()),
                style: context.txt.titleMedium,
              )
            ],
          ))
        ],
      ),
    );
  }

  String _getBtnTitle() {
    switch (widget.viewController.order.status) {
      case DeliveryOrderStatus.OrderReceived:
        return "${_i18n()["RestaurantControllButtons"]["startPickUp"]}";
      case DeliveryOrderStatus.OnTheWayToPickup:
        return "${_i18n()["RestaurantControllButtons"]["atPickUp"]}";

      case DeliveryOrderStatus.AtPickup:
        return "${_i18n()["RestaurantControllButtons"]["startDelivery"]}";
      case DeliveryOrderStatus.OnTheWayToDropoff:
        return "${_i18n()["RestaurantControllButtons"]["atDropOff"]}";
      case DeliveryOrderStatus.AtDropoff:
        return "${_i18n()["RestaurantControllButtons"]["finishDelivery"]}";

      default:
        return "";
    }
  }
}
