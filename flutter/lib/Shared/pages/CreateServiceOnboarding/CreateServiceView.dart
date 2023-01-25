import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Services/ServiceInput.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/pages/CreateServiceOnboarding/components/CreateServiceDeliveryCompaniesList.dart';
import 'package:mezcalmos/Shared/pages/CreateServiceOnboarding/components/CreateServiceDeliveryCost.dart';
import 'package:mezcalmos/Shared/pages/CreateServiceOnboarding/components/ServiceDeliveryTypePicker.dart';
import 'package:mezcalmos/Shared/pages/CreateServiceOnboarding/controllers/CreateServiceViewController.dart';
import 'package:mezcalmos/Shared/pages/CreateServiceOnboarding/pages/CreateServiceInfoPage.dart';
import 'package:mezcalmos/Shared/pages/CreateServiceOnboarding/pages/CreateServiceSchedulePage.dart';
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
          label: viewController.getSaveButtonTitle(),
          borderRadius: 0,
          onClick: viewController.handleNext,
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
          SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("How would you like to deliver?"),
                SizedBox(
                  height: 10,
                ),
                ServiceDeliveryTypePicker(
                  viewController: viewController,
                ),
                Obx(() {
                  if (viewController.serviceInput.value.deliveryType ==
                      ServiceDeliveryType.Self_delivery) {
                    return CreateServiceDeliveryCost(
                        viewController: viewController);
                  } else
                    return CreateServiceDeliveryCompaniesList(
                      viewController: viewController,
                    );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
