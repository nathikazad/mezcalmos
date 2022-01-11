import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/basicCellComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/ChangeStatusButtons.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

import '../ViewRestaurantOrderScreen.dart';

class CustomerInfoCard extends StatefulWidget {
  final Rxn<RestaurantOrder> order;
  const CustomerInfoCard({Key? key, required this.order}) : super(key: key);

  @override
  State<CustomerInfoCard> createState() => _CustomerInfoCardState();
}

class _CustomerInfoCardState extends State<CustomerInfoCard> {
  OrderController controller = Get.find<OrderController>();
  LanguageController lang = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.centerLeft,
          child: Text("Customer",
              style: Theme.of(context).textTheme.bodyText2,
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
                url: (widget.order.value)!.customer.image,
                title: (widget.order.value)!.customer.name,
                traillingIcon: Container(
                  child: Stack(children: [
                    IconButton(
                      icon: Icon(
                        Icons.chat_bubble_outline,
                        color: Color(0xff5c7fff),
                      ),
                      onPressed: () {
                        Get.toNamed(getCustomerMessagesRoute(
                            widget.order.value!.orderId));
                      },
                    ),
                    Positioned(
                        left: 28,
                        top: 10,
                        child: (controller.orderHaveNewMessageNotifications(
                                widget.order.value!.orderId))
                            ? Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color(0xfff6efff),
                                        width: 2),
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
              // Container(
              //   child: Container(
              //       padding: const EdgeInsets.symmetric(vertical: 10),
              //       child: Row(
              //         children: ChangeStatusButtons,
              //       )),
              // )
              if (widget.order.value?.inProcess() ?? false)
                ChangeStatusButtons(order: widget.order)
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
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.left),
        ),
        SizedBox(
          height: 10,
        ),
        buildOrdersItems(widget.order.value!.items, context),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

Widget buildOrdersItems(List<RestaurantOrderItem> items, BuildContext context) {
  return Container(
      child: Column(
    children: items.fold<List<Widget>>(<Widget>[], (children, element) {
      children.add(
        Column(
          children: [
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
                  Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      //height: 43,
                      child: BasicCellComponent(
                        title: "${element.name.inCaps}",
                        url: "${element.image}",
                        traillingIcon: Container(
                          width: 25,
                          height: 25,
                          child: Text("${element.quantity}",
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headline3,
                              textAlign: TextAlign.center),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(65)),
                              gradient: LinearGradient(
                                  begin: Alignment(0.1689453125, 0),
                                  end: Alignment(1, 1),
                                  colors: [
                                    const Color(0xff5582ff)
                                        .withOpacity(0.05000000074505806),
                                    const Color(0xffc54efc)
                                        .withOpacity(0.05000000074505806)
                                  ])),
                        ),
                      )),
                  Container(
                    width: Get.width,
                    height: 1,
                    decoration: BoxDecoration(
                      color: const Color(0xffececec),
                    ),
                  ),
                  Container(
                    child: Container(
                      padding:
                          const EdgeInsets.only(right: 10, top: 15, bottom: 15),
                      child: Container(
                          alignment: Alignment.centerRight,
                          child: Text("\$${currency.format(element.totalCost)}",
                              style: Theme.of(context).textTheme.headline3,
                              textAlign: TextAlign.right)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );
      return children;
    }),
  ));
}
