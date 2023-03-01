import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:sizer/sizer.dart';

/// UI widget used to inform restaurant operator
///
/// that he is not approved yet
class ServiceWaitingForApproval extends StatelessWidget {
  const ServiceWaitingForApproval({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 35.h,
            width: double.infinity,
            child: Image.asset(
              aRequestWaiting,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25),
            alignment: Alignment.center,
            child: Text(
              "YOUR REQUEST IS BEING PROCESSED",
              style: Get.textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 15),
            child: Text(
              "You will be notified once your request is approved.",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
