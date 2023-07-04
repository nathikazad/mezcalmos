import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ["Notifications"]["components"]["ClearNotificationButton"];

class ClearNotificationButton extends StatelessWidget {
  ClearNotificationButton({
    Key? key,
  }) : super(key: key);

  final ForegroundNotificationsController controller =
      Get.find<ForegroundNotificationsController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => (controller.notifications.length <= 0)
        ? Container()
        : Container(
            // padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  _i18n()["today"],
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              IconButton(
                  iconSize: 20,
                  onPressed: () async {
                    final YesNoDialogButton yesNoRes = await cancelAlertDialog(
                        title: _i18n()["alertClearNotificationTitle"],
                        body: _i18n()["alertClearNotificationTitle"],
                        icon: Container(
                          child: Icon(
                            Icons.highlight_off,
                            size: 65,
                            color: Color(0xffdb2846),
                          ),
                        ));

                    if (yesNoRes == YesNoDialogButton.Yes) {
                      controller.clearAllNotification();
                      MezRouter.back();
                    }
                  },
                  icon: Icon(
                    Ionicons.trash_outline,
                  )),
            ],
          )));
  }
}
