import 'dart:async';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/AppUpdate.dart';

class AppVersionController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  StreamSubscription? _versionListener;
  Rxn<AppUpdate> appVersionInfos = Rxn();
  // this is only used inside AppNeedUpdate Screen

  @override
  void onInit() {
    String packageName = getPackageName().replaceAll('.', '-');
    // At start we set it to the same as current
    String platform = getPlatformType().toShortString();

    _versionListener = _databaseHelper.firebaseDatabase
        .reference()
        .child("version/$packageName-$platform")
        .onValue
        .distinct()
        .listen((appUpdateInfos) {
      dynamic payload = appUpdateInfos.snapshot.value;

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
