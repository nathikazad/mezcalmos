import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class LaundryOrderPricingComponent extends StatelessWidget {
  final LaundryOrder order;

  const LaundryOrderPricingComponent({
    Key? key,
    required this.order,
  }) : super(key: key);

  dynamic _i18n() =>
      Get.find<LanguageController>().strings['CustomerApp']['pages']['Laundry']
          ['LaundryCurrentOrderView']['Components']['LaundryPricingComponent'];
  static LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 15),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _i18n()['laundryPricing'],
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 10,
            ),
            if (order.costsByType?.lineItems.isNotEmpty ?? false)
              Column(
                children: [
                  Column(
                    children: List.generate(
                        order.costsByType?.lineItems.length ?? 0, (int index) {
                      return _itemRowCard(
                          item: order.costsByType!.lineItems[index]);
                    }),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${_i18n()["total"]}',
                          style: Get.textTheme.bodyText1,
                        ),
                        Text(
                          order.costsByType!.weighedCost.toPriceString(),
                          style: Get.textTheme.bodyText1,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            if (order.costsByType?.lineItems.isEmpty ?? true)
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Icon(
                        Icons.info_outline_rounded,
                       color: offShadeGreyColor,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        _i18n()['laundryPricingNote'],
                        style: Get.textTheme.bodyText2,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemRowCard({required LaundryOrderCostLineItem item}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              item.name[userLanguage]?.inCaps ?? "",
              maxLines: 1,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            "\$${item.cost.round()} x ${item.weight}KG = \$${item.weighedCost.round()}",
          ),
        ],
      ),
    );
  }
}
