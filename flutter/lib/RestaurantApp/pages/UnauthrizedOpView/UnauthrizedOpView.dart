import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/components/RestaurantOpDrawer.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantOpAuthController.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrdersListViews/components/ROpWaitingForApproval.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

class ROpUnauthorizedOpView extends StatefulWidget {
  const ROpUnauthorizedOpView({super.key});

  @override
  State<ROpUnauthorizedOpView> createState() => _ROpUnauthorizedOpViewState();
}

class _ROpUnauthorizedOpViewState extends State<ROpUnauthorizedOpView> {
  RestaurantOpAuthController restaurantOpAuthController =
      Get.find<RestaurantOpAuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(
        AppBarLeftButtonType.Menu,
        showNotifications: true,
      ),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: ROpDrawer(),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ROpWaitingForApproval(),
            SizedBox(
              height: 15,
            ),
            MezButton(
              label: "Recheck status",
              backgroundColor: secondaryLightBlueColor,
              textColor: primaryBlueColor,
              icon: Icons.refresh,
              onClick: () async {
                await restaurantOpAuthController.setupRestaurantOperator();
                if (restaurantOpAuthController
                        .operator.value?.isWaitingToBeApprovedByOwner ==
                    false) {
                  await MezRouter.toNamed(kWrapperRoute);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
