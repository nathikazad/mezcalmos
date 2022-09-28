import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

class LaundryPricingCompnent extends StatelessWidget {
  final LaundryOrder order;

  const LaundryPricingCompnent({Key? key, required this.order})
      : super(key: key);

  dynamic _i18n() =>
      Get.find<LanguageController>().strings['CustomerApp']['pages']['Laundry']
          ['LaundryCurrentOrderView']['Components']['LaundryPricingComponent'];
  static LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
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
                        )
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
                    Icon(
                      Icons.info_outline_rounded,
                      color: Colors.grey.shade800,
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        _i18n()['laundryPricingNote'],
                        style: TextStyle(
                          color: Colors.grey.shade800,
                        ),
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
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
          Text(
            item.name[userLanguage] ?? "",
          ),
          Text(
            "\$${item.cost} x ${item.weight}KG = \$${item.weighedCost}",
          ),
        ],
      ),
    );
  }
}
