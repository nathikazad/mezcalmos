import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["OrderDeliveryType"];
//

class OrderDeliveryType extends StatelessWidget {
  const OrderDeliveryType(
      {super.key,
      required this.deliveryType,
      this.margin = const EdgeInsets.only(bottom: 20)});
  final DeliveryType deliveryType;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_i18n()["title"]}',
            style: context.txt.titleLarge,
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
                    (deliveryType == DeliveryType.Delivery)
                        ? Icons.delivery_dining
                        : Icons.store,
                    color: Colors.black,
                    size: 13.mezSp,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      "${_i18n()['${deliveryType.toFirebaseFormatString()}']}",
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
