import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/LaundryApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

class OrderEstimatedTimeComponent extends StatefulWidget {
  const OrderEstimatedTimeComponent({Key? key, required this.order})
      : super(key: key);
  final LaundryOrder order;

  @override
  State<OrderEstimatedTimeComponent> createState() =>
      _OrderEstimatedTimeComponentState();
}

class _OrderEstimatedTimeComponentState
    extends State<OrderEstimatedTimeComponent> {
  OrderController orderController = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Order Estimated Time "),
          SizedBox(
            height: 5,
          ),
          Card(
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () async {
                mezDbgPrint("Tappppppped");
                DateTime? selectedDate = widget.order.estimatedDeliveryTime;

                await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: widget.order.orderTime,
                  lastDate: DateTime(2050),
                ).then((DateTime? value) {
                  setState(() {
                    selectedDate = value;
                    orderController.setEstimatedDeliveryTime(
                        widget.order.orderId, value!);
                  });
                });
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Icon(
                      Icons.timelapse,
                      size: 40,
                      color: keyAppColor,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      (widget.order.estimatedDeliveryTime != null)
                          ? "${DateFormat("dd MMMM yyyy ").format(widget.order.estimatedDeliveryTime!.toLocal())}"
                          : "Set Delivery esitmated time",
                      style: Get.theme.textTheme.bodyText1,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
