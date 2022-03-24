import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

class LaundryPricingCompnent extends StatelessWidget {
  final LaundryOrder order;

  const LaundryPricingCompnent({Key? key, required this.order})
      : super(key: key);

  dynamic _i18n() =>
      Get.find<LanguageController>().strings['CustomerApp']['pages']['Laundry']
          ['LaundryCurrentOrderView']['Components']['LaundryPricingComponent'];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              _i18n()['laundryPricing'],
              style: Theme.of(context).textTheme.headline3,
            ),
            const Divider(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _i18n()['fixedRate'],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "${order.costPerKilo} \$ / kg",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _i18n()['orderWeight'],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  (order.weight != null)
                      ? order.weight.toString() + ' kg'
                      : '-',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${_i18n()["totalCost"]} :",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  (order.weight != null) ? '${order.cost - 50} \$' : '-',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            if (order.weight == null)
              Column(
                children: [
                  Divider(height: 25),
                  Row(
                    children: [
                      Icon(
                        Icons.help_outline_rounded,
                      ),
                      const SizedBox(height: 10),
                      Flexible(
                        child: Text(
                          _i18n()['laundryPricingNote'],
                          maxLines: 3,
                        ),
                      ),
                    ],
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
