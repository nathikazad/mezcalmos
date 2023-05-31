import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BsHomeRentalOrderSatusCard extends StatelessWidget {
  const BsHomeRentalOrderSatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: (5 == 7) ? Colors.grey.shade400 : null,
                    child: Icon(
                      Icons.pending,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      "Pending",
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyLarge?.copyWith(
                          color: (5 == 7) ? Colors.grey.shade400 : null),
                    ),
                  ),
                ],
              ),
            ),
            VerticalDivider(),
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: (5 == 5) ? Colors.grey.shade400 : null,
                    child: Icon(
                      Icons.sync,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      "In progress",
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyLarge?.copyWith(
                          color: (5 == 5) ? Colors.grey.shade400 : null),
                    ),
                  ),
                ],
              ),
            ),
            VerticalDivider(),
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: (5 == 5) ? Colors.grey.shade400 : null,
                    child: Icon(
                      Icons.done,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      "Completed",
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyLarge?.copyWith(
                          color: (5 == 5) ? Colors.grey.shade400 : null),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
