import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessOrderHelper.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['BusinessApp']['pages']['Orders']
        ['HomeRentalOrderView']['components']['BsHomeRentalOrderItemCard'];

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
            // CircleAvatar(
            //   radius: 18,
            //   backgroundColor: (status.isCancelled) ? offRedColor : null,
            //   child: Icon(
            //     status.getIcon(),
            //     size: 15,
            //     color: status.isCancelled ? redAccentColor : Colors.white,
            //   ),
            // ),
            Icon(
              status.getIcon(),
              size: 27.5,
              color: status.isCancelled ? redAccentColor : primaryBlueColor,
            ),
            Expanded(
              child: Center(
                child: Text("${_i18n()[status.toReadableString()]}",
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
