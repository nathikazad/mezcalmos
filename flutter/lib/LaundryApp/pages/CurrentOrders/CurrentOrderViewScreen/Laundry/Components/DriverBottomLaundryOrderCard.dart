import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/LaundryApp/pages/CurrentOrders/CurrentOrderViewScreen/Laundry/Components/LaundryOrderHeader.dart';
import 'package:mezcalmos/LaundryApp/pages/CurrentOrders/CurrentOrderViewScreen/Laundry/Components/laundryOrderFromToComponent.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["LaundryApp"]["pages"]
        ["CurrentOrders"]["CurrentOrderViewScreen"]["Components"]
    ["DriverBottomLaundryOrderCard"];

class DriverBottomLaundryOrderCard extends StatefulWidget {
  final LaundryOrder order;
  const DriverBottomLaundryOrderCard({Key? key, required this.order})
      : super(key: key);

  @override
  State<DriverBottomLaundryOrderCard> createState() =>
      _DriverBottomLaundryOrderCardState();
}

class _DriverBottomLaundryOrderCardState
    extends State<DriverBottomLaundryOrderCard> {
  Laundry? laundry;
 
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _getOrderStatus(),
                style: textTheme.bodyText2,
              ),
              Divider(),
              LaundryOrderHeader(order: widget.order),
              Divider(),
              // From to component
              LaundryOrderFromToComponent(
                order: widget.order,
              ),
              Divider(),
              getBottomComponent(textTheme)
            ],
          ),
        ),
      ),
    );
  }

// Get the right order footer component depending on order status
  Widget getBottomComponent(textTheme) {
    if (widget.order.inProcess() &&
        widget.order.status != LaundryOrderStatus.AtLaundry) {
      return Container(height: 5,);
    } else if (widget.order.status == LaundryOrderStatus.Delivered ||
        widget.order.status == LaundryOrderStatus.AtLaundry) {
      return _orderDeliveredBottomComponent(textTheme);
    } else if (widget.order.status == LaundryOrderStatus.CancelledByAdmin ||
        widget.order.status == LaundryOrderStatus.CancelledByCustomer) {
      return _orderBottomCanceledComponent(textTheme);
    } else {
      return Container();
    }
  }

// Component to be place at the bottom when order is canceled
  Widget _orderBottomCanceledComponent(TextTheme textTheme) {
    return Row(
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
          children: [
            Text(
              "${_i18n()["orderStatus"]["canceled"]}",
              style: textTheme.bodyText1,
            ),
            Text(
              DateFormat('dd MMM yy h:m').format(widget.order.orderTime),
              style: textTheme.subtitle1,
            )
          ],
        ))
      ],
    );
  }

// Component to be place at the bottom when order is deliverd
  Widget _orderDeliveredBottomComponent(TextTheme textTheme) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 30.sp,
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${_i18n()["orderStatus"]["delivered"]}",
              style: textTheme.bodyText1,
            ),
            Text(
              DateFormat('dd MMM yy h:m').format(widget.order.orderTime),
              style: textTheme.subtitle1,
            )
          ],
        ))
      ],
    );
  }

  String _getOrderStatus() {
    switch (widget.order.status) {
      case LaundryOrderStatus.OrderReceieved:
        return "${_i18n()["orderStatus"]["readyForPickup"]}";
      case LaundryOrderStatus.OtwPickup:
        return "${_i18n()["orderStatus"]["pickupOtw"]}";
      case LaundryOrderStatus.PickedUp:
        return "${_i18n()["orderStatus"]["pickedUp"]}";
      case LaundryOrderStatus.AtLaundry:
        return "${_i18n()["orderStatus"]["atLaundry"]}";
      case LaundryOrderStatus.ReadyForDelivery:
        return "${_i18n()["orderStatus"]["readyForDelivery"]}";
      case LaundryOrderStatus.OtwDelivery:
        return "${_i18n()["orderStatus"]["deliveryOtw"]}";
      case LaundryOrderStatus.Delivered:
        return "${_i18n()["orderStatus"]["delivered"]}";
      case LaundryOrderStatus.CancelledByAdmin:
        return '${_i18n()["orderStatus"]["canceled"]}';
      case LaundryOrderStatus.CancelledByCustomer:
        return '${_i18n()["orderStatus"]["canceled"]}';
      default:
        return '';
    }
  }
}
