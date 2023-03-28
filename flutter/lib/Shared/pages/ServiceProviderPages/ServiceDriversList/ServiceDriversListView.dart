import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceDriversList/components/ListDriverCard.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceDriversList/controllers/DriversViewController.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ['ServiceDriversListView'];

class ServiceDriversListView extends StatefulWidget {
  const ServiceDriversListView({
    super.key,
    this.serviceProviderType,
    this.serviceLinkId,
    this.serviceProviderId,
  });

  static Future<void> navigateToDrivers(
      {required int serviceProviderId,
      required int serviceLinkId,
      required ServiceProviderType controllerType}) {
    String route = SharedServiceProviderRoutes.kDriversRoute
        .replaceFirst(":serviceProviderId", "$serviceProviderId");
    route = route.replaceFirst(":serviceLinkId", "$serviceLinkId");
    return MezRouter.toNamed(route, arguments: {
      "serviceProviderType": controllerType,
      "showAppBar": true,
    });
  }

  final int? serviceProviderId;
  final int? serviceLinkId;
  final ServiceProviderType? serviceProviderType;

  @override
  State<ServiceDriversListView> createState() => _ServiceDriversListViewState();
}

class _ServiceDriversListViewState extends State<ServiceDriversListView> {
  DriversViewController viewController = DriversViewController();
  int? serviceProviderId;
  int? serviceLinkId;

  bool showAppBar = true;
  ServiceProviderType? serviceProviderType;

  @override
  void initState() {
    _settingVariables();

    viewController.init(
        serviceProviderId: serviceProviderId!,
        servLinkId: serviceLinkId!,
        serviceProviderType: serviceProviderType!);

    super.initState();
  }

  void _settingVariables() {
    serviceProviderId = widget.serviceProviderId ??
        int.tryParse(Get.parameters["serviceProviderId"]!);
    serviceLinkId =
        widget.serviceLinkId ?? int.tryParse(Get.parameters["serviceLinkId"]!);

    serviceProviderType = widget.serviceProviderType ??
        Get.arguments?["serviceProviderType"] as ServiceProviderType;
  }

  bool get asTab =>
      widget.serviceProviderId != null && widget.serviceProviderType != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
          asTab ? AppBarLeftButtonType.Menu : AppBarLeftButtonType.Back,
          onClick: asTab ? null : MezRouter.back,
          title: "${_i18n()['drivers']}"),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: MezSideMenu(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MezButton(
                  label: '${_i18n()["addDriver"]}',
                  backgroundColor: secondaryLightBlueColor,
                  textColor: primaryBlueColor,
                  onClick: () async {
                    if (viewController.hasLinks) {
                      await _addDriverSheet();
                    }
                  }),
              SizedBox(
                height: 25,
              ),
              Obx(
                () => Column(
                  children: List.generate(
                      viewController.drivers.length,
                      (int index) => ListDriverCard(
                            driver: viewController.drivers[index],
                            viewController: viewController,
                          )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _addDriverSheet() {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: Get.context!,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
        builder: (BuildContext ctx) {
          return Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 8),
                    alignment: Alignment.center,
                    child: Text(
                      "${_i18n()['title']}",
                      style: context.txt.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // QR
                  Obx(
                    () => Container(
                      height: 25.h,
                      width: 25.h,
                      child: viewController
                                  .serviceLink.value?.driverQrImageLink !=
                              null
                          ? CachedNetworkImage(
                              imageUrl: viewController
                                  .serviceLink.value!.driverQrImageLink!,
                            )
                          : CircularProgressIndicator(),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MezButton(
                    label: "${_i18n()['copyLink']}",
                    icon: Icons.copy,
                    backgroundColor: secondaryLightBlueColor,
                    textColor: primaryBlueColor,
                    onClick: () async {
                      await Clipboard.setData(ClipboardData(
                              text: viewController
                                  .serviceLink.value!.driverDeepLink
                                  .toString()))
                          .whenComplete(() {
                        MezRouter.back();
                        _copiedSnackBar();
                      });
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MezButton(
                    icon: Ionicons.logo_whatsapp,
                    label: "${_i18n()['shrWhatsapp']}",
                    textColor: Color(0xFF219125),
                    backgroundColor: Color(0xFFE3FFE4),
                    onClick: () async {
                      // final bool result = await viewController.addDriver();
                      // if (result) MezRouter.back();
                    },
                  ),
                  if (MediaQuery.of(ctx).viewInsets.bottom == 0)
                    const SizedBox(
                      height: 25,
                    ),
                ],
              ));
        });
  }
}

void _copiedSnackBar() {
  return customSnackBar(
      title: "${_i18n()['copied']}",
      subTitle: "${_i18n()['copiedText']}",
      icon: Icon(
        Icons.check_circle,
        color: Colors.green,
      ));
}
