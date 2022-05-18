import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as notifs;
import 'package:sizer/sizer.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key,
    required this.notification,
  }) : super(key: key);

  final notifs.Notification notification;

  @override
  Widget build(BuildContext context) {
    final DateFormat f = new DateFormat('hh:mm a');

    final TextTheme txt = Theme.of(context).textTheme;
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Get.offNamed(notification.linkUrl);
        },
        child: Ink(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title,
                      style: txt.bodyText1!.copyWith(fontSize: 12.8.sp),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      notification.body,
                      style: txt.bodyText2!.copyWith(fontSize: 11.sp),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                      "${DateFormat("hh:mm a").format(notification.timestamp)}"),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
