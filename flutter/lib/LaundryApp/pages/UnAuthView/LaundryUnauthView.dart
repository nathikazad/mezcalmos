import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/UnAuthView/controllers/LaundryUnauthViewController.dart';
import 'package:mezcalmos/RestaurantApp/components/RestaurantOpDrawer.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/ServiceProviders/ServiceWaitingForApproval.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["LaundryApp"]["pages"]
    ["LaundryUnauthView"];

class LaundryUnauthView extends StatefulWidget {
  const LaundryUnauthView({super.key});

  @override
  State<LaundryUnauthView> createState() => _LaundryUnauthViewState();
}

class _LaundryUnauthViewState extends State<LaundryUnauthView> {
  LaundryUnauthViewController viewController = LaundryUnauthViewController();
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
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Menu,
        showNotifications: true,
      ),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: ROpDrawer(),
      body: Obx(
        () => Container(
          margin: const EdgeInsets.all(20),
          child: (viewController.hasStatus)
              ? ServiceWaitingForApproval()
              : Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 35.h,
                      width: double.infinity,
                      child: Image.asset(
                        aRequestWaiting,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      alignment: Alignment.center,
                      child: Text(
                        "${_i18n()['title']}",
                        style: context.txt.displaySmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
