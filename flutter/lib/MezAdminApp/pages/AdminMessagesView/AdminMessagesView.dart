import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminMessagesView/controllers/AdminMessagesViewController.dart';
import 'package:mezcalmos/MezAdminApp/router/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/pages/MessagesListView/components/MezMessageCard.dart';
import 'package:mezcalmos/Shared/pages/MessagesListView/components/NoMessgaesCompenent.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';

class AdminMessagesView extends StatefulWidget {
  const AdminMessagesView({Key? key}) : super(key: key);
  Future<void> navigate() async {
    return MezRouter.toPath(MezAdminRoutes.kAdminMessagesView);
  }

  @override
  State<AdminMessagesView> createState() => _AdminMessagesViewState();
}

class _AdminMessagesViewState extends State<AdminMessagesView>
    with TickerProviderStateMixin {
  AdminMessagesViewController viewController = AdminMessagesViewController();

  @override
  void initState() {
    viewController.init(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Menu,
          title: "Chat",
          tabBar: TabBar(controller: viewController.tabController, tabs: [
            Tab(
              text: "Users",
            ),
            Tab(
              text: "Service Providers",
            ),
          ])),
      body: TabBarView(
        controller: viewController.tabController,
        children: [
          _servicesMessagesList(),
          _customersMessagesList(),
        ],
      ),
    );
  }

  Widget _servicesMessagesList() {
    return Obx(
      () {
        if (viewController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (viewController.servicesChats.isEmpty) {
          return NoMessagesWidget();
        }
        return ListView(
          controller: viewController.servicesScrollController,
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(10),
          children: List.generate(
            viewController.servicesChats.length,
            (int index) {
              if (viewController.servicesChats[index].lastMessage == null) {
                return SizedBox.shrink();
              }
              return MezMessageCard(
                chat: viewController.servicesChats[index],
                onClick: () {
                  if (Get.find<AuthController>().user == null) {
                    SignInView.navigateAtOrderTime();
                  } else {
                    viewController.navigateToChatScreen(
                      chatid: viewController.servicesChats[index].id,
                    );
                  }
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _customersMessagesList() {
    return Obx(
      () {
        if (viewController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (viewController.customersChat.isEmpty) {
          return NoMessagesWidget();
        }
        return ListView(
          controller: viewController.customersScrollController,
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(10),
          children: List.generate(
            viewController.customersChat.length,
            (int index) {
              if (viewController.customersChat[index].lastMessage == null) {
                return SizedBox.shrink();
              }
              return MezMessageCard(
                chat: viewController.customersChat[index],
                onClick: () {
                  if (Get.find<AuthController>().user == null) {
                    SignInView.navigateAtOrderTime();
                  } else {
                    viewController.navigateToChatScreen(
                      chatid: viewController.customersChat[index].id,
                    );
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
