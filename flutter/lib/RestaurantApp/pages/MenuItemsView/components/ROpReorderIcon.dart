import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class ROpRerorderIcon extends StatelessWidget {
  const ROpRerorderIcon({Key? key, this.onTap}) : super(key: key);
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: secondaryLightBlueColor),
        child: Icon(
          Icons.vertical_distribute_rounded,
          size: 20,
          color: primaryBlueColor,
        ),
      ),
    );
  }
}
