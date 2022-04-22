// /*
// * Created By Mirai Devs.
// * On 4/1/2022.
// */
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mezcalmos/Shared/widgets/MezUpgrader/MezUpgradeBase.dart';
// import 'package:mezcalmos/Shared/widgets/MezUpgrader/MezUpgraderUtils.dart';

// /// A widget to display the upgrade dialog.
// class MezUpgradeAlert extends UpgradeBase {
//   MezUpgradeAlert({
//     Key? key,
//     required this.releaseNotes,
//     required this.appName,
//     required this.packageName,
//     required this.currentAppStoreVersion,
//     required this.currentInstalledVersion,
//   }) : super(key: key);

//   final String releaseNotes;
//   final String appName;
//   final String packageName;
//   final String currentAppStoreVersion;
//   final String currentInstalledVersion;

//   @override
//   Widget build(BuildContext context, UpgradeBaseState state) {
//     return WillPopScope(
//       onWillPop: () async {
//         if (Get.isDialogOpen!) {
//           Get.back<void>();
//         }
//         return false;
//       },
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: FutureBuilder(
//           future: state.initialized,
//           builder: (BuildContext context, AsyncSnapshot<bool> processed) {
//             if (processed.connectionState == ConnectionState.done &&
//                 processed.data != null &&
//                 processed.data!) {
//               return MezUpgrade().checkVersion(
//                 context: context,
//                 releaseNotes: releaseNotes,
//                 appName: appName,
//                 packageName: packageName,
//                 currentAppStoreVersion: currentAppStoreVersion,
//                 currentInstalledVersion: currentInstalledVersion,
//               );
//             }
//             return SizedBox.shrink();
//           },
//         ),
//       ),
//     );
//   }
// }
