import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/pages/MessagesListView/controllers/MessagesListViewcontroller.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustomerWrapper'];

class MessagesListView extends StatefulWidget {
  const MessagesListView({super.key, this.serviceProviderType});
  final ServiceProviderType? serviceProviderType;

  static Future<void> navigate(
      {required ServiceProviderType serviceProviderType}) async {
    return MezRouter.toPath(SharedRoutes.kHomeRoute,
        arguments: {"serviceProviderType": serviceProviderType});
  }

  @override
  State<MessagesListView> createState() => _MessagesListViewState();
}

class _MessagesListViewState extends State<MessagesListView> {
  late MessagesListViewController viewcontroller;
  ServiceProviderType? serviceProvider;

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
      case ServiceProviderType.Customer:
        viewcontroller = CustMessagesListViewController();
        break;
      case ServiceProviderType.Business:
        viewcontroller = BsOpMessagesListViewController();
        break;
      default:
        throw StateError(
            "Service Provider Type not supported yet ${serviceProvider.toString()}");
    }
  }

  void _assignVariables() {
    serviceProvider = widget.serviceProviderType ??
        MezRouter.bodyArguments?["serviceProviderType"] as ServiceProviderType?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Menu,
        title: '${_i18n()["messages"]}',
        showNotifications: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Obx(() {
          if (viewcontroller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (viewcontroller.allChats.isEmpty) {
            return Center(
              child: Text("No Chats"),
            );
          }
          return Column(
            children: List.generate(
              viewcontroller.allChats.length,
              (int index) {
                /// This is special case
                /// This condition means user has created the chat
                /// but did not send any message. In that case,
                /// we just skip the message list card to being build
                if (viewcontroller.allChats[index].messages.isEmpty) {
                  return SizedBox.shrink();
                }
                return MezCard(
                  onClick: () {
                    if (Get.find<AuthController>().user == null) {
                      SignInView.navigateAtOrderTime();
                    } else {
                      viewcontroller.navigateToChatScreen(
                        chatid: viewcontroller.allChats[index].id,
                      );
                    }
                  },
                  content: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          viewcontroller.allChats[index].chatInfo.chatImg,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    viewcontroller
                                        .allChats[index].chatInfo.chatTite,
                                    style: context.textTheme.bodyLarge,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    viewcontroller
                                        .allChats[index].lastMessage!.timestamp
                                        .getOrderTime(),
                                  ),
                                ],
                              ),
                              Obx(
                                () => Text(
                                  viewcontroller
                                          .allChats[index].messages.isEmpty
                                      ? ""
                                      : viewcontroller
                                          .allChats[index].lastMessage!.message,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
