import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/widgets/ShippingCostComponent.dart';

class OrderSummaryComponent extends StatelessWidget {
  final LaundryOrder order;

  const OrderSummaryComponent({Key? key, required this.order})
      : super(key: key);

  dynamic _i18n() =>
      Get.find<LanguageController>().strings['CustomerApp']['pages']['Laundry']
          ['LaundryCurrentOrderView']['Components']['OrderSummaryComponent'];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "${_i18n()["orderSummary"]}",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "${_i18n()["orderCost"]} :",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  order.costsByType?.weighedCost.toPriceString() ?? '-',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "${_i18n()["deliveryCost"]} :",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Flexible(
                    child:
                        ShippingCostComponent(shippingCost: order.shippingCost))
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "${_i18n()["totalCost"]} :",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  (order.costsByType?.weighedCost != null)
                      ? order.costsByType!.weighedCost.toPriceString()
                      : "-",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            const Divider(height: 25),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "${_i18n()["deliveryLocation"]}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.place,
                    size: 18,
                    color: Theme.of(context).primaryColorLight,
                  ),
                  const SizedBox(height: 5),
                  Flexible(child: Text(order.to.address, maxLines: 1)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Card laundryPricingCard(BuildContext context, LaundryOrder order) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text(
              _i18n()['laundryPricing'],
              style: Theme.of(context).textTheme.headline3,
            ),
            const Divider(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  _i18n()['fixedRate'],
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
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  _i18n()['orderWeight'],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  (order.costsByType?.weighedCost != null)
                      ? "${order.costsByType?.weighedCost} /kg"
                      : '-',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "${_i18n()["totalCost"]} :",
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
            if (order.costsByType == null) const Divider(height: 25),
            Row(
              children: <Widget>[
                const Icon(
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
      ),
    );
  }
}
