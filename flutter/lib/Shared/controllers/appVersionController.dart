import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/state_manager.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/AppUpdate.dart';

// enum AppUpdateType { MajorUpdate, MinorUpdate, Null }

// extension StringToAppUpdateType on String? {
//   AppUpdateType strToAppUpdateType() {
//     if (this == null)
//       return AppUpdateType.Null;
//     else {
//       return AppUpdateType.values.firstWhere((t) => t.toString() == this,
//           orElse: () => AppUpdateType.Null);
//     }
//   }
// }

class AppVersionController extends GetxController {
  StreamSubscription? _versionListener;
  Rxn<AppUpdate> appVersionInfos = Rxn();
  // this is only used inside AppNeedUpdate Screen

  @override
  void onInit() {
    String packageName = getPackageName().replaceAll('.', '-');
    // At start we set it to the same as current
    String platform = getPlatformType().toShortString();
    mezDbgPrint("s@a@a@d : packageName $packageName");
    mezDbgPrint("s@a@a@d : platform $platform");

    _versionListener = FirebaseDatabase.instance
        .reference()
        .child('version')
        .child("$packageName-$platform")
        .onValue
        .distinct()
        .listen((appUpdateInfos) {
      dynamic payload = appUpdateInfos.snapshot.value;
      mezDbgPrint("s@a@a@d : remoteUpdateInfos $payload");

      if (payload != null) {
        appVersionInfos.value = AppUpdate.fromSnapshotData(payload);
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    _versionListener?.cancel();
    _versionListener = null;
    super.onClose();
  }
}
