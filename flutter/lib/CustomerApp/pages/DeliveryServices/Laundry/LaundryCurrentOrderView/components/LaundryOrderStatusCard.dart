import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/services/LaundryOrderHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['CustomerApp']['pages']['Laundry']
        ['LaundryCurrentOrderView']['Components']['LaundryOrderStatusCard'];

class LaundryOrderStatusCard extends StatelessWidget {
  const LaundryOrderStatusCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final LaundryOrder order;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            order.status.widget,
            Spacer(),
            _orderStatusText(context),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderStatusText(BuildContext context) {
    return Flexible(
      flex: 8,
      fit: FlexFit.tight,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          order.status.title,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
