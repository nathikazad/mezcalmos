import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

class LaundryOrderNoteComponent extends StatelessWidget {
   LaundryOrderNoteComponent({
    Key? key,
    required this.order,
  }) : super(key: key);

  final LaundryOrder order;
LanguageController lang = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                lang.strings?["customer"]?["restaurant"]?["menu"]?["notes"],
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
  }
}
