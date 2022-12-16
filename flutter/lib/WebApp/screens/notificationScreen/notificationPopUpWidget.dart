import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/firbaseAuthController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart' as notifs;
import 'package:get/get.dart';
import 'package:mezcalmos/WebApp/values/constants.dart';
import 'package:mezcalmos/WebApp/widgets/mezOverly.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart';

import '../../webHelpers/SetUpHelper.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ["Notifications"]["ViewNotifications"];

class NotificationPopUpWidget extends StatefulWidget {
  NotificationPopUpWidget({
    Key? key,
    this.overlayController,
  }) : super(key: key);
  OverlayController? overlayController;

  @override
  State<NotificationPopUpWidget> createState() =>
      _NotificationPopUpWidgetState();
}

class _NotificationPopUpWidgetState extends State<NotificationPopUpWidget> {
  ForegroundNotificationsController controller =
      Get.find<ForegroundNotificationsController>();
  FirbaseAuthController authController = Get.find<FirbaseAuthController>();
  final DateFormat f = new DateFormat('hh:mm a');
  final DateFormat ff = new DateFormat('MM.dd.yyyy');
  @override
  Widget build(BuildContext context) {
    mezDbgPrint("this is a length of ${controller.notifications.value.length}");

    return _buildNotifView();
  }

  Widget _buildNotifView() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Notifications",
          style: GoogleFonts.montserrat(
              fontSize: 21, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: false,
        actions: [
          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () async {
              widget.overlayController?.removeOverlay();
              await showConfirmationDialog(
                context,
                isWebVersion: true,
                title: _i18n()["alertClearNotificationTitle"],
                helperText: "",
                primaryButtonText: "${_i18n()["clear"]}",
                secondaryButtonText: "${_i18n()["no"]}",
                onYesClick: () async {
                  controller.clearAllNotification();
                  Navigator.of(context).pop();
                  //Get.back();
                },
                onNoClick: () {
                  Navigator.of(context).pop();
                },
                // onNoClick: (() {
                //  widget.overlayController. toggleOverlay(Container(
                //       height: Get.height * 0.85,
                //       width: Get.width * 0.4,
                //       child: NotificationPopUpWidget(
                //         overlayController: controller,
                //       ),
                //     ));
                // })
              );
            },
            child: Container(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                    size: 18,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Clear",
                    style: GoogleFonts.nunito(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.red),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Obx(() {
          if (controller.notifications.isNotEmpty) {
            return SingleChildScrollView(
              child: Container(
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            height: 40.h,
            width: 80.w,
            child: Image.asset(
              "assets/images/web/noNotifs.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${_i18n()["noNotifTitle"]}",
            style: Get.textTheme.bodyText1!.copyWith(fontSize: 21),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "${_i18n()["noNotifBody"]}",
              style: Get.textTheme.bodyText2!.copyWith(
                  fontSize: 16,
                  color: Color.fromRGBO(120, 120, 120, 1),
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget _buildNotification(List<notifs.Notification> notifications) {
    final DateTime dd = DateTime.now();
    final List<Widget> todayNotifsWidgets = [];
    final List<Widget> notifsWidgets = [];
    int pos = 0;
    return Column(
      children: notifications.fold<List<Widget>>(<Widget>[],
          (List<Widget> children, notifs.Notification notification) {
        if (dd.isSameDate(notification.timestamp)) {
          todayNotifsWidgets.addAll([
            _notifCard(notification, pos),
            SizedBox(
              height: 5,
            )
          ]);
        } else {
          {
            notifsWidgets.addAll([
              _notifCard(notification, pos),
              SizedBox(
                height: 5,
              )
            ]);
          }
        }

        children = todayNotifsWidgets +
            [
              if (todayNotifsWidgets.isNotEmpty && notifsWidgets.isNotEmpty)
                SizedBox(
                  height: 25,
                ),
            ] +
            notifsWidgets;
        pos++;
        return children;
      }),
    );
  }

  Widget _notifCard(notifs.Notification notification, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      color: index == 0 ? Color.fromRGBO(225, 228, 255, 0.26) : Colors.white,
      child: InkWell(
        onTap: () {
          widget.overlayController?.removeOverlay();
          QR.navigator.replaceAll(notification.linkUrl);
          // Get.offNamed(notification.linkUrl);
        },
        child: Ink(
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
                      //20
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      notification.body,
                      style: GoogleFonts.nunito(
                          fontSize: 16,
                          color: Color.fromRGBO(0, 15, 28, 1),
                          fontWeight: FontWeight.w400),
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
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 5),
                    child: (notification.imgUrl.isURL)
                        ? CircleAvatar(
                            radius: 23,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                CachedNetworkImageProvider(notification.imgUrl),
                          )
                        : CircleAvatar(
                            radius: 23,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(
                                "assets/images/web/${notification.imgUrl.split("/").last}"),
                          ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
