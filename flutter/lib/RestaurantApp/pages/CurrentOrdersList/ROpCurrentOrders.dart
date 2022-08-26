import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/components/RestaurantOpDrawer.dart';
import 'package:mezcalmos/RestaurantApp/constants/assets.dart';
import 'package:mezcalmos/RestaurantApp/controllers/orderController.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantOpAuthController.dart';
import 'package:mezcalmos/RestaurantApp/pages/CurrentOrdersList/components/ROpOrderCard.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/IncomingOrders/IncomingOrdersOnOff.dart';
import 'package:mezcalmos/Shared/widgets/IncomingOrders/IncomingOrdersStatus.dart';
import 'package:mezcalmos/Shared/widgets/NoOrdersComponent.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpPastOrdersList'];

class LaundryOpCurrentOrdersListView extends StatefulWidget {
  const LaundryOpCurrentOrdersListView({Key? key}) : super(key: key);

  @override
  State<LaundryOpCurrentOrdersListView> createState() =>
      _LaundryOpCurrentOrdersListViewState();
}

class _LaundryOpCurrentOrdersListViewState
    extends State<LaundryOpCurrentOrdersListView> {
  ROpOrderController orderController = Get.find<ROpOrderController>();
  RxBool isOpen = RxBool(false);
  RestaurantOpAuthController _restaurantOpAuthController =
      Get.find<RestaurantOpAuthController>();
  RxList<RestaurantOrder> inProcessOrders = RxList.empty();
  RxList<RestaurantOrder> pastOrders = RxList.empty();
  StreamSubscription? _inProcessOrdersListener;
  StreamSubscription? _restStream;
  StreamSubscription? _pastOrdersListener;
  @override
  void initState() {
    Get.put(RestaurantInfoController(), permanent: true);
    _restStream = Get.find<RestaurantInfoController>()
        .getRestaurant(_restaurantOpAuthController.restaurantId!)
        .listen((Restaurant? event) {
      if (event != null) {
        isOpen.value = event.state.isOpen;
      }
    });
    inProcessOrders = orderController.currentOrders;
    pastOrders = orderController.pastOrders;
    _inProcessOrdersListener = orderController.currentOrders.stream
        .listen((List<RestaurantOrder> event) {
      inProcessOrders.value = event;
    });
    _pastOrdersListener =
        orderController.pastOrders.stream.listen((List<RestaurantOrder> event) {
      pastOrders.value = event;
    });

    super.initState();
  }

  @override
  void dispose() {
    _pastOrdersListener?.cancel();
    _inProcessOrdersListener?.cancel();
    _restStream?.cancel();
    Get.delete<RestaurantInfoController>(force: true);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Menu,
          showNotifications: true, ordersRoute: kPastOrdersListView),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: ROpDrawer(),
      body: Column(
        children: [
          Obx(
            () => Container(
              margin: const EdgeInsets.only(top: 8, right: 8, left: 8),
              child: TitleWithOnOffSwitcher(
                title: "${_i18n()["incomingOrders"]}",
                onTurnedOn: () {
                  _restaurantOpAuthController.turnOpenOn();
                },
                onTurnedOff: () {
                  _restaurantOpAuthController.turnOpenOff();
                },
                initialSwitcherValue: isOpen.value,
              ),
            ),
          ),
          Obx(() =>
              (isOpen.value) ? _inProcessOrders(textTheme) : _offlineWidget()),
        ],
      ),
    );
  }

  Container _offlineWidget() {
    return Container(
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
    );
  }

  Widget _inProcessOrders(TextTheme textTheme) {
    return Container(
        child: (inProcessOrders.value.isNotEmpty)
            ? Scrollbar(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${_i18n()["currentOrders"]}",
                            style: textTheme.bodyText1,
                          ),
                          const SizedBox(height: 5),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: inProcessOrders.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (_, int index) {
                              return ROpOrderCard(
                                order: inProcessOrders[index],
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            : Container(
                //margin: const EdgeInsets.all(16),
                alignment: Alignment.center,
                child: Center(child: NoOrdersComponent())));
  }
}
