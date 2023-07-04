import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class AppBarActionButton extends StatefulWidget {
  const AppBarActionButton({
    super.key,
    required this.onpress,
    required this.icon,
  });

  final Function onpress;
  final IconData icon;

  @override
  State<AppBarActionButton> createState() => _AppBarActionButtonState();
}

class _AppBarActionButtonState extends State<AppBarActionButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: () {
        widget.onpress();
      },
      child: Ink(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: secondaryLightBlueColor,
        ),
        child: Icon(
          widget.icon,
          size: 20,
          color: primaryBlueColor,
        ),
      ),
    );
  }
}
