import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/components/OrderCard.dart';
import 'package:mezcalmos/MezAdminApp/controllers/orderController.dart';
import 'package:mezcalmos/MezAdminApp/models/DeliveryOrder.dart';
import 'package:mezcalmos/MezAdminApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/order/delivery_order/hsDeliveryOrder.dart';

class ListDeliveryOrdersTabView extends StatefulWidget {
  const ListDeliveryOrdersTabView({this.specificServiceId, super.key});
  final int? specificServiceId;
  @override
  State<ListDeliveryOrdersTabView> createState() =>
      _ListDeliveryOrdersTabViewState();
}

class _ListDeliveryOrdersTabViewState extends State<ListDeliveryOrdersTabView>
    with TickerProviderStateMixin {
  final OrderController _controller = Get.find<OrderController>();
  RxList<DeliveryOrder> _specificServiceOrders = <DeliveryOrder>[].obs;

  @override
  void initState() {
    if (widget.specificServiceId != null) {
      get_service_orders(serviceId: widget.specificServiceId!).then((value) {
        _specificServiceOrders.value = value;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 11, right: 11, top: 11),
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Current Orders",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Color.fromARGB(255, 225, 228, 255),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Clipboard.setData(
                            ClipboardData(
                              text: Get.find<HasuraDb>().tokenSnapshot,
                            ),
                          );
                          MezRouter.toNamed<void>(kPastOrdersList,
                              arguments: widget.specificServiceId == null
                                  ? null
                                  : _specificServiceOrders);
                        },
                        child: Text(
                          "view past orders",
                          style: TextStyle(
                            color: Color.fromARGB(255, 103, 121, 254),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Obx(
              () => Column(
                children: List.generate(
                    widget.specificServiceId == null
                        ? _controller.currentOrders.length
                        : _getSpecificCurrentOrderByIndex().length,
                    (int index) {
                  return DeliveryOrderCard(
                    order: widget.specificServiceId == null
                        ? _controller.currentOrders[index]
                        : _getSpecificCurrentOrderByIndex()[index],
                    showLeftIcon: false,
                    onCardClick: () => MezRouter.toNamed<void>(
                      currentDeliveryOrderInfoRoute(
                        _getSpecificCurrentOrderByIndex()[index].id,
                      ),
                    ),
                  );
                }).reversed.toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DeliveryOrder> _getSpecificCurrentOrderByIndex() {
    return _specificServiceOrders.where((p0) => p0.isInProcess).toList();
  }

  List<DeliveryOrder> _getSpecificPasttOrderByIndex() {
    return _specificServiceOrders.where((p0) => !p0.isInProcess).toList();
  }
}
