import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/CustMessagesView/controllers/CustChatController.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustomerWrapper'];

class CustMessagesView extends StatefulWidget {
  const CustMessagesView({super.key});

  @override
  State<CustMessagesView> createState() => _CustMessagesViewState();
}

class _CustMessagesViewState extends State<CustMessagesView> {
  final CustChatController custChatController = CustChatController();

  @override
  void initState() {
    super.initState();
    custChatController.init();
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
        padding: EdgeInsets.all(16),
        child: Obx(() {
          if (custChatController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (custChatController.allChats.isEmpty) {
            return Center(
              child: Text("No Chats"),
            );
          }
          return Column(
            children: List.generate(
              custChatController.allChats.length,
              (index) {
                return MezCard(
                  margin: EdgeInsets.only(bottom: 10),
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  elevation: 0,
                  onClick: () {
                    if (Get.find<AuthController>().user == null) {
                      SignInView.navigateAtOrderTime();
                    } else {
                      custChatController.navigateToChatScreen(
                        chatid: custChatController.allChats[index].id,
                      );
                    }
                  },
                  content: Row(
                    children: [
                      CircleAvatar(
                        radius: 16.5.mezSp,
                        backgroundImage: NetworkImage(
                          custChatController.allChats[index].chatInfo.chatImg,
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
                                  Expanded(
                                    child: Text(
                                      custChatController
                                          .allChats[index].chatInfo.chatTite,
                                      style: context.textTheme.bodyLarge
                                          ?.copyWith(
                                              fontSize: 12.5.mezSp,
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    custChatController
                                        .allChats[index].creationTime
                                        .timeAgo(),
                                  ),
                                ],
                              ),
                              Text(
                                custChatController
                                        .allChats[index].messages.isEmpty
                                    ? ""
                                    : custChatController
                                        .allChats[index].messages.last.message,
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
