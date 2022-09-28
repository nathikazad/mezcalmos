import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

class AdminSettingCard extends StatelessWidget {
  const AdminSettingCard({
    Key? key,
    required this.icon,
    required this.mainText,
    required this.secondaryText,
    required this.onClick,
  }) : super(key: key);
  final IconData icon;
  final String mainText;
  final String? secondaryText;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  mainText,
                  style: Get.textTheme.bodyText1,
                ),
              ),
              (secondaryText != null)
                  ? Text(
                      secondaryText!,
                      style: Get.textTheme.bodyText1,
                    )
                  : SizedBox(),
              const SizedBox(
                width: 8,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: MezIconButton(
                  onTap: onClick,
                  icon: icon,
                  iconSize: 20,
                ),
              )
            ],
          )),
    );
  }
}
