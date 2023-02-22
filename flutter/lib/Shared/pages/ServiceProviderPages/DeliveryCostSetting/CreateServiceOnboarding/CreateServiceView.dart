import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantOpAuthController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/controllers/CreateServiceViewController.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/pages/CreateServiceInfoPage.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/pages/CreateServiceSchedulePage.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliverySettingsView/DeliverySettingView.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ['CreateServiceView'];

//
class CreateServiceView extends StatefulWidget {
  const CreateServiceView({super.key});

  @override
  State<CreateServiceView> createState() => _CreateServiceViewState();
}

class _CreateServiceViewState extends State<CreateServiceView> {
  CreateServiceViewController viewController = CreateServiceViewController();
  ServiceProviderType? serviceProviderType;
  @override
  void initState() {
    serviceProviderType =
        Get.arguments["serviceProviderType"] as ServiceProviderType;
    viewController.init(serviceProviderType: serviceProviderType!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          titleWidget: Obx(() => Text(viewController.getTitle())),
          onClick: viewController.handleBack),
      bottomSheet: Obx(
        () => MezButton(
          height: 75,
          label: viewController.getSaveButtonTitle(),
          borderRadius: 0,
          onClick: () async {
            if (viewController.isFormValid()) {
              await _handleButton();
            }
          },
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: viewController.pageController,
        children: [
          CreateServiceInfoPage(viewController: viewController),
          CreateServiceSchedulePage(
            viewController: viewController,
          ),
          DeliverySettingsView(createServiceViewController: viewController),
        ],
      ),
    );
  }

  Future<void> _handleButton() async {
    if (viewController.currentPage.value == 2) {
      final bool? res = await viewController.handleNext();
      if (res == true) {
        await showStatusInfoDialog(
          context,
          primaryClickTitle: "${_i18n()['ok']}",
          primaryIcon: Icons.flatware,
          showSmallIcon: false,
          primaryCallBack: () {
            Get.find<RestaurantOpAuthController>().setupRestaurantOperator();
            MezRouter.popEverythingAndNavigateTo(RestaurantAppRoutes.kTabsView);
          },
          status: "${_i18n()['restTitle']}",
          description: "${_i18n()['restBody']}",
        );
      } else {
        // handle error
      }
    } else {
      await viewController.handleNext();
    }
  }
}
