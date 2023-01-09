import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/pages/ServiceOperatorsList/components/ListOperatorCard.dart';
import 'package:mezcalmos/Shared/pages/ServiceOperatorsList/controllers/OperatorsViewController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpDriversView'];

class OperatorsListView extends StatefulWidget {
  const OperatorsListView({
    super.key,
    this.serviceProviderType,
    this.serviceProviderId,
    this.showAppBar,
  });
  final int? serviceProviderId;
  final ServiceProviderType? serviceProviderType;
  final bool? showAppBar;

  @override
  State<OperatorsListView> createState() => _OperatorsListViewState();
}

class _OperatorsListViewState extends State<OperatorsListView> {
  late OperatorsListViewController viewController;
  int? serviceProviderId;
  bool showAppBar = true;
  ServiceProviderType? serviceProviderType;
  @override
  void initState() {
    _settingVariables();
    if (serviceProviderType == ServiceProviderType.Delivery_company) {
      viewController = DeliveryOperatorsListViewController();
    } else {
      viewController = RestaurantOperatorsListViewController();
    }
    viewController.init(serviceProviderId: serviceProviderId!);

    super.initState();
  }

  void _settingVariables() {
    serviceProviderId = widget.serviceProviderId ??
        int.tryParse(Get.parameters["serviceProviderId"]!);
    showAppBar =
        widget.showAppBar ?? Get.arguments?["showAppBar"] as bool? ?? true;
    serviceProviderType = widget.serviceProviderType ??
        Get.arguments?["serviceProviderType"] as ServiceProviderType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (showAppBar)
            ? mezcalmosAppBar(AppBarLeftButtonType.Back,
                onClick: MezRouter.back, title: "Operators")
            : null,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              MezAddButton(
                onClick: () async {
                  await viewController.fetchServiceLinks();
                  await _addOperatorSheet();
                },
                title: "Add operator",
              ),
              SizedBox(
                height: 15,
              ),
              Obx(
                () => Column(
                  children: List.generate(
                      viewController.operators.length,
                      (int index) => ListOperatorCard(
                          viewController: viewController,
                          operator: viewController.operators[index])),
                ),
              )
            ],
          ),
        ));
  }

  Future<void> _addOperatorSheet() {
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
                      'Ask your operator to scan this QR code on their phone',
                      style: Get.textTheme.bodyText1,
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
                                  .serviceLink.value?.operatorQrImageLink !=
                              null
                          ? CachedNetworkImage(
                              imageUrl: viewController
                                  .serviceLink.value!.operatorQrImageLink!,
                            )
                          : CircularProgressIndicator(),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MezButton(
                    label: 'Copy link',
                    icon: Icons.copy,
                    backgroundColor: secondaryLightBlueColor,
                    textColor: primaryBlueColor,
                    onClick: () async {
                      await Clipboard.setData(ClipboardData(
                              text: viewController
                                  .serviceLink.value!.operatorDeepLink
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
                    label: 'Share on whatsapp',
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

SnackbarController _copiedSnackBar() {
  return Get.snackbar('Copied', 'Link copied successfuly',
      backgroundColor: Colors.black,
      colorText: Colors.white,
      shouldIconPulse: false,
      icon: Icon(
        Icons.check_circle,
        color: Colors.green,
      ));
}
