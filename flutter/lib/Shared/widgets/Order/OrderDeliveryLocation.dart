import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["OrderDeliveryLocation"];
//

class OrderDeliveryLocation extends StatelessWidget {
  OrderDeliveryLocation(
      {super.key, required this.order, this.margin, this.isWebVersion});
  final Order order;
  final EdgeInsets? margin;
  bool? isWebVersion = false;

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_i18n()["title"]}  ',
            style: isWebVersion == true
                ? txt.bodyText1!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w500)
                : null,
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
                    Icons.fmd_good,
                    color: Colors.black,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      order.to.address,
                      style: txt.bodyText1!.copyWith(
                          fontSize: isWebVersion == true ? 16 : null,
                          color: Colors.grey),
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
