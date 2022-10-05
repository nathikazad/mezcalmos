import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["OrderDeliveryLocation"];
//

class OrderDeliveryLocation extends StatelessWidget {
  const OrderDeliveryLocation({super.key, required this.order, this.margin});
  final Order order;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_i18n()["title"]}',
            style: Get.textTheme.bodyText1,
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
