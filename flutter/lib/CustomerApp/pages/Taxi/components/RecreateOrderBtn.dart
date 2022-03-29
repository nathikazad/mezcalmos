import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

class RecreateOrderButton extends StatelessWidget {
  const RecreateOrderButton({
    Key? key,
    required this.taxiRequest,
  }) : super(key: key);

  final TaxiRequest taxiRequest;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: getSizeRelativeToScreen(16, Get.height, Get.width),
      width: getSizeRelativeToScreen(16, Get.height, Get.width),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade400,
        borderRadius: BorderRadius.circular(4),
      ),
      child: GestureDetector(
        onTap: () {
          popEverythingAndNavigateTo(kTaxiRequestRoute, args: taxiRequest);
        },
        child: Center(
          child: Icon(
            Icons.replay_circle_filled_sharp,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
