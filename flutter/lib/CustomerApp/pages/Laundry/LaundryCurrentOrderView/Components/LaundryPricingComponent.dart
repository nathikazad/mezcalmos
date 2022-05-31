import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
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
          children: <Widget>[
            Text(
              _i18n()['laundryPricing'],
              style: Theme.of(context).textTheme.headline3,
            ),
            Divider(
              height: 15,
            ),
            ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: order.costsByType?.lineItems.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return _costItemCard(order.costsByType!.lineItems[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            ),
            if (order.costsByType?.lineItems.isEmpty ?? true)
              Column(
                children: [
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
          ],
        ),
      ),
    );
  }
}

Widget _costItemCard(LaundryOrderCostLineItem item) {
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name[userLanguage]!,
              style: Get.textTheme.bodyText1,
            ),
            Text(" \$${item.cost} /KG"),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Weight : ${item.weight} KG",
              style: Get.textTheme.bodyText2,
            ),
            Text(
              "Total : \$${item.weighedCost}",
              style: Get.textTheme.bodyText1!.copyWith(color: primaryBlueColor),
            ),
          ],
        ),
      ],
    ),
  );
}
