import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class MezAddButton extends StatelessWidget {
  const MezAddButton({
    Key? key,
    required this.onClick,
    this.icon = Icons.add_circle_outline_outlined,
    this.btnHeight = 65,
    this.iconSize = 25,
  }) : super(key: key);
  final Function()? onClick;
  final double iconSize;
  final double btnHeight;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.grey.shade200,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onClick,
        child: Container(
          alignment: Alignment.center,
          height: btnHeight,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Icon(
            icon,
            color: primaryBlueColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
