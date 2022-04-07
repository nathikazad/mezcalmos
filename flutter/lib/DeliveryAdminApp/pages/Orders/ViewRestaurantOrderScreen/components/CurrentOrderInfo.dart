import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/BasicCellComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/buildWidgetOnOrderStatus.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

//Displays the restaurant on charge with the order  and the order status with an animation

class CurrentOrderInfo extends StatelessWidget {
  const CurrentOrderInfo({
    Key? key,
    required this.order,
  }) : super(key: key);

  final RestaurantOrder order;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 15),
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: const Color(0xffececec), width: 0.5),
        color: const Color(0x9affffff),
      ),
      child: Column(
        children: <Widget>[
          BasicCellComponent(
            url: "${order.restaurant.image}",
            title: "${order.restaurant.name}",
          ),
          Container(
            width: Get.width,
            height: 1,
            decoration: BoxDecoration(
              color: const Color(0xffececec),
            ),
          ),
          Container(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Obx(() {
                return (order.status != RestaurantOrderStatus.Delivered)
                    ? buildWigetOnOrderStatus(order.status, order.orderTime)
                    : Container();
              }),
            ),
          )
        ],
      ),
    );
  }
}
