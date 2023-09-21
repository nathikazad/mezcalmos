import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/components/DvConvoCard.dart';
import 'package:mezcalmos/DeliveryApp/pages/DvConvoView/DvConvoView.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/controllers/DriverCurrentOrdersController.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/controllers/PastOrderViewController.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/Buttons/MezInkwell.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["pages"]["CurrentOrders"]["CurrentOrdersListScreen"];

class DriverPastOrdersView extends StatefulWidget {
  const DriverPastOrdersView({Key? key}) : super(key: key);

  @override
  _DriverPastOrdersViewState createState() => _DriverPastOrdersViewState();
}

class _DriverPastOrdersViewState extends State<DriverPastOrdersView> {
  DriverPastOrdersController _viewController = DriverPastOrdersController();
  @override
  void initState() {
    _viewController.init();
    super.initState();
  }

  @override
  void dispose() {
    _viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          MezcalmosAppBar(AppBarLeftButtonType.Back, onClick: MezRouter.back),
      body: SingleChildScrollView(
        controller: _viewController.scrollController,
        padding: const EdgeInsets.all(12),
        child: Obx(() {
          if (_viewController.pastOrders.isEmpty) {
            return const SizedBox.shrink();
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${_i18n()["pastOrders"]}",
                      style: context.textTheme.bodyLarge,
                    ),
                    MezInkwell(
                      label: _i18n()["openOrders"],
                      backgroundColor: secondaryLightBlueColor,
                      textColor: primaryBlueColor,
                      onClick: () async {
                        unawaited(MezRouter.toPath(
                            DeliveryAppRoutes.kCurrentOrdersListRoute));
                      },
                      icon: Icons.timelapse,
                    )
                  ],
                ),
                GroupedListView<DeliveryMessage, DateTime>(
                  shrinkWrap: true,
                  elements: _viewController.pastOrders,
                  groupBy: (DeliveryMessage element) => DateTime(
                      element.finishedTime!.year,
                      element.finishedTime!.month,
                      element.finishedTime!.day),
                  groupComparator: (DateTime value1, DateTime value2) =>
                      value2.compareTo(value1),
                  itemComparator: (DeliveryMessage element1,
                          DeliveryMessage element2) =>
                      element2.finishedTime!.compareTo(element1.finishedTime!),
                  physics: NeverScrollableScrollPhysics(),
                  groupHeaderBuilder: (DeliveryMessage element) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        (calculateDateDifference(element.finishedTime!) == 0)
                            ? _i18n()["today"]
                            : (calculateDateDifference(element.finishedTime!) ==
                                    -1)
                                ? _i18n()["yesterday"]
                                : DateFormat('dd MMM yyyy')
                                    .format(element.finishedTime!),
                        style: context.textTheme.bodyMedium,
                      ),
                    );
                  },
                  separator: SizedBox(
                    height: 5,
                  ),
                  itemBuilder: (BuildContext context, DeliveryMessage message) {
                    return DvConvoCard(
                      message: message,
                      onClick: () {
                        DvConvoView.navigate(phoneNumber: message.phoneNumber);
                      },
                    );
                  },
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
