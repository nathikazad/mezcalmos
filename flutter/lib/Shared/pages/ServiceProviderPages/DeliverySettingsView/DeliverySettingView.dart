import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/controllers/CreateServiceViewController.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliverySettingsView/components/DeliverySettingCostComponent.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliverySettingsView/components/DeliverySettingsCompaniesList.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliverySettingsView/components/ServiceDeliveryTypePicker.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliverySettingsView/controllers/DeliverySettingsViewController.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings['Shared']["pages"]
    ["DeliverySettingsView"]["DeliverySettingsView"];

//
class DeliverySettingsView extends StatefulWidget {
  const DeliverySettingsView({
    Key? key,
    this.createServiceViewController,
  }) : super(key: key);

  static Future<void> navigate({
    required int serviceProviderId,
    required int detailsId,
    required int deliveryDetailsID,
    required ServiceProviderType serviceProviderType,
  }) {
    return MezRouter.toPath(
        SharedServiceProviderRoutes.kDeliverySettingsViewRoute
            .replaceAll(":serviceProviderId", serviceProviderId.toString())
            .replaceAll(":detailsId", detailsId.toString())
            .replaceAll(":deliveryDetailsId", deliveryDetailsID.toString()),
        arguments: <String, dynamic>{
          "serviceProviderType": serviceProviderType,
        });
  }

  final CreateServiceViewController? createServiceViewController;

  @override
  State<DeliverySettingsView> createState() => _DeliverySettingsViewState();
}

class _DeliverySettingsViewState extends State<DeliverySettingsView> {
  DeliverySettingsViewController viewController =
      DeliverySettingsViewController();
  int? serviceProviderId;
  int? serviceDetailsId;
  int? deliveryDetailsId;
  ServiceProviderType? serviceProviderType;

  @override
  void initState() {
    mezDbgPrint("Delivery cost init :==========>");
    _settingVariables();
    viewController.init(
        createServiceViewController: widget.createServiceViewController,
        serviceProviderId: serviceProviderId,
        deliveryDetailsId: deliveryDetailsId,
        detailsID: serviceDetailsId,
        serviceProviderType: serviceProviderType);
    super.initState();
  }

  void _settingVariables() {
    if (MezRouter.urlArguments["serviceProviderId"] != null &&
        MezRouter.bodyArguments?["serviceProviderType"] != null &&
        MezRouter.urlArguments["deliveryDetailsId"] != null &&
        MezRouter.urlArguments["detailsId"] != null) {
      serviceProviderId =
          int.tryParse(MezRouter.urlArguments["serviceProviderId"].toString());
      serviceDetailsId =
          int.tryParse(MezRouter.urlArguments["detailsId"].toString());
      deliveryDetailsId =
          int.tryParse(MezRouter.urlArguments["deliveryDetailsId"].toString());

      serviceProviderType = MezRouter.bodyArguments?["serviceProviderType"]
          .toString() as ServiceProviderType;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: viewController.isCreatingNewService
          ? null
          : MezcalmosAppBar(AppBarLeftButtonType.Back,
              onClick: MezRouter.back, title: "${_i18n()['delivery']}"),
      bottomSheet: viewController.isCreatingNewService
          ? null
          : MezButton(
              borderRadius: 0,
              height: 75,
              label: "${_i18n()['save']}",
              onClick: () async {
                await viewController.handleSave();
              },
            ),
      body: Obx(() {
        if (viewController.hasData) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${_i18n()['title']}"),
                SizedBox(
                  height: 10,
                ),
                if (serviceProviderType != ServiceProviderType.DeliveryCompany)
                  ServiceDeliveryTypePicker(
                    viewController: viewController,
                  ),
                (viewController.isSelfDelivery ||
                        serviceProviderType ==
                            ServiceProviderType.DeliveryCompany)
                    ? DeliverySettingCostComponent(
                        viewController: viewController)
                    : DeliverySettingsCompaniesList(
                        viewController: viewController,
                      )
              ],
            ),
          );
        } else
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
      }),
    );
  }
}
