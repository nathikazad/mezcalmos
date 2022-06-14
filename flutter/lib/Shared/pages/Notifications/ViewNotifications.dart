import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as notifs;
import 'package:mezcalmos/Shared/pages/Notifications/components/NotificationCard.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ["Notifications"]["ViewNotifications"];

class ViewNotifications extends StatefulWidget {
  const ViewNotifications({Key? key}) : super(key: key);

  @override
  _ViewNotificationsState createState() => _ViewNotificationsState();
}

class _ViewNotificationsState extends State<ViewNotifications> {
  ForegroundNotificationsController controller =
      Get.find<ForegroundNotificationsController>();
  AuthController authController = Get.find<AuthController>();
  final DateFormat f = new DateFormat('hh:mm a');
  final DateFormat ff = new DateFormat('MM.dd.yyyy');

  @override
  void initState() {
    mezDbgPrint("ListOfNotifs : onInit");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: Get.back, title: _i18n()['title']),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              _notifsHeader(),
              Obx(() => _buildNotification(
                  controller.notifications.reversed.toList()))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotification(List<notifs.Notification> notifications) {
    final DateTime dd = DateTime.now();
    final List<Widget> todayNotifsWidgets = [];
    final List<Widget> notifsWidgets = [];
    return Column(
      children: notifications.fold<List<Widget>>(<Widget>[],
          (List<Widget> children, notifs.Notification notification) {
        if (dd.isSameDate(notification.timestamp)) {
          todayNotifsWidgets.addAll([
            NotificationCard(
              notification: notification,
            ),
            SizedBox(
              height: 5,
            )
          ]);
        } else {
          {
            notifsWidgets.addAll([
              NotificationCard(
                notification: notification,
              ),
              SizedBox(
                height: 5,
              )
            ]);
          }
        }

        children = todayNotifsWidgets +
            // [
            //   if (todayNotifsWidgets.isNotEmpty && notifsWidgets.isNotEmpty)
            //     Divider()
            // ] +
            notifsWidgets;
        return children;
      }),
    );
  }

  Widget _notifsHeader() {
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
                  _isTodayNotifsExist() ? _i18n()["today"] : "",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              IconButton(
                  iconSize: 20,
                  onPressed: () async {
                    await showConfirmationDialog(context,
                        title: _i18n()["alertClearNotificationTitle"],
                        helperText: "",
                        primaryButtonText: "${_i18n()["clear"]}",
                        secondaryButtonText: "${_i18n()["no"]}",
                        onYesClick: () async {
                      controller.clearAllNotification();
                      Get.back();
                    });
                  },
                  icon: Icon(
                    Icons.delete,
                  )),
            ],
          )));
  }

  bool _isTodayNotifsExist() {
    final DateTime dd = DateTime.now();
    final List<notifs.Notification> todaynotifs = controller.notifications
        .where((notifs.Notification notif) => dd.isSameDate(notif.timestamp))
        .toList();
    if (todaynotifs.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
