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
  dynamic _i18n() =>
      Get.find<LanguageController>().strings['CustomerApp']['pages']['Laundry']
          ['LaundryCurrentOrderView']['Components']['LaundryOrderComponent'];

  @override
  Widget build(BuildContext context) {
    if (order.notes!.isNotEmpty) {
      return Card(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  _i18n()["notes"],
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Divider(
                height: 15,
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
