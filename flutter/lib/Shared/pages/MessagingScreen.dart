import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/CustomerApp_appbar.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

// Extends GetView<MessagingController> after Nathik implements the controller
class MessagingScreen extends StatefulWidget {
  @override
  _MessagingScreenState createState() => _MessagingScreenState();
}

// TODO : REFACTORING !
class _MessagingScreenState extends State<MessagingScreen> {
  String? orderId;
  ParticipantType? recipientType;
  MessageController controller =
      Get.put<MessageController>(MessageController());
  @override
  void initState() {
    super.initState();
    print("inside messaginScreen onInitState !");
    this.orderId = Get.parameters['orderId'];
    this.recipientType =
        Get.parameters['recipientType']?.toString().toParticipantType();
    // we make sure that the orderId is never null somehow.
    // because we depend on it , on the controller side!
    if (this.orderId == null) {
      Get.snackbar("Error", "Failed retrieving this Order's messages!");
      Get.back();
    }
    controller.clearMessageNotifications(this.orderId!);
    mezDbgPrint(Get.parameters);
  }

  AuthController _authController = Get.find<AuthController>();
  LanguageController _languageController = Get.find<LanguageController>();

  TextEditingController _textEditingController = new TextEditingController();
  ScrollController _listViewScrollController = new ScrollController();
  RxList<Widget> chatLines = <Widget>[].obs;

  RxString _typedMsg = "".obs;

  Widget singleChatComponent(
    String message,
    String? time,
    bool isMe, {
    String? userImage,
  }) =>
      Container(
        alignment: !isMe ? Alignment.centerLeft : Alignment.centerRight,
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Wrap(
            alignment: !isMe ? WrapAlignment.start : WrapAlignment.end,
            runAlignment: !isMe ? WrapAlignment.start : WrapAlignment.end,
            crossAxisAlignment: WrapCrossAlignment.start,
            textDirection: !isMe ? TextDirection.ltr : TextDirection.rtl,
            spacing: 10,
            clipBehavior: Clip.none,
            children: [
              if (!isMe)
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: Colors.grey.shade200, width: 0.5)),
                  child: CircleAvatar(
                    radius: 23,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: handleIfNetworkImage(
                            url: userImage, assetInCaseFailed: aDefaultAvatar)
                        .image,
                  ),
                ),
              Wrap(
                spacing: 5,
                direction: Axis.vertical,
                runAlignment: !isMe ? WrapAlignment.start : WrapAlignment.end,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      constraints: BoxConstraints(maxWidth: 170, minWidth: 80),
                      padding: EdgeInsets.only(
                          left: 25, top: 10, bottom: 10, right: 25),
                      decoration: BoxDecoration(
                          color: !isMe
                              ? Theme.of(context).primaryColorLight
                              : Colors.white,
                          borderRadius: !isMe
                              ? BorderRadius.only(
                                  topLeft: Radius.zero,
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(20))
                              : BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.zero,
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(30))),
                      child: Text(message,
                          softWrap: true,
                          style: (!isMe)
                              ? Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: Colors.white)
                              : Theme.of(context).textTheme.bodyText2)),
                  time != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                              (!isMe ? 'Seen In' : 'Sent In') + '    $time',
                              style: Theme.of(context).textTheme.subtitle1),
                        )
                      : SizedBox(),
                ],
              ),
            ]),
      );

  void scrollDown({Duration? mezChatScrollDuration}) {
    Timer(mezChatScrollDuration ?? Duration(milliseconds: 200), () {
      if (_listViewScrollController.hasClients)
        _listViewScrollController.jumpTo(
          _listViewScrollController.position.maxScrollExtent,
          // duration: Duration(seconds: 1),
          // curve: Curves.fastOutSlowIn
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      scrollDown(mezChatScrollDuration: timeStamp);
    });

    // controller.loadChat(_authController.user!.uid, orderId);
    void _fillCallBack() {
      mezDbgPrint(
          "--------------------- >>>>> FillCallback Executed  >> Messages Count >> ${controller.value?.messages.length}!");
      chatLines.assignAll(controller.value!.messages.map(
        (e) {
          // mezDbgPrint(
          //     " \t\t ${controller.value!.participants[e.userId]?.image}");
          return singleChatComponent(
            e.message,
            e.formatedTime,
            e.userId == _authController.user!.uid,
            userImage: controller.value!.participants[e.userId]?.image,
          );
        },
      ));

      scrollDown();
    }

    controller.loadChat(_authController.user!.uid, orderId!,
        onValueCallBack: _fillCallBack);

    return Scaffold(
        appBar: CustomerAppBar(
            title: controller.recipient(participantType: recipientType)?.name ??
                "Customer",
            autoBack: true),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Obx(
                  () => ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 20, bottom: 0),
                    controller: _listViewScrollController,
                    children: List.from(chatLines.reversed),
                  ),
                ),
              ),
              SendMessageBox(
                  typedMsg: _typedMsg,
                  textEditingController: _textEditingController,
                  languageController: _languageController,
                  controller: controller,
                  orderId: orderId)
            ],
          ),
        ));
  }
}

class SendMessageBox extends StatelessWidget {
  const SendMessageBox({
    Key? key,
    required RxString typedMsg,
    required TextEditingController textEditingController,
    required LanguageController languageController,
    required this.controller,
    required this.orderId,
  })  : _typedMsg = typedMsg,
        _textEditingController = textEditingController,
        _languageController = languageController,
        super(key: key);

  final RxString _typedMsg;
  final TextEditingController _textEditingController;
  final LanguageController _languageController;
  final MessageController controller;
  final String? orderId;

  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: (value) => _typedMsg.value = value,
        controller: _textEditingController,
        style: Theme.of(context).textTheme.bodyText2,
        cursorColor: Colors.purple,
        scrollPadding: EdgeInsets.all(10),
        decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(30),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderSide: BorderSide.none),
            hintText: _languageController.strings['shared']['messages']
                ['writeMsgPlaceholder'],
            hintStyle: Theme.of(context).textTheme.subtitle1,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () {
                  bool msgReady2Send =
                      _textEditingController.text.replaceAll(' ', '').length >
                          0;
                  if (msgReady2Send) {
                    controller.sendMessage(_typedMsg.value, this.orderId!);
                    _textEditingController.clear();
                    _typedMsg.value = "";
                  } else {
                    _textEditingController.clear();
                    _typedMsg.value = "";
                  }
                },
                child: Obx(
                  () => Container(
                    child: Icon(
                      Icons.send,
                      size: 18,
                      color: Colors.white,
                    ),
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _typedMsg.value.length > 0
                          ? Theme.of(context).primaryColorLight
                          : Colors.grey.shade200,
                    ),
                  ),
                ),
              ),
            )));
  }
}
