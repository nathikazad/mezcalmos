import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrdersListView/components/CustomerPastOrdersList.dart';
import 'package:mezcalmos/DeliveryApp/components/DvConvoCard.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/controllers/DriverCurrentOrdersController.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/controllers/PastOrderViewController.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/DvOrderView.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/Order/MinimalOrderCard.dart';

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
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          autoBack: true, title: "${_i18n()["pastOrders"]}"),
      body: SingleChildScrollView(
        controller: _viewController.scrollController,
        padding: const EdgeInsets.all(8),
        child: Obx(() {
          if (_viewController.unResolvedMessages.isEmpty) {
            return const SizedBox.shrink();
          } else {
            return GroupedListView<WhMessage, DateTime>(
              shrinkWrap: true,
              elements: _viewController.unResolvedMessages,
              groupBy: (WhMessage element) => DateTime(element.timestamp.year,
                  element.timestamp.month, element.timestamp.day),
              groupComparator: (DateTime value1, DateTime value2) =>
                  value2.compareTo(value1),
              itemComparator: (WhMessage element1, WhMessage element2) =>
                  element2.timestamp.compareTo(element1.timestamp),
              physics: NeverScrollableScrollPhysics(),
              groupHeaderBuilder: (WhMessage element) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    (calculateDifference(element.timestamp) == 0)
                        ? _i18n()["today"]
                        : (calculateDifference(element.timestamp) == -1)
                            ? _i18n()["yesterday"]
                            : DateFormat('dd MMM yyyy')
                                .format(element.timestamp),
                    style: context.textTheme.bodyLarge,
                  ),
                );
              },
              separator: SizedBox(
                height: 5,
              ),
              itemBuilder: (BuildContext context, WhMessage message) {
                return DvConvoCard(
                  message: message,
                  onClick: () {
                    //   DvOrderView.navigate(orderId: order.id);
                  },
                );
              },
            );
          }
        }),
      ),
    );
  }

  Widget _pastOrdersList(BuildContext context) {
    if (_viewController.pastOrders.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_viewController.pastOrders.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              child: Text(
                _i18n()["pastOrders"],
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          Column(
            children: List.generate(
              _viewController.pastOrders.length,
              (int index) => MinimalOrderCard(
                order: _viewController.pastOrders[index],
                onTap: () {
                  DvOrderView.navigate(
                      orderId: _viewController.pastOrders[index].id);
                },
              ),
            ),
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
