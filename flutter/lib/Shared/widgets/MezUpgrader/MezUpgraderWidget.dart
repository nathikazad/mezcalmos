/*
* Created By Mirai Devs.
* On 4/1/2022.
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upgrader/upgrader.dart';

abstract class MezUpgrade {
  static void show() {
    Get.dialog<void>(
      _MezUpgradeBody(),
    );
  }
}

class _MezUpgradeBody extends StatelessWidget {
  const _MezUpgradeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: UpgradeAlert(
        debugLogging: true,
        child: Center(
          child: Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 36),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text('Checking...'),
          ),
        ),
      ),
    );
  }
}
