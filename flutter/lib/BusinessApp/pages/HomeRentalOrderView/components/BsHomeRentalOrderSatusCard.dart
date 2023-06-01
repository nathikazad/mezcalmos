import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessOrderHelper.dart';

class BsHomeRentalOrderSatusCard extends StatelessWidget {
  const BsHomeRentalOrderSatusCard({super.key, required this.status});
  final BusinessOrderRequestStatus status;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: (5 == 7) ? Colors.grey.shade400 : null,
              child: Icon(
                status.getIcon(),
                size: 15,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(status.toReadableString(),
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyLarge),
              ),
            ),
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
