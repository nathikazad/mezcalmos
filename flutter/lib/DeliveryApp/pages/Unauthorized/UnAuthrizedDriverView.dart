import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/pages/Unauthorized/controllers/UnauthDriverViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class UnAuthorizedDriverView extends StatefulWidget {
  const UnAuthorizedDriverView({super.key});

  @override
  State<UnAuthorizedDriverView> createState() => _UnAuthorizedDriverViewState();
}

class _UnAuthorizedDriverViewState extends State<UnAuthorizedDriverView> {
  UnautthDriverViewController viewController = UnautthDriverViewController();
  @override
  void initState() {
    viewController.init();
    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: MezSideMenu(),
      appBar: mezcalmosAppBar(
        AppBarLeftButtonType.Menu,
        showNotifications: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: secondaryLightBlueColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.sentiment_dissatisfied,
                color: primaryBlueColor,
              ),
            ),
            Container(
              child: Text(
                "Invitation needed",
                style: Get.textTheme.headline3,
              ),
            ),
            Container(
              child: Text(
                "You need an invitation to use our delivery app",
                style: Get.textTheme.bodyText2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
