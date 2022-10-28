import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpDriversView/components/ROpDriverCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpDriversView/controllers/ROpDriversViewController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
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
            return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (viewController.restaurant.value!.selfDelivery)
                        ? _buildDrivers()
                        : _buildSelfDeliveryFalse(),
                  ],
                ));
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_i18n()["falseTitle"]}',
            style: Get.textTheme.headline3,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '${_i18n()["falseDesc"]}',
            style: Get.textTheme.bodyText2,
          ),
        ],
      ),
    );
  }

  Container _buildDrivers() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_i18n()["trueTitle"]}',
            style: Get.textTheme.headline3,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '${_i18n()["trueDesc"]}',
            style: Get.textTheme.bodyText2,
          ),
          const SizedBox(
            height: 20,
          ),
          MezButton(
            label: '${_i18n()["addDriver"]}',
            backgroundColor: secondaryLightBlueColor,
            textColor: primaryBlueColor,
            onClick: () async {
              await _addDriverSheet();
            },
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            '${_i18n()["assDrivers"]}',
            style: Get.textTheme.bodyText1,
          ),
          SizedBox(
            height: 15,
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
          return Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
            child: Container(
                margin: const EdgeInsets.only(
                  top: 16,
                  left: 12,
                  right: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 8),
                      alignment: Alignment.center,
                      child: Text(
                        '${_i18n()["newDv"]}',
                        style:
                            Get.textTheme.headline3?.copyWith(fontSize: 17.sp),
                      ),
                    ),
                    Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${_i18n()["emailOrPhone"]}',
                      style: Get.textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: viewController.emailOrPhone,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: MezButton(
                          label: '${_i18n()["cancel"]}',
                          backgroundColor: offRedColor,
                          textColor: Colors.red,
                          onClick: () async {
                            Get.back();
                          },
                        )),
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                            child: MezButton(
                          label: '${_i18n()["addDriver"]}',
                          withGradient: true,
                          onClick: () async {
                            final bool result =
                                await viewController.addDriver();
                            if (result) Get.back();
                          },
                        )),
                      ],
                    ),
                    if (MediaQuery.of(ctx).viewInsets.bottom == 0)
                      const SizedBox(
                        height: 25,
                      ),
                  ],
                )),
          );
        });
  }
}
