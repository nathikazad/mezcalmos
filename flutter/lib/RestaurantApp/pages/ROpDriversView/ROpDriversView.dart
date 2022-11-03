import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantOpAuthController.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpDriversView/components/ROpDriverCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpDriversView/controllers/ROpDriversViewController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpDriversView'];

class ROpDriversView extends StatefulWidget {
  const ROpDriversView(
      {super.key, required this.restID, this.canGoBack = true});
  final String restID;
  final bool canGoBack;

  @override
  State<ROpDriversView> createState() => _ROpDriversViewState();
}

class _ROpDriversViewState extends State<ROpDriversView> {
  ROpDriversViewController viewController = ROpDriversViewController();
  @override
  void initState() {
    viewController.init(restaurantId: widget.restID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return widget.canGoBack;
      },
      child: Scaffold(
        appBar: mezcalmosAppBar(
          AppBarLeftButtonType.Back,
          showLeftBtn: false,
          title: '${_i18n()["drivers"]}',
          ordersRoute: kPastOrdersListView,
          showNotifications: true,
        ),
        body: Obx(() {
          if (viewController.restaurant.value != null) {
            return (viewController.restaurant.value!.selfDelivery)
                ? _buildDrivers()
                : _buildSelfDeliveryFalse();
          } else {
            return MezLogoAnimation(
              centered: true,
            );
          }
        }),
      ),
    );
  }

  Container _buildSelfDeliveryFalse() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${_i18n()["falseTitle"]}',
            style: Get.textTheme.bodyText1?.copyWith(fontSize: 15.sp),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/images/restaurantApp/driversList.png",
            height: 35.h,
            width: 80.w,
          ),
          const SizedBox(
            height: 20,
          ),
          MezButton(
            label: "Turn on self delivery",
            withGradient: true,
            borderRadius: 50,
            onClick: () async {
              await viewController.switchSelfDelivery(true);
            },
          )
          // Text(
          //   '${_i18n()["falseDesc"]}',
          //   style: Get.textTheme.bodyText2,
          // ),
        ],
      ),
    );
  }

  Widget _buildDrivers() {
    return SingleChildScrollView(
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
                if (viewController.restaurant.value?.qr != null &&
                    viewController.restaurant.value?.link != null) {
                  await _addDriverSheet();
                } else {
                  mezDbgPrint(
                      "OperatorId ===> ${Get.find<RestaurantOpAuthController>().operator.value?.info.id}");

                  mezDbgPrint(
                      "viewController.restaurantId ===> ${viewController.restaurant.value?.info.id}");
                  ServerResponse? resp = await viewController
                      .restaurantInfoController
                      ?.generateLink(
                    restaurantId: viewController.restaurant.value!.info.id,
                  );

                  if (resp?.success == true) {
                    await _addDriverSheet();
                  }
                }
              },
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              children: List.generate(
                  viewController.drivers.length,
                  (int index) => ROpListDriverCard(
                        driver: viewController.drivers[index],
                        viewController: viewController,
                      )),
            )
          ],
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
                      style: Get.textTheme.headline3?.copyWith(fontSize: 17.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // QR
                  Container(
                    height: 15.h,
                    width: 15.h,
                    color: Colors.black,
                    child: viewController.restaurant.value?.qr != null
                        ? CachedNetworkImage(
                            imageUrl: viewController.restaurant.value!.qr!,
                          )
                        : null,
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
                      Get.back();
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
                      // if (result) Get.back();
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
