import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']
    ['controllers']['SideMenuDrawerController'];

class SideMenuDrawerController extends GetxController {
  GlobalKey<ScaffoldState>? _scaffoldKey;
  List<SideMenuItem> sideMenuItems = [];
  String? pastOrdersRoute;

  GlobalKey<ScaffoldState>? getNewKey() {
    _scaffoldKey =
        new GlobalKey<ScaffoldState>(debugLabel: '___ScaffoldStateKey___');

    return _scaffoldKey;
  }

  @override
  void onInit() {
    super.onInit();

    mezDbgPrint(
        "<<<<<<<<<<<<<<<<<<<<<<<<<<<< [ SideMenuDrawerController Initialized ] >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
  }

  // void addContactAdminItem({required int id, required RecipientType type}) {
  //   final SideMenuItem item = SideMenuItem(
  //     onClick: () async {
  //       try {
  //         int? chatId = await get_admin_chat_id(recepientId: id, type: type);
  //         mezlog("ChatId: $chatId");
  //         if (chatId != null) {
  //           closeMenu();
  //           unawaited(BaseMessagingScreen.navigate(chatId: chatId));
  //         } else {
  //           final MezAdminChatResponse res =
  //               await CloudFunctions.serviceProvider_createMezAdminChat(
  //                   recipientId: id, recipientType: type);
  //           mezlog(res.toFirebaseFormattedJson());
  //           if (res.success) {
  //             closeMenu();
  //             unawaited(
  //                 BaseMessagingScreen.navigate(chatId: res.chatId!.toInt()));
  //           }
  //         }
  //       } on FirebaseException catch (e) {
  //         showErrorSnackBar(errorText: e.message.toString());
  //         throw Exception(e);
  //       } catch (e) {
  //         throw Exception(e);
  //       }
  //     },
  //     icon: Icons.contact_support_sharp,
  //     titleWidget: Obx(() => Expanded(
  //           child: Text('${_i18n()['contactAdmin']}',
  //               maxLines: 2,
  //               style: TextStyle(
  //                 fontFamily: "Montserrat",
  //                 fontWeight: FontWeight.w600,
  //                 fontSize: 13.mezSp,
  //                 color: Colors.black,
  //               )),
  //         )),
  //   );
  //   if (!sideMenuItems.contains(item)) {
  //     sideMenuItems.add(item);
  //   }
  // }

  void openMenu() {
    mezDbgPrint("Openning side menu");
    if (_scaffoldKey?.currentState?.isEndDrawerOpen == false) {
      mezDbgPrint("Openning side menu");
      _scaffoldKey?.currentState?.openDrawer();
    } else {
      _scaffoldKey?.currentState?.openEndDrawer();
    }
  }

  void closeMenu() {
    _scaffoldKey?.currentState?.openEndDrawer();
  }

  @override
  void onClose() {
    mezDbgPrint(
        "<<<<<<<<<<<<<<<<<<<<<<<<<<<< [ SideMenuDrawerController Closed ] >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    super.onClose();
  }
}
