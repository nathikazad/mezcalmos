import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/controllers/PastOrderViewController.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryMessage.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/Buttons/MezInkwell.dart';
import 'package:mezcalmos/Shared/widgets/DvConvoCard.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["pages"]["CurrentOrders"]["CurrentOrdersListScreen"];

class TaxiPastOrdersView extends StatefulWidget {
  const TaxiPastOrdersView({Key? key}) : super(key: key);

  @override
  _TaxiPastOrdersViewState createState() => _TaxiPastOrdersViewState();
}

class _TaxiPastOrdersViewState extends State<TaxiPastOrdersView> {
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
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
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
                GroupedListView<DeliveryMinimalOrder, DateTime>(
                  shrinkWrap: true,
                  elements: _viewController.pastOrders,
                  groupBy: (DeliveryMinimalOrder element) => DateTime(
                      element.receivedTime.year,
                      element.receivedTime.month,
                      element.receivedTime.day),
                  groupComparator: (DateTime value1, DateTime value2) =>
                      value2.compareTo(value1),
                  itemComparator: (DeliveryMinimalOrder element1,
                          DeliveryMinimalOrder element2) =>
                      element2.receivedTime.compareTo(element1.receivedTime),
                  physics: NeverScrollableScrollPhysics(),
                  groupHeaderBuilder: (DeliveryMinimalOrder element) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        (calculateDateDifference(element.receivedTime) == 0)
                            ? _i18n()["today"]
                            : (calculateDateDifference(element.receivedTime) ==
                                    -1)
                                ? _i18n()["yesterday"]
                                : DateFormat('dd MMM yyyy')
                                    .format(element.receivedTime),
                        style: context.textTheme.bodyMedium,
                      ),
                    );
                  },
                  separator: SizedBox(
                    height: 5,
                  ),
                  itemBuilder:
                      (BuildContext context, DeliveryMinimalOrder message) {
                    return DvConvoCard(
                      message: message,
                      onClick: () {
                        _viewController.handleNavigation(order: message);
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
