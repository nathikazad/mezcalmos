import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/pages/MessagesListView/components/MezMessageCard.dart';
import 'package:mezcalmos/Shared/pages/MessagesListView/components/NoMessgaesCompenent.dart';
import 'package:mezcalmos/Shared/pages/MessagesListView/controllers/MessagesListViewcontroller.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustomerWrapper'];

class MessagesListView extends StatefulWidget {
  const MessagesListView(
      {super.key, this.entityType, this.entityId, this.showAppbar = true});
  final EntityType? entityType;
  final int? entityId;

  final bool showAppbar;

  static Future<void> navigate(
      {required EntityType entityType, required int entityId}) async {
    return MezRouter.toPath(constructPath(),
        arguments: {"entityType": entityType, "entityId": entityId});
  }

  static String constructPath() {
    return SharedRoutes.kHomeRoute;
  }

  @override
  State<MessagesListView> createState() => _MessagesListViewState();
}

class _MessagesListViewState extends State<MessagesListView> {
  late MessagesListViewController viewcontroller;
  EntityType? serviceProvider;
  int? entityId;

  @override
  void initState() {
    super.initState();
    _assignVariables();
    if (serviceProvider != null) {
      _initController();
      viewcontroller.init();
    }
  }

  void _initController() {
    switch (serviceProvider) {
      case EntityType.Customer:
        viewcontroller = CustMessagesListViewController();
        break;
      case EntityType.Business:
        viewcontroller = ServiceProviderMessagesListViewController(
            serviceId: entityId!,
            type: serviceProvider!.toServiceProviderType());
        break;

      default:
        throw StateError(
            "Service Provider Type not supported yet ${serviceProvider.toString()}");
    }
  }

  void _assignVariables() {
    entityId = widget.entityId ?? MezRouter.bodyArguments?["entityId"] as int?;
    serviceProvider = widget.entityType ??
        MezRouter.bodyArguments?["entityType"] as EntityType?;
  }

  void dispose() {
    viewcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        appBar: (widget.showAppbar)
            ? MezcalmosAppBar(
                AppBarLeftButtonType.Menu,
                title: '${_i18n()["messages"]}',
                showNotifications: true,
              )
            : null,
        body: Obx(
          () {
            if (viewcontroller.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (viewcontroller.allChats.isEmpty) {
              return NoMessagesWidget();
            }
            return ListView(
              controller: viewcontroller.scrollController,
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(10),
              children: List.generate(
                viewcontroller.allChats.length,
                (int index) {
                  if (viewcontroller.allChats[index].lastMessage == null) {
                    return SizedBox.shrink();
                  }
                  return MezMessageCard(
                    chat: viewcontroller.allChats[index],
                    onClick: () {
                      if (Get.find<AuthController>().user == null) {
                        SignInView.navigateAtOrderTime();
                      } else {
                        viewcontroller.navigateToChatScreen(
                          chatid: viewcontroller.allChats[index].id,
                        );
                      }
                    },
                  );
                },
              ),
            );
          },
        ));
  }
}
