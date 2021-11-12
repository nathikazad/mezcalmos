import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

// Extends GetView<MessagingController> after Nathik implements the controller
class MessagingScreen extends StatefulWidget {
  @override
  _MessagingScreenState createState() => _MessagingScreenState();
}

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
        // width: double.infinity,
        // color: Colors.black,
        // margin: const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 30),
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        // const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Wrap(
            // alignment: !isMe ? Alignment.topLeft : Alignment.topRight,
            alignment: !isMe ? WrapAlignment.start : WrapAlignment.end,
            runAlignment: !isMe ? WrapAlignment.start : WrapAlignment.end,
            crossAxisAlignment: WrapCrossAlignment.start,
            textDirection: !isMe ? TextDirection.ltr : TextDirection.rtl,
            spacing: 10,
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: Colors.grey.shade200, width: 0.5)),
                child: CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage: userImage == null || userImage == ""
                      ? AssetImage(aDefaultAvatar) as ImageProvider
                      : NetworkImage(userImage),
                ),
              ),
              Wrap(
                spacing: 5,
                direction: Axis.vertical,
                // alignment: WrapAlignment.spaceEvenly,
                runAlignment: !isMe ? WrapAlignment.start : WrapAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      constraints: BoxConstraints(maxWidth: 170, minWidth: 80),
                      padding: EdgeInsets.only(
                          left: 25, top: 10, bottom: 10, right: 10),
                      // width: Get.width / 2,
                      decoration: BoxDecoration(
                          gradient: !isMe
                              ? LinearGradient(colors: [
                                  Color.fromARGB(255, 248, 248, 248),
                                  Color.fromARGB(255, 248, 248, 248)
                                ])
                              : LinearGradient(colors: [
                                  Color.fromARGB(255, 92, 127, 255),
                                  Color.fromARGB(255, 172, 89, 252)
                                ]),
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
                      child: Text(
                        message,
                        softWrap: true,
                        style: TextStyle(
                            fontFamily: 'psr',
                            fontSize: 15,
                            color: !isMe
                                ? Color.fromARGB(255, 0, 15, 28)
                                : Colors.white),
                      )),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  time != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            (!isMe ? 'Seen In' : 'Sent In') + '    $time',
                            style: TextStyle(
                                fontFamily: 'psr',
                                fontSize: 10,
                                color: Color.fromARGB(255, 0, 15, 28)),
                          ),
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
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: mezcalmosAppBar(
            "back", () => Get.back(result: "clear_notification")),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: Get.width,
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 248, 248, 248)),
                  child: Wrap(
                    spacing: 20,
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Obx(
                          () => CircleAvatar(
                            radius: 23,
                            backgroundColor: Colors.grey.shade200,
                            backgroundImage: controller
                                        .recipient(
                                            participantType: recipientType)
                                        ?.image !=
                                    null
                                ? NetworkImage(controller
                                    .recipient(participantType: recipientType)!
                                    .image)
                                : AssetImage(aDefaultAvatar) as ImageProvider,
                          ),
                        ),
                      ),
                      Obx(
                        () => Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller
                                      .recipient(participantType: recipientType)
                                      ?.name ??
                                  "Customer",
                              style:
                                  TextStyle(fontFamily: 'psb', fontSize: 16.5),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              _languageController.strings['shared']['messages']
                                  ['available'],
                              style: TextStyle(
                                  fontFamily: 'psr',
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 79, 168, 35)),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              Expanded(
                child: Obx(
                  () => ListView(
                    // reverse: true,

                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 20, bottom: 0),
                    controller: _listViewScrollController,
                    children: List.from(chatLines.reversed),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                    onChanged: (value) => _typedMsg.value = value,
                    controller: _textEditingController,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'psr',
                        color: Color.fromARGB(255, 0, 15, 28)),
                    cursorColor: Colors.purple,
                    scrollPadding: EdgeInsets.all(10),
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(
                            left: 20, right: 10, top: 30, bottom: 30),
                        filled: true,
                        fillColor: Color.fromARGB(255, 248, 248, 248),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(140)),
                            borderSide: BorderSide.none),
                        hintText: _languageController.strings['shared']
                            ['messages']['writeMsgPlaceholder'],
                        hintStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: 'psr',
                            color: Color.fromARGB(255, 0, 15, 28)),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              bool msgReady2Send = _textEditingController.text
                                      .replaceAll(' ', '')
                                      .length >
                                  0;
                              if (msgReady2Send) {
                                controller.sendMessage(
                                    _typedMsg.value, this.orderId!);
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
                                    gradient: _typedMsg.value.length > 0
                                        ? LinearGradient(
                                            colors: [
                                                Color.fromARGB(
                                                    255, 92, 127, 255),
                                                Color.fromARGB(
                                                    255, 172, 89, 252)
                                              ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter)
                                        : LinearGradient(colors: [
                                            Colors.grey.shade200,
                                            Colors.grey.shade200
                                          ])),
                              ),
                            ),
                          ),
                        ))),
              )
            ],
          ),
        ));
  }
}
