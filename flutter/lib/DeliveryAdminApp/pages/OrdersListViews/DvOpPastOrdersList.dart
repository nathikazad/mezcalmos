import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrdersListViews/controllers/DvOpPastOrdersViewController.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/Order/ROpOrderCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpPastOrdersList'];

class ROpPastOrdersList extends StatefulWidget {
  const ROpPastOrdersList({
    Key? key,
  }) : super(key: key);

  @override
  State<ROpPastOrdersList> createState() => _ROpPastOrdersListState();
}

class _ROpPastOrdersListState extends State<ROpPastOrdersList> {
  DvOpPastOrdersController viewController = DvOpPastOrdersController();
  @override
  void initState() {
    viewController.init();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar:
          mezcalmosAppBar(AppBarLeftButtonType.Back, onClick: MezRouter.back),
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
                  style: textTheme.bodyText1,
                ),
                const SizedBox(height: 5),
                ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: viewController.pastOrders.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, int index) {
                    return MinimalOrderCard(
                      order: viewController.pastOrders[index],
                      onTap: () {
                        MezRouter.toNamed(getDvCompanyOrderRoute(
                            viewController.pastOrders[index].id));
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