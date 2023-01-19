import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["OrderScheduledTimeCard"];
//

class OrderScheduledTimeCard extends StatelessWidget {
  const OrderScheduledTimeCard(
      {super.key, required this.time, this.margin, this.titleTextStyle});
  final DateTime? time;
  final EdgeInsets? margin;
  final TextStyle? titleTextStyle;

  @override
  Widget build(BuildContext context) {
    if (time != null) {
      return Container(
        margin: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${_i18n()["title"]}',
              style: titleTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              margin: EdgeInsets.zero,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Row(
                  children: [
                    Icon(
                      Icons.schedule_rounded,
                      color: Colors.black,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        time!.getOrderTime(),
                        style: Get.textTheme.bodyText1,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    } else
      return SizedBox();
  }
}
