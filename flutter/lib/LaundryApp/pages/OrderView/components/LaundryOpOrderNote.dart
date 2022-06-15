import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

class LaundryOpOrderNote extends StatelessWidget {
  const LaundryOpOrderNote({
    Key? key,
    required this.order,
  }) : super(key: key);
// TODO FIX LANG
  final LaundryOrder order;

  dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']
      ['pages']['OrderView']['Components']['LaundryOpOrderNote'];

  @override
  Widget build(BuildContext context) {
    if (order.notes!.isNotEmpty) {
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Text(
                  _i18n()["notes"],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(order.notes ?? '')
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
