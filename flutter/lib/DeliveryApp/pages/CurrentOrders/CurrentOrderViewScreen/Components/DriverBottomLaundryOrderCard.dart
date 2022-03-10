import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/controllers/laundryController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Components/LaundryControllButtons.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Components/LaundryOrderHeader.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Components/laundryOrderFromToComponent.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:sizer/sizer.dart';

class DriverBottomLaundryOrderCard extends StatefulWidget {
  final LaundryOrder order;
  DriverBottomLaundryOrderCard({Key? key, required this.order})
      : super(key: key);

  @override
  State<DriverBottomLaundryOrderCard> createState() =>
      _DriverBottomLaundryOrderCardState();
}

class _DriverBottomLaundryOrderCardState
    extends State<DriverBottomLaundryOrderCard> {
  Laundry? laundry;
  LaundryOrderController laundryOrderController =
      Get.find<LaundryOrderController>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
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
      return LaundryControllButtons(order: widget.order);
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
              'Order canceled',
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
              'Order Deliverd',
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
        return 'Ready for pick-up';
      case LaundryOrderStatus.OtwPickup:
        return 'Pick-up on the way';
      case LaundryOrderStatus.PickedUp:
        return 'Order Picked up';
      case LaundryOrderStatus.AtLaundry:
        return 'Order at laundry';
      case LaundryOrderStatus.ReadyForDelivery:
        return 'Order ready for delivery';
      case LaundryOrderStatus.OtwDelivery:
        return 'Delivery on the way';
      case LaundryOrderStatus.Delivered:
        return 'Order Delivered';
      case LaundryOrderStatus.CancelledByAdmin:
        return 'Order Canceled';
      case LaundryOrderStatus.CancelledByCustomer:
        return 'Order Canceled';

      default:
        return '';
    }
  }
}
