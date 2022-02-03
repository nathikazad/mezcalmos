import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as notifs;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key,
    required this.notification,
  }) : super(key: key);

  final notifs.Notification notification;

  @override
  Widget build(BuildContext context) {
    final f = new DateFormat('hh:mm a');

    final txt = Theme.of(context).textTheme;
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Get.find<ForegroundNotificationsController>().notifications.length > 1
              ? Get.toNamed(notification.linkUrl)
              : Get.offNamed(notification.linkUrl);
        },
        child: Ink(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  (notification.imgUrl.isURL)
                      ? CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              CachedNetworkImageProvider(notification.imgUrl),
                        )
                      : CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(notification.imgUrl),
                        ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification.title,
                          style: txt.bodyText1,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          notification.body,
                          style: txt.bodyText2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 0.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Ionicons.time_outline,
                    size: 14.sp,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${f.format(notification.timestamp.toLocal())}",
                    style: txt.subtitle1,
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14.sp,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
