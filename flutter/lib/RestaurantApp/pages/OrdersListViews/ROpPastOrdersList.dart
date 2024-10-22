import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrdersListViews/controllers/ROpPastOrdersViewController.dart';
import 'package:mezcalmos/RestaurantApp/router/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/pages/Orders/RestaurantOrderView/RestaurantOrderView.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/NoOrdersComponent.dart';
import 'package:mezcalmos/Shared/widgets/Order/MinimalOrderCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpPastOrdersList'];

class ROpPastOrdersList extends StatefulWidget {
  const ROpPastOrdersList({
    Key? key,
  }) : super(key: key);

  static Future<void> navigate() {
    return MezRouter.toPath(RestaurantAppRoutes.pastOrdersRoute);
  }

  @override
  State<ROpPastOrdersList> createState() => _ROpPastOrdersListState();
}

class _ROpPastOrdersListState extends State<ROpPastOrdersList> {
  ROpPastOrdersController _viewController = ROpPastOrdersController();

  @override
  void initState() {
    _viewController.init();

    super.initState();
  }

  @override
  void dispose() {
    _viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar:
          MezcalmosAppBar(AppBarLeftButtonType.Back, onClick: MezRouter.back),
      body: Obx(
        () {
          if (_viewController.pastOrders.isNotEmpty) {
            return Scrollbar(
              child: SingleChildScrollView(
                controller: _viewController.scrollController,
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // padding: const EdgeInsets.all(10),
                  children: <Widget>[
                    Text(
                      "${_i18n()["pastOrders"]}",
                      style: textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 5),
                    ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: _viewController.pastOrders.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, int index) {
                        return MinimalOrderCard(
                          order: _viewController.pastOrders[index],
                          onTap: () {
                            RestaurantOrderView.navigate(
                                orderId: _viewController.pastOrders[index].id);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          } else
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  child: Text(
                    "${_i18n()["pastOrders"]}",
                    style: textTheme.bodyLarge,
                  ),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NoOrdersComponent(),
                    ],
                  ),
                ),
                Spacer(),
              ],
            );
        },
      ),
    );
  }
}
