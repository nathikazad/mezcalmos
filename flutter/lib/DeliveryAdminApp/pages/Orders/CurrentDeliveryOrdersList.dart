import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/BottomNavBar.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/OrderCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrdersListScreen/Components/DriverOrderCard.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
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
                      )
                    ],
                  ),
                ),
                Column(
                  children: List.generate(
                    _controller.orders.length,
                    (int index) => DeliveryOrderCard(
                      order: _controller.orders[index],
                      showLeftIcon: false,
                    ),
                  ).reversed.toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
