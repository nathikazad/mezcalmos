/*
* Created By Mirai Devs.
* On 4/1/2022.
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/widgets/MezUpgrader/MezUpgradeAlert.dart';

abstract class MezUpgrade {
  static void show() {
    //MezUpgrader().initialize();
    //MezUpgradeAlert();
    MezUpgradeAlert();
    // Get.dialog<void>(
    //   _MezUpgradeBody(),
    // );
  }
}

class _MezUpgradeBody extends StatelessWidget {
  const _MezUpgradeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Get.isDialogOpen!) {
          Get.back<void>();
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: MezUpgradeAlert(),
      ),
    );
  }
}
