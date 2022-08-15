import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/Agora/agoraController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/widgets/ThreeDotsLoading.dart';

class AgoraCall extends StatefulWidget {
  @override
  State<AgoraCall> createState() => _AgoraCallState();
}

class _AgoraCallState extends State<AgoraCall> {
  final MessageController _msgController = MessageController();
  final Sagora _sagora = Get.find<Sagora>();
  final Participant? talkingTo = Get.arguments?['talkingTo'] as Participant?;
  final String chatId = Get.arguments?['chatId'];

  @override
  void dispose() {
    _sagora.callAction = CallAction.none;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("TalkingTo : ${talkingTo.toString()}");
    mezDbgPrint("ChatId : $chatId");
    return WillPopScope(
      onWillPop: () async => Future<bool>.value(false),
      child: Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          color: Colors.black,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 140,
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          shape: BoxShape.circle,
                          image: talkingTo?.image != null
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.network(talkingTo!.image).image,
                                )
                              : null,
                        ),
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Icon(
                              Icons.person,
                            ),
                          ),
                        ),
                      ),
                      if (_sagora.callAction == CallAction.calling) ...[
                        SizedBox(height: 20),
                        Text(
                          _getCallStatusText(),
                          style: Get.textTheme.bodyText1?.copyWith(
                            color: Colors.white,
                          ),
                        )
                      ],
                      SizedBox(height: 10),
                      Text(
                        talkingTo?.name ?? "_",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => Positioned(
                  bottom: 100,
                  child: Container(
                    width: Get.width,
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: _getControlButtons(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String _getCallStatusText() {
    switch (_sagora.callAction) {
      case CallAction.accepted:
        return 'in call with';
      case CallAction.calling:
        return 'calling ...';
      case CallAction.declined:
        return 'call declined :(';
      case CallAction.ended:
        return 'call ended';
      default:
        return '';
    }
  }

  List<Widget> _getControlButtons() {
    switch (_sagora.callAction) {
      case CallAction.none:
        return [];
      case CallAction.calling:
        return <Widget>[
          Flexible(
            child: InkWell(
              onTap: () {
                _msgController.endCall(
                  chatId: chatId,
                  callee: talkingTo!,
                );
                _sagora.engine.leaveChannel();
                // get back will dispose the view and reset the call Action back to CallAction.None
                Get.back<void>();
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                child: Center(
                  child: Icon(
                    Icons.call_end,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ];
      case CallAction.accepted:
        return <Widget>[
          Flexible(
            child: InkWell(
              onTap: _sagora.switchSpeakerphone,
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(.8),
                ),
                child: Center(
                  child: Icon(
                    _sagora.enableSpeakerphone.value
                        ? Icons.stop
                        : Icons.speaker,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: () {
                _msgController.endCall(
                  chatId: chatId,
                  callee: talkingTo!,
                );
                _sagora.engine.leaveChannel();
                // get back will dispose the view and reset the call Action back to CallAction.None
                Get.back<void>();
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                child: Center(
                  child: Icon(
                    Icons.call_end,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: _sagora.switchMicrophone,
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(.8),
                ),
                child: Center(
                  child: Icon(
                    _sagora.openMicrophone.value
                        ? Icons.volume_off_rounded
                        : Icons.volume_up_rounded,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )
        ];
      case CallAction.declined:
      case CallAction.ended:
        return <Widget>[
          Flexible(
            child: InkWell(
              onTap: () {
                _msgController.callUser(
                  chatId: chatId,
                  callee: talkingTo!,
                );
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                child: Center(
                  child: Icon(
                    Icons.call,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ];
    }
  }
}
