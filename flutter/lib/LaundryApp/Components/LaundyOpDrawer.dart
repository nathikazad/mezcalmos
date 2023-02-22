// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:mezcalmos/LaundryApp/controllers/laundryOpAuthController.dart';
// import 'package:mezcalmos/LaundryApp/router.dart';
// import 'package:mezcalmos/Shared/MezRouter.dart';
// import 'package:mezcalmos/Shared/constants/global.dart';
// import 'package:mezcalmos/Shared/controllers/authController.dart';
// import 'package:mezcalmos/Shared/controllers/languageController.dart';
// import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
// import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
// import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
// import 'package:mezcalmos/Shared/sharedRouter.dart';
// import 'package:mezcalmos/Shared/widgets/ContactUsPopUp.dart';
// import 'package:sizer/sizer.dart';
// import 'package:url_launcher/url_launcher.dart';

// dynamic _i18n() => Get.find<LanguageController>().strings["LaundryApp"]
//     ["components"]["LaundryAppDrawer"];

// class LaundryAppDrawer extends StatefulWidget {
//   const LaundryAppDrawer({Key? key}) : super(key: key);

//   @override
//   State<LaundryAppDrawer> createState() => _LaundryAppDrawerState();
// }

// class _LaundryAppDrawerState extends State<LaundryAppDrawer> {
//   // controllers //
//   final LanguageController languageController = Get.find<LanguageController>();
//   final SideMenuDrawerController _drawerController =
//       Get.find<SideMenuDrawerController>();
//   AuthController authController = Get.find<AuthController>();

//   LaundryOpAuthController laundryOpAuthController =
//       Get.find<LaundryOpAuthController>();
//   // helpers //
//   final AppLaunchMode lmd = getAppLaunchMode();

//   // variables //
//   final String version = GetStorage().read<String>(getxAppVersion) as String;
//   Rxn<Laundry> laundry = Rxn();

//   @override
//   void initState() {
//     // TODO: implement initState

//     super.initState();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Container(
//         width: 70.w,
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         child: Column(
//           children: [
//             Obx(
//               () => Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: 40,
//                       ),
//                       // Laundry IMAGE AND NAME

//                       if (laundry.value != null) _laundryImageAndName(),

//                       // Navigation links
//                       if (laundryOpAuthController.operator.value != null &&
//                           laundryOpAuthController
//                                   .operator.value?.state.serviceProviderId !=
//                               null)
//                         _operatorNavLinks(),
//                       _navigationLink(
//                         onClick: () {
//                           _drawerController.closeMenu();
//                           showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return ContactUsPopUp();
//                               });
//                         },
//                         icon: Icons.alternate_email,
//                         titleWidget: Text('${_i18n()["contact"]}'),
//                       ),
//                       _languageSwitcher(),
//                       _navigationLink(
//                           onClick: () {
//                             _drawerController.closeMenu();
//                             launch(GetStorage().read(getxPrivacyPolicyLink));
//                           },
//                           icon: Icons.privacy_tip,
//                           titleWidget: Text(
//                             "${_i18n()["privacyPolicies"]}",
//                             style: Get.textTheme.bodyText1,
//                           )),
//                       _navigationLink(
//                           onClick: () async {
//                             _drawerController.closeMenu();
//                             //   await authController.signOut();
//                           },
//                           icon: Icons.logout,
//                           titleWidget: Text(
//                             "${_i18n()["logout"]}",
//                             style: Get.textTheme.bodyText1,
//                           )),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//                 alignment: Alignment.center,
//                 child: Text(
//                   version +
//                       (lmd != AppLaunchMode.prod
//                           ? " ${lmd.toShortString()}"
//                           : ""),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _languageSwitcher() {
//     return _navigationLink(
//         onClick: () {
//           languageController.changeUserLanguage();

//           _drawerController.closeMenu();
//         },
//         icon: Icons.translate,
//         titleWidget: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "${_i18n()["language"]}",
//               style: Get.textTheme.bodyText1,
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Container(
//                   height: 15,
//                   width: 15,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                       image: AssetImage(languageController.oppositFlag),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Text(
//                   languageController.oppositToLang,
//                 ),
//               ],
//             ),
//           ],
//         ));
//   }

//   Widget _operatorNavLinks() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           height: 15,
//         ),
//         _navigationLink(
//             onClick: () {
//               _drawerController.closeMenu();
//               MezRouter.toNamed(getEditInfoRoute(
//                   laundryId: laundryOpAuthController.laundryId!));
//             },
//             icon: Icons.person,
//             titleWidget: Text(
//               "${_i18n()["profile"]}",
//               style: Get.textTheme.bodyText1,
//             )),
//         _navigationLink(
//             icon: Icons.settings,
//             onClick: () {
//               _drawerController.closeMenu();
//               MezRouter.toNamed(
//                   getAdminRoute(laundryId: laundryOpAuthController.laundryId!));
//             },
//             titleWidget: Text(
//               "${_i18n()["admin"]}",
//               style: Get.textTheme.bodyText1,
//             )),
//         _navigationLink(
//             onClick: () {
//               MezRouter.toNamed(kNotificationsRoute);
//             },
//             icon: Icons.notifications,
//             titleWidget: Text(
//               "${_i18n()["notifications"]}",
//               style: Get.textTheme.bodyText1,
//             )),
//         _navigationLink(
//             onClick: () {
//               _drawerController.closeMenu();
//               MezRouter.toNamed(kPastOrdersListView);
//             },
//             icon: Icons.history,
//             titleWidget: Text(
//               "${_i18n()["pastOrders"]}",
//               style: Get.textTheme.bodyText1,
//             )),
//       ],
//     );
//   }

//   Widget _laundryImageAndName() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           margin: const EdgeInsets.all(12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CircleAvatar(
//                 radius: 45,
//                 backgroundImage: (laundry.value!.info.image != null)
//                     ? CachedNetworkImageProvider(
//                         laundry.value?.info.image ?? "")
//                     : AssetImage(aNoImage) as ImageProvider,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 laundry.value!.info.name,
//                 style: Get.textTheme.headline3
//                     ?.copyWith(fontWeight: FontWeight.w700, fontSize: 17.sp),
//               ),
//               SizedBox(
//                 height: 45,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 5),
//                 child: Divider(),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _navigationLink(
//       {required IconData icon,
//       required Widget titleWidget,
//       void Function()? onClick}) {
//     return InkWell(
//       onTap: onClick,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
//         child: Row(
//           children: [
//             SizedBox(
//               width: 10,
//             ),
//             Icon(
//               icon,
//               color: Colors.grey.shade400,
//               size: 25,
//             ),
//             SizedBox(
//               width: 20,
//             ),
//             titleWidget
//           ],
//         ),
//       ),
//     );
//   }
// }
