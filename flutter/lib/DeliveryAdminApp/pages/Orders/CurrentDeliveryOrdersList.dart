import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/BottomNavBar.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/OrderCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Drivers/CompanyDriversScreen.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/ServiceProfile/ServiceProfile.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/pages/DeliveryCostSetting/DeliveryCostSettingView.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class ListDeliveryOrdersTabView extends StatefulWidget {
  const ListDeliveryOrdersTabView({super.key});

  @override
  State<ListDeliveryOrdersTabView> createState() =>
      _ListDeliveryOrdersTabViewState();
}

class _ListDeliveryOrdersTabViewState extends State<ListDeliveryOrdersTabView>
    with TickerProviderStateMixin {
  final OrderController _controller = Get.find<OrderController>();

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
    );
  }
}
