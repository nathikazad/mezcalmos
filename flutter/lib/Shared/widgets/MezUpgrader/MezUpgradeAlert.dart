/*
* Created By Mirai Devs.
* On 4/1/2022.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/widgets/MezUpgrader/MezUpgradeBase.dart';
import 'package:mezcalmos/Shared/widgets/MezUpgrader/MezUpgraderUtils.dart';

/// A widget to display the upgrade dialog.
class MezUpgradeAlert extends UpgradeBase {
  MezUpgradeAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, UpgradeBaseState state) {
    return FutureBuilder(
      future: state.initialized,
      builder: (BuildContext context, AsyncSnapshot<bool> processed) {
        if (processed.connectionState == ConnectionState.done &&
            processed.data != null &&
            processed.data!) {
          return MezUpgrade().checkVersion(context: context);
        }
        return SizedBox.shrink();
      },
    );
  }
}
