import 'dart:async';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart'
    as CloudFunctionsModels;
import 'package:mezcalmos/Shared/controllers/agoraController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/env.dart';

DateTime now = DateTime.now().toLocal();
String formattedDate = intl.DateFormat('dd-MM-yyyy').format(now);
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["pages"]
    ["MessagingScreen"];

class NativeMessagingScreen extends BaseMessagingScreen {
  @override
  MessagingScreenStateForApps createState() => MessagingScreenStateForApps();
}

class MessagingScreenStateForApps extends BaseMessagingScreenState {
  Sagora? sagora;

  @override
  void initState() {
    super.initState();
    // Instanciating the Agaora controller in case the user is able to call:
    if (controller.isInAppCallFeatureAvailable()) {
      sagora = Get.find<Sagora>();
    }
  }

  Future<void> agoraCallPress() async {
    // all the none-null forcing used down below, are garanteed to work 100%
    // and will never throw a null check error/exception.
    if (await sagora!.checkAgoraPermissions()) {
      mezDbgPrint("#############----1-----######");

      // we get the one We're trying to call first.
      final SettingsController _settingsController =
          Get.find<SettingsController>();
      CloudFunctionsModels.CallUserResponse response =
          await CloudFunctions.agora_callChatUser(
              chatId: chatId,
              callerParticipantType:
                  MezEnv.appType.toCFParticipantTypefromAppType());
      // mezDbgPrint("3 - sender name ${controller.sender()?.participantType}");

      // Request Agora auth

      mezDbgPrint("4 - agora_callChatUser response $response");

      await sagora!.handleIfInChannelAlready();

      // ignore: unawaited_futures
      sagora!
          .joinChannel(
        token: response.token,
        channelId: chatId,
        uid: Get.find<AuthController>().hasuraUserId!,
      )
          .then((value) {
        mezDbgPrint(
            "[][][] MessageScreen :: sagora.joinChannel :: done ! ==> pushing to AgoraCall Screen !!!!");

        sagora!.callStatus.value = CallStatus.calling;
        Get.toNamed<void>(NativeOnlyRoutes.kAgoraCallScreen, arguments: {
          "chatId": chatId,
          "talkingTo": Participant(
              id: response.uid.toInt(),
              image: response.image!,
              name: response.name!,
              participantType:
                  response.participantType.toString().toParticipantType()),
        });
      }).onError((Object? error, StackTrace stackTrace) {
        mezDbgPrint("Error ===> $error | $stackTrace");
        sagora!.callStatus.value = CallStatus.none;
      });
    } else {
      sagora!.callStatus.value = CallStatus.none;
    }
  }

  @override
  void callAgora() {
    unawaited(agoraCallPress());
  }
}
