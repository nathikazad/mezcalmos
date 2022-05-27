import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class MessageButton extends StatelessWidget {
  const MessageButton(
      {Key? key,
      this.icon = Icons.textsms_rounded,
      required this.onTap,
      this.showRedDot = false})
      : super(key: key);
  final IconData icon;
  final bool showRedDot;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: CircleBorder(),
      child: Ink(
          padding: const EdgeInsets.all(8),
          child: Badge(
            badgeColor: Colors.red,
            showBadge: showRedDot,
            position: BadgePosition(top: -2, end: -3),
            child: Icon(
              icon,
              size: 25,
              color: primaryBlueColor,
            ),
          )),
    );
  }
}
