import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as MezNotification;
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:soundpool/soundpool.dart';
import 'package:intl/intl.dart';

class FBTaxiNotificationsController extends FBNotificationsController
    with MezDisposable {
  @override
  void onInit() {
    super.onInit();

    if (authController.user != null) {
      (databaseHelper.firebaseDatabase
          .reference()
          .child(notificationsNode(authController.user!.uid))
          .onValue
          .listen((event) async {
        notifications.clear();
        if (event.snapshot.value != null) {
          mezDbgPrint(
              "=========> FBNotificationController :: onInit :: Listener :: Invoked --> \n");
          mezDbgPrint("New notif : ${event.snapshot.value}");
          event.snapshot.value.forEach((dynamic key, dynamic value) async {
            MezNotification.Notification _notif =
                MezNotification.Notification.fromJson(key, value);

            // this is to not invoke callbacks of newMessage when type == order
            // THIS EVENT HANDLER IS FOR TAXI APP, please move to notification controller of taxi app
            // and make it register a callback to here which gets called on new message
            if (_notif.notificationType == "newMessage") {
              mezDbgPrint("\n\n\n ${_notif.toJson()} \n\n\n");
              // taxiAuthListenerCallbacks.forEach((callback) {
              // this is much more dynamic :D
              if (Get.currentRoute != kMessagesRoute &&
                  Get.find<TaxiAuthController>().taxiState?.currentOrder !=
                      null) {
                Soundpool pool = Soundpool.fromOptions(
                    options:
                        SoundpoolOptions(streamType: StreamType.notification));

                int soundId = await rootBundle
                    .load("assets/sounds/newMsgNotif.wav")
                    .then((ByteData soundData) {
                  return pool.load(soundData);
                });
                int streamId = await pool.play(soundId);
                mezDbgPrint("Sound played =======> $streamId");
                DateTime timestamp =
                    DateTime.parse(_notif.variableParams['time']);
                String formattedTime =
                    DateFormat('HH:mm').format(timestamp).toString();
                notificationSnackBar(
                    _notif.variableParams['sender']['image'],
                    _notif.variableParams['sender']['name'],
                    _notif.variableParams['message'],
                    formattedTime, () async {
                  await this.setAllMessagesAsReadInDb();

                  Get.toNamed(kMessagesRoute, arguments: <String, dynamic>{
                    "oId": _notif.variableParams["orderId"],
                    "rImg": _notif.variableParams["sender"]["image"],
                    "rName": _notif.variableParams["sender"]["name"]
                  })?.then((_) => this.clearAllMessageNotification());
                }, isLink: true);

                // mezcalmosSnackBar(
                //     "${lang.strings['shared']['messages']['newMessage']} ${_notif.variableParams['sender']['name']}",
                //     "${_notif.variableParams['message']}",
                //     position: SnackPosition.TOP);
                hasNewNotification = true;
              }
              // if (_notif.notificationType == callback["type"] &&
              //     _notif.variableParams["orderId"] == callback["orderId"]) {
              //   callback["__call__"](_notif);
              //   // this is our actuall callback
              // }
              // });
            }
            notifications.add(_notif);

            mezDbgPrint(notifications.toJson());
          });
        }
      })).canceledBy(this);
    }
  }

  @override
  void onClose() {
    cancelSubscriptions();
    // if (taxiAuthListener != null) {
    //   taxiAuthListener!
    //       .cancel()
    //       .then((value) => mezDbgPrint(
    //           "A listener was disposed on currentOrderController::detachListeners !"))
    //       .catchError((err) => mezDbgPrint(
    //           "Error happend while trying to dispose currentOrderController::detachListeners !"));
    // }
    super.onClose();
  }

  @override
  Future<void> setAllMessagesAsReadInDb() async {
    // for now i', just removing all notifications to test.

    await databaseHelper.firebaseDatabase
        .reference()
        .child(notificationsNode(authController.user!.uid))
        .remove();
  }
}
