import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/Components/LaundryAppAppBar.dart';
import 'package:mezcalmos/LaundryApp/Components/LaundyOpDrawer.dart';
import 'package:mezcalmos/LaundryApp/controllers/orderController.dart';
import 'package:mezcalmos/LaundryApp/pages/CurrentOrdersList/components/LaundryOpOrderCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/NoOrdersComponent.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['DashboardView']['OrdersListView']['LaundryOpOrdersListView'];

class LaundryOpCurrentOrdersListView extends StatefulWidget {
  const LaundryOpCurrentOrdersListView({Key? key}) : super(key: key);

  @override
  State<LaundryOpCurrentOrdersListView> createState() =>
      _LaundryOpCurrentOrdersListViewState();
}

class _LaundryOpCurrentOrdersListViewState
    extends State<LaundryOpCurrentOrdersListView> {
  OrderController orderController = Get.find<OrderController>();
  Rxn<List<LaundryOrder>> inProcessOrders = Rxn();
  StreamSubscription? _inProcessOrdersListener;

  @override
  void initState() {
    inProcessOrders.value = orderController.currentOrders;
    _inProcessOrdersListener =
        orderController.currentOrders.stream.listen((List<LaundryOrder> event) {
      inProcessOrders.value = event;
    });

    super.initState();
  }

  @override
  void dispose() {
    _inProcessOrdersListener?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (inProcessOrders.value != null) {
        return Scaffold(
          appBar: LaundryAppAppBar(
            leftBtnType: AppBarLeftButtonType.Menu,

            // onClick: Get.back,
          ),
          key: Get.find<SideMenuDrawerController>().getNewKey(),
          drawer: LaundryAppDrawer(),
          body: Container(
            child: (inProcessOrders.value!.isNotEmpty)
                ? SingleChildScrollView(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "${_i18n()["currentOrders"]}",
                            style: Get.textTheme.bodyText1,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Column(
                          children: List.generate(
                              inProcessOrders.value!.length,
                              (int index) => LaundryOpOrderCard(
                                  laundryOrder: inProcessOrders.value![index])),
                        )
                      ],
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    child: NoOrdersComponent(),
                  ),
          ),
        );
      } else {
        return Scaffold(
          body: MezLogoAnimation(
            centered: true,
          ),
        );
      }
    });
  }
}
