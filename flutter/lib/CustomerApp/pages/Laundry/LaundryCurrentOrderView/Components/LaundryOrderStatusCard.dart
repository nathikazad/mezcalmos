import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/services/LaundryOrderHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:sizer/sizer.dart';

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
      margin: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            order.getOrderWidget(),
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
          order.orderStatusTitleForCustomer(),
          style:
              Theme.of(context).textTheme.headline3?.copyWith(fontSize: 14.sp),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
