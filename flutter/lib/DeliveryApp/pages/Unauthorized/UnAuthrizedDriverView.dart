import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/pages/Unauthorized/controllers/UnauthDriverViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/models/Utilities/AgentStatus.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/ServiceProviders/ServiceWaitingForApproval.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["pages"]["UnAuthorizedDriverView"];

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
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Menu,
        showNotifications: true,
      ),
      body: Obx(
        () => Container(
          alignment: Alignment.center,
          child: (viewController.status == AgentStatus.AwaitingApproval)
              ? ServiceWaitingForApproval()
              : _invitNedded(),
        ),
      ),
    );
  }

  Widget _invitNedded() {
    return Column(
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
            size: 35,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          child: Text(
            "${_i18n()['title']}",
            style: Get.textTheme.displaySmall,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          child: Text(
            "${_i18n()['subtitle']}",
            style: Get.textTheme.bodyMedium,
          ),
        )
      ],
    );
  }
}
