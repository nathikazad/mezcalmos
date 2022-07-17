import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

class ROpOrderNote extends StatelessWidget {
  const ROpOrderNote({
    Key? key,
    required this.order,
  }) : super(key: key);
// TODO FIX LANG
  final RestaurantOrder order;

  // dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']
  //     ['pages']['OrderView']['Components']['ROpOrderNote'];

  @override
  Widget build(BuildContext context) {
    if (order.notes != null && order.notes!.isNotEmpty) {
      return Card(
        margin: const EdgeInsets.only(bottom: 20),
        child: Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Notes :",
                style: Get.textTheme.bodyText1,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              Container(
                child: Text(
                  order.notes!,
                  style: Get.textTheme.subtitle2,
                ),
              ),
            ],
          ),
        ),
      );
    } else
      return Container();
  }
}
