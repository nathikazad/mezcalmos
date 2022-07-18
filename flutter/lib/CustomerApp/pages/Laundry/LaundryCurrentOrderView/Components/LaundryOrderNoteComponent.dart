import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

class LaundryOrderNoteComponent extends StatelessWidget {
  const LaundryOrderNoteComponent({
    Key? key,
    required this.order,
  }) : super(key: key);

  final LaundryOrder order;

  dynamic _i18n() =>
      Get.find<LanguageController>().strings['CustomerApp']['pages']['Laundry']
          ['LaundryCurrentOrderView']['Components']['LaundryOrderComponent'];

  @override
  Widget build(BuildContext context) {
    if (order.notes!.isNotEmpty) {
      return Card(
        margin: const EdgeInsets.only(bottom: 20),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                //  alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  _i18n()["notes"],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              SizedBox(height: 7),
              Text(order.notes ?? ''),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
