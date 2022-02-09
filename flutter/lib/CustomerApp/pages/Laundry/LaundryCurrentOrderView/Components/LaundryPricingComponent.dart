import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

class LaundryPricingCompnent extends StatelessWidget {
  final LaundryOrder order;
  LaundryPricingCompnent({Key? key, required this.order}) : super(key: key);
  LanguageController lang = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              lang.strings['customer']['laundry']['laundryPricing'],
              style: Theme.of(context).textTheme.headline3,
            ),
            Divider(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  lang.strings['deliveryAdminApp']['laundry']['fixedRate'],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  (order.cost != 0)
                      ? '\$' + order.cost.toStringAsFixed(0)
                      : '-',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  lang.strings['deliveryAdminApp']['laundry']['orderWeight'],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  (order.weight != null)
                      ? order.weight.toString() + '/kg'
                      : '-',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${lang.strings["customer"]["restaurant"]["cart"]["totalCost"]} :",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  (order.cost != 0)
                      ? '\$' + order.cost.toStringAsFixed(0)
                      : '-',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            if (order.weight == null)
              Column(
                children: [
                  Divider(
                    height: 25,
                  ),
                ],
              ),
            Row(
              children: [
                Icon(
                  Icons.help_outline_rounded,
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                    child: Text(
                        lang.strings['customer']['laundry']
                            ['laundryPricingNote'],
                        maxLines: 3)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
