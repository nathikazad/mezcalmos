import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart' as notifs;
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
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
    mezDbgPrint(
        "ListOfNotifs : onInit ====>${controller.notifications.length}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Obx(
      () => Scaffold(
        appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
            onClick: MezRouter.back, title: _i18n()['title']),
        body: Obx(() {
          if (controller.notifications.isNotEmpty) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Obx(() => _buildNotification(
                        controller.notifications.reversed.toList()))
                  ],
                ),
              ),
            );
          } else {
            return noNotifsComponent();
          }
        }),
      ),
    );
  }

  Widget noNotifsComponent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          alignment: Alignment.center,
          height: 30.h,
          width: 50.w,
          child: Image.asset(
            "assets/images/shared/noNotifs.png",
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "${_i18n()["noNotifTitle"]}",
          style: Get.textTheme.bodyText1,
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "${_i18n()["noNotifBody"]}",
            style: Get.textTheme.bodyText2,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }

  Widget _buildNotification(List<notifs.Notification> notifications) {
    int indexNotification = 0;
    return GroupedListView<notifs.Notification, DateTime>(
      shrinkWrap: true,
      elements: notifications,
      padding: EdgeInsets.zero,
      groupBy: (notifs.Notification element) => DateTime(element.timestamp.year,
          element.timestamp.month, element.timestamp.day),
      groupComparator: (DateTime value1, DateTime value2) =>
          value2.compareTo(value1),
      itemComparator:
          (notifs.Notification element1, notifs.Notification element2) =>
              element2.timestamp.compareTo(element1.timestamp),
      physics: NeverScrollableScrollPhysics(),
      groupHeaderBuilder: (notifs.Notification element) {
        indexNotification++;
        mezDbgPrint(indexNotification);
        return Container(
          margin: EdgeInsets.only(top: 10, left: 8, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                (element.timestamp.isToday)
                    ? _i18n()["today"]
                    : (element.timestamp.isYesterday)
                        ? _i18n()['yesterday']
                        : DateFormat('dd MMM, h:mm a')
                            .format(element.timestamp),
                style: Theme.of(context).textTheme.headline3,
              ),
              indexNotification == 1 ? _deleteButton() : SizedBox()
            ],
          ),
        );
      },
      separator: SizedBox(
        height: 5,
      ),
      itemBuilder: (BuildContext context, notifs.Notification element) {
        return _notifCard(element);
      },
    );
  }

  Widget _notifCard(notifs.Notification notification) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          MezRouter.offNamed(notification.linkUrl);
        },
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title,
                      style: Get.textTheme.bodyText1!,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      notification.body,
                      style: Get.textTheme.subtitle1?.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${DateFormat("hh:mm a").format(notification.timestamp.toLocal())}",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 5),
                    child: (notification.notifWidget != null)
                        ? notification.notifWidget
                        : (notification.imgUrl!.isURL)
                            ? CircleAvatar(
                                radius: 23,
                                backgroundColor: Colors.transparent,
                                backgroundImage: CachedNetworkImageProvider(
                                    notification.imgUrl!),
                              )
                            : CircleAvatar(
                                radius: 23,
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    AssetImage(notification.imgUrl!),
                              ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _deleteButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
          customBorder: CircleBorder(),
          onTap: () async {
            await showConfirmationDialog(context,
                title: _i18n()["alertClearNotificationTitle"],
                helperText: "",
                primaryButtonText: "${_i18n()["clear"]}",
                secondaryButtonText: "${_i18n()["no"]}", onYesClick: () async {
              controller.clearAllNotification();
              MezRouter.back();
            });
          },
          child: Ink(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.delete_outline_rounded,
                color: Colors.black,
              ),
            ),
          )),
    );
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
