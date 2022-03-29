import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';

class FilterOrders extends StatelessWidget {
  const FilterOrders({
    Key? key,
  }) : super(key: key);

  /// OrderController
  static final OrderController controller = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            FilterChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.list, color: Colors.black),
                  const SizedBox(width: 10),
                  Text('All orders'),
                ],
              ),
              onSelected: (bool v) {
                switchOrderFilter(FilterStatus.All);
              },
              selected: controller.filterStatus.value == FilterStatus.All,
            ),
            const SizedBox(width: 5),
            FilterChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.check_circle, color: Colors.green),
                  const SizedBox(width: 10),
                  Text('Deliverd'),
                ],
              ),
              onSelected: (bool v) {
                switchOrderFilter(FilterStatus.Done);
              },
              selected: controller.filterStatus.value == FilterStatus.Done,
            ),
            const SizedBox(width: 5),
            FilterChip(
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.cancel, color: Colors.red),
                    const SizedBox(width: 10),
                    Text('Canceled'),
                  ],
                ),
                selected:
                    controller.filterStatus.value == FilterStatus.Canceled,
                onSelected: (bool v) {
                  switchOrderFilter(FilterStatus.Canceled);
                }),
          ],
        ),
      ),
    );
  }

  void switchOrderFilter(FilterStatus newfilterStatus) {
    controller.filterStatus.value = newfilterStatus;
  }
}
