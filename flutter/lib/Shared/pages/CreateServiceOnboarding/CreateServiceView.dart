import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/pages/CreateServiceOnboarding/controllers/CreateServiceViewController.dart';
import 'package:mezcalmos/Shared/pages/CreateServiceOnboarding/pages/CreateServiceInfoPage.dart';
import 'package:mezcalmos/Shared/pages/CreateServiceOnboarding/pages/CreateServiceSchedulePage.dart';
import 'package:mezcalmos/Shared/pages/DeliverySettingsView/DeliveryCostSettingView.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

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
      final ServerResponse? res = await viewController.handleNext();
      if (res?.success == true) {
        await showStatusInfoDialog(
          context,
          primaryClickTitle: "OK",
          primaryIcon: Icons.flatware,
          showSmallIcon: false,
          primaryCallBack: () {
            popEverythingAndNavigateTo(kTabsView);
          },
          status: "Your restaurant is under review",
          description:
              "You can start adding items to your menu and you’ll be notified once your restaurant is approved.",
        );
      } else {
        // handle error
      }
    } else
      await viewController.handleNext();
  }
}
