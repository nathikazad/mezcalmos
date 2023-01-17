import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/RestaurantOrderHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewOrderScreen"]["components"]["OrderStatusCard"];

class OrderStatusCard extends StatelessWidget {
  OrderStatusCard(
      {Key? key,
      required this.ordersStates,
      required this.order,
      this.isWebversion})
      : super(key: key);

  final RestaurantOrder order;
  final RestaurantOrderStatus ordersStates;

  bool? isWebversion = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            order.orderStatusImage(isWebVersion: isWebversion!),
            _orderStatusText(context),
            Spacer(
              flex: 1,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              order.getOrderStatus(),
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(fontSize: isWebversion == true ? 17 : 14.sp),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // if (_getEstimatedText() != null) _orderEtaTimeWidget()
        ],
      ),
    );
  }
}
