import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/Shared/widgets/DateTitleComponent.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/fbNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as notifs;
import 'package:intl/intl.dart';

final f = new DateFormat('hh:mm a');
final ff = new DateFormat('MM.dd.yyyy');

class ViewNotifications extends StatefulWidget {
  ViewNotifications({Key? key}) : super(key: key);

  @override
  _ViewNotificationsState createState() => _ViewNotificationsState();
}

class _ViewNotificationsState extends State<ViewNotifications> {
  // RxList<notifs.Notification> currentNotifs = RxList.empty();
  FBNotificationsController controller = Get.find<FBNotificationsController>();
  LanguageController lang = Get.find<LanguageController>();
  AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    mezDbgPrint("ListOfNotifs : onInit");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint(
        "build function building the list ${controller.notifications.value.length}");
    controller.notifications.value.forEach((element) {
      mezDbgPrint(element.notificationType);
    });

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar(
        "back",
        () => Get.back(),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            width: Get.width,
            child: Text(lang.strings['shared']['notification']['title'],
                style: GoogleFonts.dmSans(
                  textStyle: TextStyle(
                      color: const Color(0xfd1d1d1d),
                      fontWeight: FontWeight.w500,
                      fontFamily: "ProductSans",
                      fontStyle: FontStyle.normal,
                      fontSize: 40.0),
                ),
                textAlign: TextAlign.left),
          ),
          SizedBox(
            height: Get.height * 0.015,
          ),
          Expanded(
              child: Container(
            child: SingleChildScrollView(
              child: Obx(
              () => _buildNotification(controller.notifications()),
            )
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildNotification(List<notifs.Notification> notifications) {
    var dd = DateTime.now();
    List<Widget> myWidgets = [];
    return Column(
      children: notifications.fold<List<Widget>>(<Widget>[],
          (children, notification) {
        mezDbgPrint(
            "this is from the the list of notifications ${notification.notificationType}");
        if (dd.isSameDate(notification.timestamp)) {
          myWidgets.addAll([
            _checkTheNotifsTypeAndReturnWidget(notification),
            SizedBox(
              height: 10,
            )
          ]);
        } else {
          dd = notification.timestamp;
          myWidgets.add(DateTitleComponent(
            date: "${ff.format(dd)}",
            dateIcon: FaIcon(
              FontAwesomeIcons.calendarAlt,
              size: 12,
            ),
          ));
          if (dd.isSameDate(notification.timestamp)) {
            myWidgets.addAll([
              _checkTheNotifsTypeAndReturnWidget(notification),
              SizedBox(
                height: 10,
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

Widget _checkTheNotifsTypeAndReturnWidget(notifs.Notification notification) {
  return NotificationComponent(
    notification: notification,
  );
}

class NotificationComponent extends StatelessWidget {
  final notifs.Notification notification;
  NotificationComponent({required this.notification, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(notification.linkUrl),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: Get.width,
        height: 63,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: const Color(0xffececec), width: 0.5),
          color: const Color(0xffffffff),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 31,
              width: 31,
              child: ClipOval(
                child: Container(
                    width: 31,
                    height: 31,
                    child: Center(
                        child: notification.imgUrl.startsWith("http")
                            ? Image.network(
                                notification.imgUrl,
                                fit: BoxFit.cover,
                height: 50,
                                width: 10,
                              )
                            : Image.asset(notification.imgUrl))),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                          child: Text("${notification.title}",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: const Color(0xff000f1c),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "ProductSans",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13.0),
                              textAlign: TextAlign.left),
                        )),
                        Container(
                          child: Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.query_builder,
                                  size: 12,
                                  color: Color(0xff000f1c),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${f.format(notification.timestamp)}",
                                  style: TextStyle(
                                      color: const Color(0xff000f1c),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "ProductSans",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10.0),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text("${notification.body}",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: const Color(0xff000f1c),
                          fontWeight: FontWeight.w400,
                          fontFamily: "ProductSans",
                          fontStyle: FontStyle.normal,
                          fontSize: 12.0),
                      textAlign: TextAlign.left)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
