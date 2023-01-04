import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/components/ROpDriverCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/controllers/ROpDriversPageController.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpDriversView'];

class ROpDriversView extends StatefulWidget {
  const ROpDriversView({super.key, required this.restID});
  final int restID;

  @override
  State<ROpDriversView> createState() => _ROpDriversViewState();
}

class _ROpDriversViewState extends State<ROpDriversView> {
  ROpDriversViewController viewController = ROpDriversViewController();
  @override
  void initState() {
    viewController.init(restaurantID: widget.restID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    await viewController.fetchServiceLinks();
                    if (viewController.hasLinks) {
                      await _addDriverSheet();
                    } else {
                      final ServerResponse res =
                          await viewController.generateLinks();
                      if (res.success) {
                        //  await viewController.fetchOperators();
                        await _addDriverSheet();
                      } else {
                        mezDbgPrint("👋 ERROR ${res.errorMessage}");
                      }
                    }
                  }),
              SizedBox(
                height: 25,
              ),
              Obx(
                () => Column(
                  children: List.generate(
                      viewController.drivers.length,
                      (int index) => ROpListDriverCard(
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
                      'Ask your driver to scan this QR code on their phone',
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
                      child:
                          viewController.serviceLink.value?.driverQrImageLink !=
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
