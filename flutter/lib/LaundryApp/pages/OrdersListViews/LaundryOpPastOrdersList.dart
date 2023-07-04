import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/OrdersListViews/controllers/LaundryOpPastOrdersViewController.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/pages/Orders/LaundryOrderView/LaundryOrderView.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/Order/MinimalOrderCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpPastOrdersList'];

class LaundryOpPastOrdersList extends StatefulWidget {
  const LaundryOpPastOrdersList({
    Key? key,
  }) : super(key: key);

  @override
  State<LaundryOpPastOrdersList> createState() =>
      _LaundryOpPastOrdersListState();
}

class _LaundryOpPastOrdersListState extends State<LaundryOpPastOrdersList> {
  LaundryOpPastOrdersController _viewController =
      LaundryOpPastOrdersController();

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
        () => Scrollbar(
          child: SingleChildScrollView(
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
                  controller: _viewController.scrollController,
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: _viewController.pastOrders.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, int index) {
                    return MinimalOrderCard(
                      order: _viewController.pastOrders[index],
                      onTap: () {
                        LaundryOrderView.navigate(
                            orderId: _viewController.pastOrders[index].id);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
