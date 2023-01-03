import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/components/ROpOperatorCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/controllers/ROpOperatorsPageController.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:sizer/sizer.dart';

class ROpOperatorsView extends StatefulWidget {
  const ROpOperatorsView({super.key, required this.restaurantId});
  final int restaurantId;
  @override
  State<ROpOperatorsView> createState() => _ROpOperatorsViewState();
}

class _ROpOperatorsViewState extends State<ROpOperatorsView> {
  final ROpOperatorsViewController viewController =
      ROpOperatorsViewController();
  @override
  void initState() {
    Future.microtask(() async {
      await viewController.init(restaurantID: widget.restaurantId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          MezAddButton(
            onClick: () async {
              await viewController.fetchServiceLinks();
              if (viewController.hasLinks) {
                await _addDriverSheet();
              } else {
                await _addDriverSheet();
              }
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
                  (int index) => ROpOperatorCard(
                      viewController: viewController,
                      operator: viewController.operators[index])),
            ),
          )
        ],
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
