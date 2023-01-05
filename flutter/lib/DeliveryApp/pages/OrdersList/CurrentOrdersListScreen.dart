import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/constants/assets.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/controllers/DriverCurrentOrdersController.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/IncomingOrders/IncomingOrdersOnOff.dart';
import 'package:mezcalmos/Shared/widgets/IncomingOrders/IncomingOrdersStatus.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/NoOrdersComponent.dart';
import 'package:mezcalmos/Shared/widgets/Order/ROpOrderCard.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["pages"]["CurrentOrders"]["CurrentOrdersListScreen"];

class CurrentOrdersListScreen extends StatefulWidget {
  @override
  _CurrentOrdersListScreenState createState() =>
      _CurrentOrdersListScreenState();
}

class _CurrentOrdersListScreenState extends State<CurrentOrdersListScreen> {
  OrderController orderController = Get.find<OrderController>();
  DriverCurrentOrdersController viewController =
      DriverCurrentOrdersController();
  DeliveryAuthController _deliveryAuthController =
      Get.find<DeliveryAuthController>();

  @override
  void initState() {
    Get.find<SideMenuDrawerController>().pastOrdersRoute = kPastOrdersView;
   orderController.clearNewOrderNotificationsOfPastOrders();
    viewController.init();

    super.initState();
  }

  @override
  void dispose() {
    orderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        appBar: mezcalmosAppBar(AppBarLeftButtonType.Menu,
            showNotifications: true, ordersRoute: kPastOrdersView),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Obx(
              () => Column(
                children: [
                  TitleWithOnOffSwitcher(
                    title: "${_i18n()["title"]}",
                    onTurnedOn: () {
                      _deliveryAuthController.turnOn();
                    },
                    onTurnedOff: () {
                      _deliveryAuthController.turnOff();
                    },
                    initialSwitcherValue:
                        _deliveryAuthController.driverState?.online ?? false,
                  ),
                  if (_deliveryAuthController.driverState?.online != true &&
                      orderController.currentOrders.isEmpty)
                    Container(
                      height: 60.h,
                      child: IncomingOrdersStatus(
                        childData: Padding(
                          padding: const EdgeInsets.only(bottom: 17.0),
                          child: Image.asset(
                            turnOn_asset,
                            fit: BoxFit.contain,
                            width: 40.w,
                            height: 25.h,
                          ),
                        ),
                        errorText: '${_i18n()["offlineTitle"]}',
                        secondLine: "${_i18n()["offlineBody"]}",
                      ),
                    )
                  else
                    _incomingOrdersList()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _incomingOrdersList() {
    if (viewController.currentOrders.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            child: Text(
              "${_i18n()["currentOrders"]}",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          SizedBox(height: 5),
          Column(
            children: List.generate(
                viewController.currentOrders.length,
                (int index) => MinimalOrderCard(
                      order: viewController.currentOrders[index],
                      onTap: () {
                        MezRouter.toNamed(getRestaurantOrderRoute(
                            viewController.currentOrders[index].id));
                      },
                    )).reversed.toList(),
          ),
        ],
      );
    } else {
      return NoOrdersComponent();
    }
  }
}