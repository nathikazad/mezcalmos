import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/components/OrderCard.dart';
import 'package:mezcalmos/MezAdminApp/controllers/orderController.dart';
import 'package:mezcalmos/MezAdminApp/models/DeliveryOrder.dart';
import 'package:mezcalmos/MezAdminApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

class PastDeliveryOrdersList extends StatefulWidget {
  const PastDeliveryOrdersList({this.specificServiceOrders, super.key});
  final RxList<DeliveryOrder>? specificServiceOrders;
  @override
  State<PastDeliveryOrdersList> createState() => _PastDeliveryOrdersListState();
}

class _PastDeliveryOrdersListState extends State<PastDeliveryOrdersList> {
  final OrderController _controller = Get.find<OrderController>();

  @override
  void initState() {
    mezDbgPrint("[MMM] PAT ORDERS ROUTE ===> ${Get.arguments}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        // bottomNavigationBar: DeliveryOpBottomNavBar(),
        appBar: mezcalmosAppBar(
          AppBarLeftButtonType.Back,
          title: "Past Orders",
          autoBack: true,
        ),
        body: Container(
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
                        "Past Orders",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => Column(
                    children: List.generate(
                        widget.specificServiceOrders != null
                            ? widget.specificServiceOrders!.length
                            : _controller.pastOrders.length, (int index) {
                      return DeliveryOrderCard(
                        order: widget.specificServiceOrders != null
                            ? _getSpecificPastOrderByIndex()[index]
                            : _controller.pastOrders[index],
                        showLeftIcon: false,
                        onCardClick: () => MezRouter.toNamed<void>(
                          pastDeliveryOrderInfoRoute(
                            widget.specificServiceOrders != null
                                ? _getSpecificPastOrderByIndex()[index].id
                                : _controller.pastOrders[index].id,
                          ),
                        ),
                      );
                    }).reversed.toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<DeliveryOrder> _getSpecificCurrentOrderByIndex() {
    return widget.specificServiceOrders!.where((p0) => p0.isInProcess).toList();
  }

  List<DeliveryOrder> _getSpecificPastOrderByIndex() {
    return widget.specificServiceOrders!
        .where((p0) => !p0.isInProcess)
        .toList();
  }
}
