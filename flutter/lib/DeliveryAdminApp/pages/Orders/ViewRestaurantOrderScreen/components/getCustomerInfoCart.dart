import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/BasicCellComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewOrderScreen/components/buildOrdersItem.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/changeStatusButtons.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

Widget getCustomerInfoCart(Rxn<RestaurantOrder> order) {
  LanguageController lang = Get.find<LanguageController>();
  OrderController controller = Get.find<OrderController>();
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.centerLeft,
        child: Text("Customer",
            style: const TextStyle(
                color: const Color(0xff000f1c),
                fontWeight: FontWeight.w700,
                fontFamily: "psb",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
            textAlign: TextAlign.left),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: const Color(0xffececec), width: 0.5),
          color: const Color(0x9affffff),
        ),
        child: Column(
          children: [
            BasicCellComponent(
              url: (order.value as RestaurantOrder).customer.image,
              title: (order.value as RestaurantOrder).customer.name,
              traillingIcon: Container(
                child: Stack(children: [
                  IconButton(
                    icon: Icon(
                      Icons.chat_bubble_outline,
                      color: Color(0xff5c7fff),
                    ),
                    onPressed: () {
                      Get.toNamed(
                          getCustomerMessagesRoute(order.value!.orderId));
                    },
                  ),
                  Positioned(
                      left: 28,
                      top: 10,
                      child: (controller.orderHaveNewMessageNotifications(
                              order.value!.orderId))
                          ? Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: const Color(0xfff6efff), width: 2),
                                  color: const Color(0xffff0000)))
                          : Container())
                ]),
              ),
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
                  child: Row(
                    children: changebuttonsDepandesOnStatus(order),
                  )),
            )
          ],
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.centerLeft,
        child: Text(
            "${lang.strings["customer"]["restaurant"]["checkout"]["orderItems"]}",
            style: const TextStyle(
                color: const Color(0xff000f1c),
                fontWeight: FontWeight.w700,
                fontFamily: "psb",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
            textAlign: TextAlign.left),
      ),
      SizedBox(
        height: 10,
      ),
      buildOrdersItems(order.value!.items),
      SizedBox(
        height: 15,
      ),
    ],
  );
}
