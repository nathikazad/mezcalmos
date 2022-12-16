import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/routes/sharedRouter.dart';

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
        color: Color.fromRGBO(103, 121, 254, 0.29),
        borderRadius: BorderRadius.circular(4),
      ),
      child: GestureDetector(
        onTap: () {
          popEverythingAndNavigateTo(kTaxiRequestRoute, args: taxiRequest);
        },
        child: Center(
          child: Icon(
            Icons.refresh_outlined,
            color: Color.fromRGBO(103, 121, 254, 1),
            size: 20,
          ),
        ),
      ),
    );
  }
}
