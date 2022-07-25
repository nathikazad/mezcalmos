import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/Agora/agoraController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';

class AgoraCall extends StatelessWidget {
  final MessageController _msgController = MessageController();
  final Sagora _sagora = Get.find<Sagora>();

  final Participant? talkingTo = Get.arguments?['talkingTo'] as Participant?;
  final String chatId = Get.arguments?['chatId'];

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("TalkingTo : ${talkingTo.toString()}");
    mezDbgPrint("ChatId : $chatId");
    return Scaffold(
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
                  SizedBox(height: 20),
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
            Positioned(
              bottom: 100,
              child: Container(
                width: Get.width,
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => Flexible(
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
                    ),
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          _msgController.endCall(
                            chatId: chatId,
                            callee: talkingTo!,
                          );
                          // await FlutterCallkitIncoming.endCall(
                          //     {'chatId': chatId});
                          _sagora.engine.leaveChannel();
                          // await _sagora.removeSession(chatId: chatId);
                          Get.back<void>();
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
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
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.8),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.volume_off_rounded,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
