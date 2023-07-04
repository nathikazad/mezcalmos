import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/services/RestaurantOrderHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewOrderScreen"]["components"]["OrderStatusCard"];

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard({
    Key? key,
    required this.ordersStates,
    required this.order,
  }) : super(key: key);

  final RestaurantOrder order;
  final cModels.RestaurantOrderStatus ordersStates;

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
            order.status.widget,
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
              order.status.title,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 14.mezSp),
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
