import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["OrderDeliveryLocation"];
//

class OrderDeliveryLocation extends StatelessWidget {
  const OrderDeliveryLocation(
      {super.key,
      this.title,
      required this.address,
      this.margin,
      this.titleTextStyle});
  final String address;
  final String? title;
  final EdgeInsets? margin;
  final TextStyle? titleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '${_i18n()["title"]}',
            style: titleTextStyle ?? context.txt.titleLarge,
          ),
          const SizedBox(
            height: 4,
          ),
          Card(
            elevation: .5,
            margin: EdgeInsets.zero,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Row(
                children: [
                  Icon(
                    Icons.fmd_good,
                    color: Colors.black,
                    size: 13.mezSp,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      address,
                      style: context.txt.bodyLarge?.copyWith(
                        fontSize: 12.mezSp,
                      ),
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
  }
}
