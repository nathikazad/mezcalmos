import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';

// Extends GetView<MessagingController> after Nathik implements the controller
class MessagingScreen extends StatelessWidget {
  TextEditingController _textEditingController = new TextEditingController();
  ScrollController _listViewScrollController = new ScrollController();

  RxString _typedMsg = "".obs;

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 1),
      () => _listViewScrollController.animateTo(
          _listViewScrollController.position.maxScrollExtent,
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn),
    );

    Widget SingleChatComponent(
      String message,
      String time, {
      bool isMe = true,
      String? userImage,
    }) =>
        Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 30),
          child: Stack(
              alignment: isMe ? Alignment.topLeft : Alignment.topRight,
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
                    backgroundImage: userImage == null
                        ? AssetImage(aDefaultAvatar) as ImageProvider
                        : NetworkImage(userImage),
                  ),
                ),
                // SizedBox(
                //   width: 50,
                // ),
                Positioned(
                  left: isMe ? 65 : 0,
                  right: isMe ? 0 : 65,
                  top: 0,
                  child: Wrap(
                    spacing: 10,
                    direction: Axis.vertical,
                    // alignment: WrapAlignment.spaceEvenly,
                    runAlignment:
                        isMe ? WrapAlignment.start : WrapAlignment.end,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      Container(
                          constraints: BoxConstraints(maxWidth: 170),
                          padding: isMe
                              ? EdgeInsets.all(15)
                              : EdgeInsets.only(
                                  left: 25, top: 16, bottom: 16, right: 15),
                          // width: Get.width / 2,
                          decoration: BoxDecoration(
                              gradient: isMe
                                  ? LinearGradient(colors: [
                                      Color.fromARGB(255, 248, 248, 248),
                                      Color.fromARGB(255, 248, 248, 248)
                                    ])
                                  : LinearGradient(colors: [
                                      Color.fromARGB(255, 92, 127, 255),
                                      Color.fromARGB(255, 172, 89, 252)
                                    ]),
                              borderRadius: isMe
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
                            style: TextStyle(
                                fontFamily: 'psr',
                                fontSize: 12,
                                color: isMe
                                    ? Color.fromARGB(255, 0, 15, 28)
                                    : Colors.white),
                          )),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          (isMe ? 'Seen In' : 'Sent In') + '    $time',
                          style: TextStyle(
                              fontFamily: 'psr',
                              fontSize: 10,
                              color: Color.fromARGB(255, 0, 15, 28)),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
        );

    return Scaffold(
        backgroundColor: Colors.white,
        appBar:
            MezcalmosSharedWidgets.mezcalmosAppBar("back", () => Get.back()),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, bottom: 25, top: 10),
                child: Text(
                  'Message',
                  style: TextStyle(fontFamily: 'psr', fontSize: 50),
                ),
              ),
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
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage: NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/users%2F8o66cnaUMyYpXu9vwT3eKHE5Bfh2%2Favatar%2F16229101458719088018037554647166.jpg?alt=media&token=77b5b27c-848f-4630-bfbb-fa67da494be5'),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jorge Doe',
                            style: TextStyle(fontFamily: 'psb', fontSize: 16.5),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Available',
                            style: TextStyle(
                                fontFamily: 'psr',
                                fontSize: 13,
                                color: Color.fromARGB(255, 79, 168, 35)),
                          ),
                        ],
                      )
                    ],
                  )),
              Expanded(
                child: ListView(
                    padding: EdgeInsets.only(top: 20, bottom: 50),
                    shrinkWrap: true,
                    controller: _listViewScrollController,
                    children: [
                      SingleChatComponent('I am on the way.', '18:06',
                          userImage:
                              'https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/users%2F6l5S9qNSrMSIkwZRcchUaP8bJsk2%2Favatar%2FScreenshot_20210601-135100_Facebook.jpg?alt=media&token=d27eafc0-0b97-47fc-b420-51543403d6f8'),
                      SingleChatComponent(
                          'I am outside but i cant find your house', '18:06',
                          userImage:
                              'https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/users%2F6l5S9qNSrMSIkwZRcchUaP8bJsk2%2Favatar%2FScreenshot_20210601-135100_Facebook.jpg?alt=media&token=d27eafc0-0b97-47fc-b420-51543403d6f8'),
                      SingleChatComponent('I am comming...', '18:07',
                          userImage:
                              'https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/users%2F8o66cnaUMyYpXu9vwT3eKHE5Bfh2%2Favatar%2F16229101458719088018037554647166.jpg?alt=media&token=77b5b27c-848f-4630-bfbb-fa67da494be5',
                          isMe: false),
                      SingleChatComponent(
                          'I can not see you man , where are exactly at ?',
                          '18:07',
                          userImage:
                              'https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/users%2F8o66cnaUMyYpXu9vwT3eKHE5Bfh2%2Favatar%2F16229101458719088018037554647166.jpg?alt=media&token=77b5b27c-848f-4630-bfbb-fa67da494be5',
                          isMe: false),
                      SingleChatComponent(
                          'Are you drunk or something ? Check the Map on your phone please ... you are just wasting mytime ..',
                          '18:06',
                          userImage:
                              'https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/users%2F6l5S9qNSrMSIkwZRcchUaP8bJsk2%2Favatar%2FScreenshot_20210601-135100_Facebook.jpg?alt=media&token=d27eafc0-0b97-47fc-b420-51543403d6f8'),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
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
                        hintText: 'Write Your Message Here...',
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
                                mezcalmosSnackBar('Notice ~',
                                    'Not yet implemented , comming soon when controller is up !');
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
