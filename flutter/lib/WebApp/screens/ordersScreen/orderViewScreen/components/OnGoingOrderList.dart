import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/pages/Orders/components/CustomerOrderCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['ListOrdersScreen']['ListOrdersScreen'];

class OngoingOrderList extends StatelessWidget {
  OngoingOrderList(
      {Key? key,
      required this.txt,
      required this.controller,
      this.isWebVersion})
      : super(key: key);

  final TextTheme txt;
  final OrderController controller;
  bool? isWebVersion = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.withOpacity(0.3),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                _i18n()['orders']["onGoingOrders"],
                style: txt.headline3!
                    .copyWith(fontSize: (isWebVersion == true) ? 25 : null),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                reverse: true,
                itemCount: controller.currentOrders.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomerOrderCard(
                    order: controller.currentOrders[index],
                    isWebVersion: isWebVersion,
                  );
                }),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
