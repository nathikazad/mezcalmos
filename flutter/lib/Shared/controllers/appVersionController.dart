import 'dart:async';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

enum UpdateType { Major, Minor, Null }

class AppVersionController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  Timer? _versionPeriodicTimer;
  Rx<UpdateType> needsUpdate = UpdateType.Null.obs;

  // this is only used inside AppNeedUpdate Screen

  @override
  void onInit() {
    //  get the package name ex : com.mezcalmos.customer
    String packageName = getPackageName();

    // At start we set it to the same as current
    String platform =
        getPlatformType().toShortString(); // returns 'ios' 'android'
    mezDbgPrint("s@a@a@d : packageName $packageName");
    mezDbgPrint("s@a@a@d : platform $platform");
    mezDbgPrint("s@a@a@d : Listening on  version/$packageName-$platform");

    _versionPeriodicTimer = Timer.periodic(Duration(hours: 3), (Timer _t) {
      if (_versionPeriodicTimer == null) {
        _t.cancel();
      }

//    [major].[minor].[patches]

// Periodic-timer -> works kol 3h :
// 	- fte7 app mn idid : first run dial timer
// 		- if new version : update (major - minor/patches)
// 			- if major :
// 				- IOS : full screen w fiha button -> appStore (link).
// 				- Android : full Screen w fiha button ->
// 					- package:in_app_update -> performImmediateUpdate

// 			- if Minor :
// 				- iOS : we show a dismissible alert dialog (user can cancel) - with link to app page on app store
// 				- android : we show a dismissible (user can cancel) alert with button (onPress) -> executes : package:in_app_update:startFlexibleUpdate() ->
// 					which runs completeFlexibleUpdate()  upon complete.

// 			main yokel update : We can close - open app (reload the app).

      // if there updates

      needsUpdate.value = true;
    });

    // _versionListener = _databaseHelper.firebaseDatabase
    //     .reference()
    //     .child("version/$packageName-$platform")
    //     .onValue
    //     .distinct()
    //     .listen((appUpdateInfos) {
    //   mezDbgPrint("s@a@a@d : GOT IT   ");

    //   dynamic payload = appUpdateInfos.snapshot.value;
    //   mezDbgPrint("s@a@a@d : remoteUpdateInfos $payload");

    //   if (payload != null) {
    //     appVersionInfos.value = AppUpdate.fromSnapshotData(payload);
    //   }
    // });
    super.onInit();
  }

  @override
  void onClose() {
    _versionPeriodicTimer?.cancel();
    _versionPeriodicTimer = null;
    super.onClose();
  }
}
