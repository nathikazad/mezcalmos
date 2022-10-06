import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class MessageButton extends StatelessWidget {
  const MessageButton({
    Key? key,
    this.icon = Icons.textsms_rounded,
    required this.onTap,
    this.showRedDot = false,
    this.withPadding = true,
  }) : super(key: key);
  final IconData icon;
  final bool showRedDot;
  final void Function()? onTap;
  final bool withPadding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: CircleBorder(),
      child: Ink(
          padding: withPadding ? const EdgeInsets.all(8) : null,
          child: Badge(
            badgeColor: Colors.red,
            showBadge: showRedDot,
            position: BadgePosition(top: 0, end: 0),
            child: Icon(
              icon,
              size: 30,
              color: primaryBlueColor,
            ),
          )),
    );
  }
}
