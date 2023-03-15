import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:sizer/sizer.dart';

class MessageButton extends StatelessWidget {
  const MessageButton({
    Key? key,
    this.icon = Icons.textsms_rounded,
    required this.chatId,
    required this.onTap,
    this.withPadding = true,
  }) : super(key: key);
  final IconData icon;
  final int chatId;
  final void Function()? onTap;
  final bool withPadding;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: onTap,
        customBorder: CircleBorder(),
        child: Ink(
            padding: withPadding ? const EdgeInsets.all(8) : null,
            child: badge.Badge(
              badgeColor: Colors.red,
              showBadge: Get.find<ForegroundNotificationsController>()
                  .hasNewMessageNotification(chatId),
              position: badge.BadgePosition(top: 0, end: 0),
              child: Icon(
                icon,
                size: 24.sp,
                color: primaryBlueColor,
              ),
            )),
      ),
    );
  }
}
