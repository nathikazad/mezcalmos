import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class CustIconButton extends StatelessWidget {
  const CustIconButton({
    super.key,
    required this.onPressed,
    required this.isEnabled,
    required this.icon,
  });

  final void Function() onPressed;
  final bool isEnabled;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: !isEnabled
          ? null
          : () {
              onPressed();
            },
      icon: CircleAvatar(
        radius: 16,
        backgroundColor: isEnabled ? Color(0xFFE1E4FF) : Color(0xFFEBEBEB),
        child: Icon(
          icon,
          size: 18,
          color: isEnabled ? primaryBlueColor : Color(0xFFC4C4C4),
        ),
      ),
    );
  }
}
