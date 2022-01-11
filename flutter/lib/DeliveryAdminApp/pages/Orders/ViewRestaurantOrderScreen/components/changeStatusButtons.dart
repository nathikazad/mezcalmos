import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/buttonStyles.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/changeStatusButton.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

List<Widget> changebuttonsDepandesOnStatus(Rxn<RestaurantOrder> order) {
  if (order.value?.inProcess() ?? false)
    return [
      Expanded(
        child: changeStatusButton(order)!,
      ),
      BUttonsStyle.cancelButtonWidget(order.value!.orderId)
    ];
  else
    return [];
}
