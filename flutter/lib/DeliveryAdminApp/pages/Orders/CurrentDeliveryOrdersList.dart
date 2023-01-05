import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/BottomNavBar.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/OrderCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class CurrentDeliveryOrdersListView extends StatefulWidget {
  const CurrentDeliveryOrdersListView({super.key});

  @override
  State<CurrentDeliveryOrdersListView> createState() =>
      _CurrentDeliveryOrdersListViewState();
}

class _CurrentDeliveryOrdersListViewState
    extends State<CurrentDeliveryOrdersListView> {
  final OrderController _controller = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: DeliveryOpBottomNavBar(),
        appBar: mezcalmosAppBar(
          AppBarLeftButtonType.Menu,
          title: "Orders",
          showNotifications: true,
          autoBack: false,
        ),
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
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
                        "Current Orders",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 5),
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
                              MezRouter.toNamed<void>(kPastOrdersList);
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
                    children: List.generate(_controller.currentOrders.length,
                        (int index) {
                      return DeliveryOrderCard(
                        order: _controller.currentOrders[index],
                        showLeftIcon: false,
                        onCardClick: () => MezRouter.toNamed<void>(
                          currentDeliveryOrderInfoRoute(
                            _controller.currentOrders[index].id,
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
}
