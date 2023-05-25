import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustOrderCostCard extends StatelessWidget {
  const CustOrderCostCard({
    super.key,
    required this.orderCostString,
  });

  final String orderCostString;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 8.0,
        ),
        child: Row(
          children: [
            Text(
              "Order Cost",
              style: context.textTheme.bodyLarge,
            ),
            Expanded(
              child: Text(
                orderCostString.isEmpty ? "-" : orderCostString,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
