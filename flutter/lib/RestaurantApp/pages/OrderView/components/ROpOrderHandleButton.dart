import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

class ROpOrderHandleButton extends StatefulWidget {
  const ROpOrderHandleButton({Key? key, required this.order}) : super(key: key);
  final RestaurantOrder order;

  @override
  State<ROpOrderHandleButton> createState() => _ROpOrderHandleButtonState();
}

class _ROpOrderHandleButtonState extends State<ROpOrderHandleButton> {
  ROpOrderController orderController = Get.find<ROpOrderController>();

  @override
  Widget build(BuildContext context) {
    if (_showBtn) {
      return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: MezButton(
          onClick: handleClick,
          label: getBtnTitle!,
        ),
      );
    } else
      return Container();
  }

  Future<void> handleClick() async {
    if (widget.order.status == RestaurantOrderStatus.OrderReceieved) {
      await orderController.startPreparingOrder(widget.order.orderId);
    } else if (widget.order.status == RestaurantOrderStatus.PreparingOrder) {
      await orderController.setAsReadyForOrderPickup(widget.order.orderId);
    }
  }

  String? get getBtnTitle {
    if (widget.order.status == RestaurantOrderStatus.OrderReceieved) {
      return "Prepare order";
    } else if (widget.order.status == RestaurantOrderStatus.PreparingOrder) {
      return "Order is ready";
    }
    return null;
  }

  bool get _showBtn {
    return widget.order.status == RestaurantOrderStatus.OrderReceieved ||
        widget.order.status == RestaurantOrderStatus.PreparingOrder;
  }
}
