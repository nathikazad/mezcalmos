import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';

class FilterOrders extends StatelessWidget {
  FilterOrders({
    Key? key,
  }) : super(key: key);

  OrderController controller = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            FilterChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.list, color: Colors.black),
                  SizedBox(
                    width: 10,
                  ),
                  Text('All orders'),
                ],
              ),
              onSelected: (v) {
                switchOrderFilter(FilterStatus.All);
              },
              selected: controller.filterStatus.value == FilterStatus.All,
            ),
            SizedBox(
              width: 5,
            ),
            FilterChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Deliverd'),
                ],
              ),
              onSelected: (v) {
                switchOrderFilter(FilterStatus.Done);
              },
              selected: controller.filterStatus.value == FilterStatus.Done,
            ),
            SizedBox(
              width: 5,
            ),
            FilterChip(
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.cancel, color: Colors.red),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Canceled'),
                  ],
                ),
                selected:
                    controller.filterStatus.value == FilterStatus.Canceled,
                onSelected: (v) {
                  switchOrderFilter(FilterStatus.Canceled);
                }),
          ],
        ),
      ),
    );
  }

  switchOrderFilter(FilterStatus newfilterStatus) {
    controller.filterStatus.value = newfilterStatus;
  }
}
