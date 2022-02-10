import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';

class ClearNotificationButton extends StatelessWidget {
  ClearNotificationButton({
    Key? key,
  }) : super(key: key);

  final ForegroundNotificationsController controller =
      Get.find<ForegroundNotificationsController>();
  final LanguageController lang = Get.find<LanguageController>();
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
                  i18n.strings["shared"]["notification"]["latest"],
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              IconButton(
                  iconSize: 20,
                  onPressed: () async {
                    YesNoDialogButton yesNoRes = await cancelAlertDialog(
                        title: i18n.strings["shared"]["notification"]
                            ["alertClearNotification"]["title"],
                        body: i18n.strings["shared"]["notification"]
                            ["alertClearNotification"]["title"],
                        icon: Container(
                          child: Icon(
                            Icons.highlight_off,
                            size: 65,
                            color: Color(0xffdb2846),
                          ),
                        ));

                    if (yesNoRes == YesNoDialogButton.Yes) {
                      controller.clearAllNotification();
                      Get.back();
                    }
                  },
                  icon: Icon(
                    Ionicons.trash_outline,
                  )),
            ],
          )));
  }
}
