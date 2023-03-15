import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';

class MezAddButton extends StatelessWidget {
  const MezAddButton({
    Key? key,
    required this.onClick,
    this.title,
    this.icon = Icons.add_circle_outline_outlined,
    this.btnColor = secondaryLightBlueColor,
    this.primaryColor = primaryBlueColor,
    this.btnHeight = 65,
    this.iconSize = 25,
  }) : super(key: key);
  final Function()? onClick;
  final double iconSize;
  final double btnHeight;
  final IconData icon;
  final String? title;
  final Color? btnColor;
  final Color? primaryColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: btnColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onClick,
        child: Container(
          alignment: Alignment.center,
          height: btnHeight,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: primaryColor,
                size: iconSize,
              ),
              if (title != null)
                Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    title!,
                    style: context.txt.bodyText1?.copyWith(color: primaryColor),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
