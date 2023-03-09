import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/agoraController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class AgoraCall extends StatefulWidget {
  static Future<void> navigate(
      {required int chatId,
      required int participantId,
      required String participantImage,
      required String participantName,
      required String participantType}) {
    return MezRouter.toPath(NativeOnlyRoutes.kAgoraCallScreenRoute,
        arguments: <String, dynamic>{
          'chatId': chatId,
          'participantId': participantId,
          'participantImage': participantImage,
          'participantName': participantName,
          'participantType': participantType,
        });
  }

  @override
  State<AgoraCall> createState() => _AgoraCallState();
}

class _AgoraCallState extends State<AgoraCall> {
  final MessageController _msgController = MessageController();
  final SettingsController _settingsController = Get.find<SettingsController>();
  final Sagora _sagora = Get.find<Sagora>();
  final Participant talkingTo = Participant(
      image: MezRouter.bodyArguments?['participantImage'],
      name: MezRouter.bodyArguments?['participantImage'],
      participantType: MezRouter.bodyArguments?['participantType'].toString()
          as ParticipantType,
      id: MezRouter.bodyArguments?['participantId']);

  // final Participant? talkingTo = Get.arguments?['talkingTo'] as Participant?;
  final int chatId = MezRouter.bodyArguments?['chatId'];
  StreamSubscription? callStatusStream;

  late CallStatus callStatus;

  // used for call timing
  Timer? callTimer;
  RxInt callSeconds = 0.obs;
  int? callingRingtoneId;

  @override
  void initState() {
    setState(() {
      callStatus = _sagora.callStatus.value;
    });
    initCallTimer();
    _startCallingRingtone();
    callStatusStream = _sagora.callStatus.stream.listen((CallStatus event) {
      // in case callStatus changed to something else than [calling] for the first time , we stop playing the ringtone.
      if (event != CallStatus.calling && event != callStatus) {
        _settingsController.stopCallingRingtone(streamId: callingRingtoneId);
      }
      if ((event == CallStatus.inCall) && event != callStatus) {
        resetTimer();
        initCallTimer();
      }
      setState(() {
        callStatus = event;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    Future<void>.microtask(() {
      callStatusStream?.cancel();
      callStatusStream = null;
      callTimer?.cancel();
      callTimer = null;
      _settingsController.stopCallingRingtone(streamId: callingRingtoneId);
      // leave it with Get.find, because the _sagora instance might get disposed .
      Get.find<Sagora>().callStatus.value = CallStatus.none;
    });

    super.dispose();
  }

  void resetTimer() {
    callSeconds.value = 0;
    callTimer?.cancel();
    callTimer = null;
  }

  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

  void _startCallingRingtone() {
    // start the calling ringtone if callStatus == calling
    if (callStatus == CallStatus.calling) {
      _settingsController
          .playCallingRingtone(autoRepeat: true)
          .then((int? streamId) {
        callingRingtoneId = streamId;
      });
    }
  }

  Future<void> initCallTimer() async {
    callTimer = Timer.periodic(Duration(seconds: 1), (Timer _subTimer) {
      callSeconds.value += 1;
      mezDbgPrint('$callStatus - duration --> ${callSeconds.value}');
      if (callSeconds.value == 60 && callStatus == CallStatus.calling) {
        _sagora.callStatus.value = CallStatus.timedOut;
        _subTimer.cancel();
        resetTimer();
        _sagora.engine.leaveChannel();
        return;
      } else if (callSeconds.value >= 300) {
        // Max of 5mins call
        // endCall
        _subTimer.cancel();
        resetTimer();

        _sagora.endCall(
          chatId: chatId,
          callee: talkingTo,
        );
        _sagora.engine.leaveChannel();
        _sagora.callStatus.value = CallStatus.none;
        // MezRouter.back();
        MezSnackbar(
          "Oops",
          "You have reached max time for your call!",
          position: SnackPosition.TOP,
        );
      } else if (callStatus == CallStatus.none) {
        _subTimer.cancel();
        resetTimer();
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("TalkingTo : ${talkingTo.toString()}");
    mezDbgPrint("ChatId : $chatId");
    return WillPopScope(
      onWillPop: () async => Future<bool>.value(callStatus == CallStatus.none),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        shape: BoxShape.circle,
                        image: talkingTo.image != null
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(talkingTo.image).image,
                              )
                            : null,
                      ),
                      // child: Center(
                      //   child: FittedBox(
                      //     fit: BoxFit.cover,
                      //     child: Icon(
                      //       Icons.person,
                      //     ),
                      //   ),
                      // ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      _getCallStatusText(),
                      style: Get.textTheme.bodyText1?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    if (callStatus == CallStatus.inCall) ...[
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => Text(
                          formatTime(callSeconds.value),
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                    SizedBox(height: 10),
                    Text(
                      talkingTo.name,
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
              Positioned(
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
            ],
          ),
        ),
      ),
    );
  }

  String _getCallStatusText() {
    switch (callStatus) {
      case CallStatus.inCall:
        return 'In call with';
      case CallStatus.calling:
        return 'Calling ...';
      case CallStatus.none:
        return 'Call ended';
      case CallStatus.timedOut:
        return "No answer from";
    }
  }

  List<Widget> _getControlButtons() {
    switch (callStatus) {
      case CallStatus.calling:
        return <Widget>[
          Flexible(
            child: InkWell(
              onTap: () {
                _sagora.endCall(
                  chatId: chatId,
                  callee: talkingTo,
                );
                _sagora.engine.leaveChannel();
                // get back will dispose the view and reset the call Action back to CallAction.None
                MezRouter.back();
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
      case CallStatus.inCall:
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
                  child: Obx(
                    () => Icon(
                      !_sagora.enableSpeakerphone.value
                          ? Icons.volume_up_rounded
                          : Icons.volume_off_rounded,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: () {
                _sagora.endCall(
                  chatId: chatId,
                  callee: talkingTo,
                );
                _sagora.engine.leaveChannel();
                // get back will dispose the view and reset the call Action back to CallAction.None
                MezRouter.back();
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
                  child: Obx(
                    () => Icon(
                      _sagora.openMicrophone.value ? Icons.mic_off : Icons.mic,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          )
        ];
      case CallStatus.timedOut:
      case CallStatus.none:
        return <Widget>[
          Flexible(
            child: InkWell(
              onTap: () async {
                await _sagora.callUser(chatId: chatId, callee: talkingTo);

                // Request Agora auth
                // @Nathik this part does not work
                final dynamic _agoraAuth = (await _sagora.getAgoraToken(
                  chatId,
                  Get.find<AuthController>().user!.hasuraId.toString(),
                  talkingTo.participantType == ParticipantType.Customer
                      ? ParticipantType.DeliveryDriver
                      : ParticipantType.Customer,
                ))
                    .snapshot
                    .value;

                mezDbgPrint("4 - A_agoraAuth $_agoraAuth");

                // then we join if it's not null && it's not expired
                if (_agoraAuth != null) {
                  mezDbgPrint("AgoraAuth  :: passed validation test !");
                  // await FlutterCallkitIncoming.startCall(chatId);
                  // then join channel
                  await _sagora.handleIfInChannelAlready();
                  await _sagora.joinChannel(
                    token: _agoraAuth['token'],
                    channelId: chatId,
                    uid: _agoraAuth['uid'],
                  );
                  await initCallTimer();
                  _startCallingRingtone();
                  _sagora.callStatus.value = CallStatus.calling;
                } else {
                  _sagora.callStatus.value = CallStatus.none;
                }
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
          Flexible(
            child: InkWell(
              onTap: MezRouter.back,
              child: Container(
                padding: EdgeInsets.all(12),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                child: Center(
                  child: Icon(
                    Icons.close,
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
