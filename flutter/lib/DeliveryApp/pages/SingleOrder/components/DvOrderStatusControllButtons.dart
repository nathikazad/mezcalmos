import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/controllers/DvOrderViewController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cm;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/widgets/Buttons/MezInkwell.dart';
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
    final DvOrderViewcontroller viewController = widget.viewController;
    final DeliveryOrder order = widget.viewController.order;

    if (viewController.isWaitingForOffer) {
      return Container(
        height: 70,
        child: Card(
          child: _waitingForOffer(context),
        ),
      );
    } else if (!order.isDriverAssigned && order.inProcess()) {
      return Container(
        height: 70,
        child: MezButton(
          label: "${_i18n()['acceptOrder']}",
          backgroundColor: Colors.green.shade600,
          borderRadius: 0,
          onClick: () async {
            await viewController.acceptOpenOrder();
          },
        ),
      );
    } else if (clicked) {
      return _loadingPlaceholder();
    } else {
      return Container(height: 70, child: _getFooterComponent());
    }
  }

  Container _waitingForOffer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 0.8,
            child: CircularProgressIndicator(),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
              fit: FlexFit.tight,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Waiting for customer",
                      style: context.textTheme.bodyMedium?.copyWith(height: 0),
                    ),
                    Row(
                      children: [
                        Text("Offer : "),
                        Text(
                            "${widget.viewController.driverOffer!.toPriceString()}",
                            style: context.textTheme.bodyLarge),
                      ],
                    ),
                  ])),
          SizedBox(
            width: 10,
          ),
          MezInkwell(
            label: "Cancel",
            onClick: () async {
              await widget.viewController.cancelOffer();
            },
            textColor: redAccentColor,
            backgroundColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          ),
        ],
      ),
    );
  }

  Widget _getFooterComponent() {
    switch (widget.viewController.order.status) {
      case cm.DeliveryOrderStatus.OrderReceived:
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

      case cm.DeliveryOrderStatus.CancelledByDeliverer:
      case cm.DeliveryOrderStatus.CancelledByServiceProvider:
      case cm.DeliveryOrderStatus.CancelledByCustomer:
        return _canceledOrderComponent();
      case cm.DeliveryOrderStatus.Delivered:
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
        if (widget.viewController.order.isTimeSetted &&
            widget.viewController.order.isDeliveryCostSetted) {
          switch (widget.viewController.order.status) {
            case cm.DeliveryOrderStatus.OrderReceived:
              await widget.viewController.startPickup();
              break;
            case cm.DeliveryOrderStatus.OnTheWayToPickup:
              await widget.viewController.atPickup();

              break;
            case cm.DeliveryOrderStatus.AtPickup:
              await widget.viewController.startDropoff();
              break;
            case cm.DeliveryOrderStatus.OnTheWayToDropoff:
              await widget.viewController.atDropoff();
              break;
            case cm.DeliveryOrderStatus.AtDropoff:
              await widget.viewController.finishDelivery();
              break;

            default:
          }
        } else if (!widget.viewController.order.isTimeSetted) {
          widget.viewController.order.isCourier
              ? showErrorSnackBar(
                  errorTitle: "${_i18n()["noDeliveryTimeTitle"]}",
                  errorText: "${_i18n()["noDeliveryTimeBody"]}")
              : showErrorSnackBar(
                  errorTitle: (widget.viewController.pickuSetted)
                      ? "${_i18n()["noDeliveryTimeTitle"]}"
                      : "${_i18n()["noPickupTimeTitle"]}",
                  errorText: (widget.viewController.pickuSetted)
                      ? "${_i18n()["noDeliveryTimeBody"]}"
                      : "${_i18n()["noPickupTimeBody"]}");
        } else if (!widget.viewController.order.isDeliveryCostSetted) {
          showErrorSnackBar(
              errorTitle: "${_i18n()["setDvCostTitle"]}",
              errorText: "${_i18n()["setDvCostBody"]}");
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
                DateFormat('dd MMM, yy h:m a')
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
      height: 70,
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
      case cm.DeliveryOrderStatus.OrderReceived:
        return "${_i18n()["RestaurantControllButtons"]["startPickUp"]}";
      case cm.DeliveryOrderStatus.OnTheWayToPickup:
        return "${_i18n()["RestaurantControllButtons"]["atPickUp"]}";

      case cm.DeliveryOrderStatus.AtPickup:
        return "${_i18n()["RestaurantControllButtons"]["startDelivery"]}";
      case cm.DeliveryOrderStatus.OnTheWayToDropoff:
        return "${_i18n()["RestaurantControllButtons"]["atDropOff"]}";
      case cm.DeliveryOrderStatus.AtDropoff:
        return "${_i18n()["RestaurantControllButtons"]["finishDelivery"]}";

      default:
        return "";
    }
  }
}
