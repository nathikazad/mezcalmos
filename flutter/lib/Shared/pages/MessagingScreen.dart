// input: chatId
// chat between chatId = orderId  customer<->deliveryAdmin
//              chatId != orderId deliveryAdmin<->dropOffDeliveryDriver
//              chatId != orderId deliveryAdmin<->pickupDeliveryDriver

// chat: {deliveryAdminDropOffDriver: 'dsfdsf', deliveryAdminPickupDriver: 'dsfs'}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// Extends GetView<MessagingController> after Nathik implements the controller
import 'package:intl/intl.dart' as intl;
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart'
    as CloudFunctionsModels;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/agoraController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/Shared/widgets/ThreeDotsLoading.dart';
import 'package:url_launcher/url_launcher.dart';

DateTime now = DateTime.now().toLocal();
String formattedDate = intl.DateFormat('dd-MM-yyyy').format(now);
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["pages"]
    ["MessagingScreen"];

class MessagingScreen extends StatefulWidget {
  @override
  _MessagingScreenState createState() => _MessagingScreenState();
}

// TODO : REFACTORING !
class _MessagingScreenState extends State<MessagingScreen> {
  // late final String? orderLink;
  // late final OrderType? orderType;
  // late final String? orderId;
  late final int chatId;
  Sagora? sagora;
  ParticipantType recipientType = ParticipantType.Customer;
  // ParticipantType? senderType;
  String? recipientId;
  MessageController controller =
      Get.put<MessageController>(MessageController());
  bool isChatLoaded = false;
  @override
  void initState() {
    // Instanciating the Agaora controller in case the user is able to call:
    if (controller.isInAppCallFeatureAvailable()) {
      sagora = Get.find<Sagora>();
    }

    if (Get.parameters['chatId'] == null) {
      Get.snackbar("Error", "Does not have a valid chatId!");
      MezRouter.back<void>();
    }

    chatId = int.parse(Get.parameters['chatId']!);
    if (Get.parameters['recipientType'] != null) {
      recipientType =
          Get.parameters['recipientType']!.toString().toParticipantType();
    }
    controller.clearMessageNotifications(chatId: chatId);
    // mezDbgPrint("@AYROUT ===> ${Get.parameters} | orderLink ==> $orderLink");
    controller.loadChat(chatId: chatId, onValueCallBack: _fillCallBack);
    setState(() {
      isChatLoaded = true;
    });

    super.initState();
  }

  @override
  void dispose() {
    // safe dispose of the engine, only when it was instanciated.
    super.dispose();
  }

  AuthController _authController = Get.find<AuthController>();

  TextEditingController _textEditingController = new TextEditingController();
  ScrollController _listViewScrollController = new ScrollController();
  RxList<Widget> chatLines = <Widget>[].obs;

  RxString _typedMsg = "".obs;

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

  void _fillCallBack() {
    chatLines.assignAll(controller.chat.value!.messages.map(
      (Message message) {
        return singleChatComponent(
          message: message.message,
          time: intl.DateFormat('hh:mm a').format(message.timestamp.toLocal()),
          isMe: message.userId == _authController.user!.hasuraId,
          userImage: getchatImg(message),
        );
      },
    ));
    scrollDown();
  }

  String? getchatImg(Message message) {
    final Participant? messageSender = controller.chat.value?.participant
        .firstWhereOrNull(
            (Participant element) => element.id == message.userId);
    if (messageSender?.participantType == recipientType) {
      return controller.chat.value!.chatInfo.chatImg;
    } else
      return messageSender?.image;
  }

  /// Using this for now, to limit the calls only between deliveryDrivers<->Customers
  // bool isReciepientNotAdmin() {
  //   final ParticipantType? _pType =
  //       controller.recipient(recipientType: recipientType)?.participantType;
  //   return [ParticipantType.Customer, ParticipantType.DeliveryDriver]
  //       .contains(_pType);
  // }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      scrollDown(mezChatScrollDuration: timeStamp);
    });

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 249, 249),
      appBar: AppBar(
        centerTitle: true,
        leading: Center(
          child: GestureDetector(
            onTap: () => MezRouter.back<void>(closeOverlays: true),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 97, 127, 255),
                    Color.fromARGB(255, 198, 90, 252),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
        ),
        title: Obx(
          () {
            return controller.chat.value?.chatInfo.chatTite == null
                ? ThreeDotsLoading()
                : Text(
                    controller.chat.value!.chatInfo.chatTite,
                    style: Get.textTheme.headline3,
                  );
          },
        ),
        actions: <Widget>[
          Container(
            child: InkWell(
              // onTap: () async => _onCallPress(),
              onTap: () async {
                final Uri launchUri = Uri(
                  scheme: 'tel',
                  path: controller.chat.value?.chatInfo.phoneNumber,
                );
                mezDbgPrint(await canLaunchUrl(launchUri));
                if (await canLaunchUrl(launchUri)) {
                  await launchUrl(launchUri);
                } else {
                  unawaited(_onCallPress());
                  // throw 'Could not launch $launchUri';
                }
              },
              child: Container(
                width: 30,
                height: 30,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: secondaryLightBlueColor,
                ),
                child: Center(
                  child: FittedBox(
                    child: Icon(
                      Icons.call,
                      color: primaryBlueColor,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // )
        ],
      ),
      body: isChatLoaded
          ? Container(
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10.1),
                        child: Center(
                          child: Text(formattedDate),
                        ),
                      ),
                      Obx(() {
                        mezDbgPrint("Linkkkkkkkk ⏰");
                        mezDbgPrint(
                            "${controller.chat.value?.chatInfo.parentlink}");
                        if (MezRouter.isRouteInStack(
                            controller.chat.value?.chatInfo.parentlink)) {
                          return SizedBox();
                        } else {
                          return Center(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                MezRouter.toNamed<void>(
                                  controller.chat.value!.chatInfo.parentlink,
                                );
                              },
                              child: Ink(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 6),
                                  child: Text(
                                    "${_i18n()['viewOrder']}",
                                    style: Get.textTheme.bodyLarge
                                        ?.copyWith(color: primaryBlueColor),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      }),
                      Expanded(
                        child: Obx(
                          () => ListView(
                            shrinkWrap: true,
                            controller: _listViewScrollController,
                            children: List<Widget>.from(chatLines),
                          ),
                        ),
                      ),
                      SendMessageBox(
                        typedMsg: _typedMsg,
                        textEditingController: _textEditingController,
                        controller: controller,
                        chatId: chatId,
                        // orderId: orderId,
                      )
                    ],
                  ),
                ],
              ),
            )
          : MezLogoAnimation(
              centered: true,
            ),
    );
  }

  Future<void> _onCallPress() async {
    // all the none-null forcing used down below, are garanteed to work 100%
    // and will never throw a null check error/exception.
    if (await sagora!.checkAgoraPermissions()) {
      mezDbgPrint("#############----1-----######");

      // we get the one We're trying to call first.
      final SettingsController _settingsController =
          Get.find<SettingsController>();
      final CloudFunctionsModels.CallUserResponse response =
          await CloudFunctions.agora_callChatUser(
              chatId: chatId,
              callerParticipantType:
                  _settingsController.appType.toCFParticipantTypefromAppType());
      // mezDbgPrint("3 - sender name ${controller.sender()?.participantType}");

      // Request Agora auth

      mezDbgPrint("4 - agora_callChatUser response $response");

      await sagora!.handleIfInChannelAlready();

      // ignore: unawaited_futures
      sagora!
          .joinChannel(
        token: response.token,
        channelId: chatId,
        uid: _authController.hasuraUserId!,
      )
          .then((value) {
        mezDbgPrint(
            "[][][] MessageScreen :: sagora.joinChannel :: done ! ==> pushing to AgoraCall Screen !!!!");

        sagora!.callStatus.value = CallStatus.calling;
        mezDbgPrint("🤑");
        mezDbgPrint(response.image);
        Get.toNamed<void>(kAgoraCallScreen, arguments: {
          "chatId": chatId,
          "talkingTo": Participant(
              id: response.uid.toInt(),
              image: response.image!,
              name: response.name!,
              participantType: response.participantType
                  .toFirebaseFormatString()
                  .toParticipantType()),
        });
      }).onError((Object? error, StackTrace stackTrace) {
        mezDbgPrint("Error ===> $error | $stackTrace");
        sagora!.callStatus.value = CallStatus.none;
      });
    } else {
      sagora!.callStatus.value = CallStatus.none;
    }
  }

  Widget singleChatComponent({
    required String message,
    String? time,
    required bool isMe,
    // required BuildContext parentContext,
    String? userImage,
  }) =>
      Container(
        alignment: !isMe ? Alignment.centerLeft : Alignment.centerRight,
        padding: const EdgeInsets.all(5.0),
        child: Wrap(
            alignment: !isMe ? WrapAlignment.start : WrapAlignment.end,
            runAlignment: !isMe ? WrapAlignment.start : WrapAlignment.end,
            crossAxisAlignment: WrapCrossAlignment.start,
            textDirection: !isMe ? TextDirection.ltr : TextDirection.rtl,
            spacing: 10,
            clipBehavior: Clip.none,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: Colors.grey.shade200, width: 0.5)),
                child: CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage: mLoadImage(
                          url: !isMe ? userImage : _authController.user?.image,
                          assetInCaseFailed: aDefaultAvatar)
                      .image,
                ),
              ),
              Wrap(
                spacing: 5,
                direction: Axis.vertical,
                runAlignment: !isMe ? WrapAlignment.start : WrapAlignment.end,
                children: <Widget>[
                  Container(
                      constraints: BoxConstraints(
                          maxWidth: Get.width - 100, minWidth: 50),
                      padding: EdgeInsets.only(
                          left: 16, top: 8, bottom: 8, right: 16),
                      decoration: BoxDecoration(
                          color: !isMe
                              ? Color.fromRGBO(225, 228, 255, 1)
                              //? Theme.of(parentContext).primaryColorLight
                              : Color.fromRGBO(103, 121, 254, 1),
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
                      child: InkWell(
                        onLongPress: () {
                          Clipboard.setData(ClipboardData(text: message))
                              .then((_) => MezSnackbar("copied", ""));
                        },
                        child: Text(
                          message,
                          softWrap: true,
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: isMe ? Colors.white : Colors.black,
                          ),
                        ),
                      )),
                  time != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            time,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: "Nunito",
                              fontSize: 12,
                              color: Color.fromRGBO(120, 120, 120, 1),
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ]),
      );
}

class SendMessageBox extends StatelessWidget {
  const SendMessageBox({
    Key? key,
    required RxString typedMsg,
    required TextEditingController textEditingController,
    required this.controller,
    required this.chatId,
    // this.orderType,
    // this.orderId
  })  : _typedMsg = typedMsg,
        _textEditingController = textEditingController,
        super(key: key);

  final RxString _typedMsg;

  final TextEditingController _textEditingController;
  final MessageController controller;
  final int chatId;
  // final String? orderId;
  // final OrderType? orderType;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      width: double.infinity,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 7,
              child: Container(
                clipBehavior: Clip.hardEdge,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 241, 255, 1),
                  borderRadius: BorderRadius.circular(75),
                ),
                child: TextFormField(
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(14),
                    alignLabelWithHint: true,
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(120, 120, 120, 1),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Nunito',
                    ),
                    fillColor: secondaryLightBlueColor,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: _i18n()['writeMsgPlaceholder'],
                  ),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Nunito',
                  ),
                  controller: _textEditingController,
                  onChanged: (String value) {
                    _typedMsg.value = value;
                  },
                ),
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              customBorder: CircleBorder(),
              onTap: () {
                final bool msgReady2Send =
                    _textEditingController.text.replaceAll(' ', '').length > 0;
                if (msgReady2Send) {
                  controller.sendMessage(
                    message: _typedMsg.value,
                    chatId: chatId,
                    // orderId: orderId,
                    // orderType: orderType,
                  );
                  _textEditingController.clear();
                  _typedMsg.value = "";
                } else {
                  _textEditingController.clear();
                  _typedMsg.value = "";
                }
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        secondaryLightBlueColor //Color.fromRGBO(240, 241, 255, 1),
                    ),
                child: Center(
                  child: Icon(
                    Icons.near_me,
                    size: 28,
                    color: Color.fromRGBO(103, 121, 254, 1),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
