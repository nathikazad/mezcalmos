import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as notifs;
import 'package:mezcalmos/Shared/pages/Notifications/components/ClearNotificationButton.dart';
import 'package:mezcalmos/Shared/pages/Notifications/components/NotificationCard.dart';
import 'package:mezcalmos/Shared/widgets/DateTitleComponent.dart';
import 'package:sizer/sizer.dart';

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
      appBar: AppBar(
        title: Text(_i18n()['title']),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              ClearNotificationButton(),
              Obx(() => _buildNotification(
                  controller.notifications.reversed.toList()))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotification(List<notifs.Notification> notifications) {
    DateTime dd = DateTime.now();
    final List<Widget> myWidgets = [];
    return Column(
      children: notifications.fold<List<Widget>>(<Widget>[],
          (List<Widget> children, notifs.Notification notification) {
        if (dd.isSameDate(notification.timestamp)) {
          myWidgets.addAll([
            NotificationCard(
              notification: notification,
            ),
            SizedBox(
              height: 5,
            )
          ]);
        } else {
          dd = notification.timestamp;
          myWidgets.add(DateTitleComponent(
            date: "${ff.format(dd.toLocal())}",
            dateIcon: FaIcon(
              FontAwesomeIcons.calendarAlt,
              size: 13.sp,
            ),
          ));
          if (dd.isSameDate(notification.timestamp)) {
            myWidgets.addAll([
              NotificationCard(
                notification: notification,
              ),
              SizedBox(
                height: 5,
              )
            ]);
          }
        }

        children = myWidgets;
        return children;
      }),
    );
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
