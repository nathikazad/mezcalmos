import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpStatsView/components/ROpStatsOverViewCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpStatsView/controllers/ROpStatsViewController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

class ROpStatsView extends StatefulWidget {
  const ROpStatsView({super.key, required this.restId});
  final String restId;

  @override
  State<ROpStatsView> createState() => _ROpStatsViewState();
}

class _ROpStatsViewState extends State<ROpStatsView> {
  ROpStatsViewController viewController = ROpStatsViewController();
  @override
  void initState() {
    Future.microtask(() {
      viewController.init(restaurantId: widget.restId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(
        AppBarLeftButtonType.Menu,
        title: "Statistics",
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                child: Text(
                  "Overview",
                  style: Get.textTheme.bodyText1,
                ),
              ),
              Column(
                children: List.generate(
                    viewController.getGroupedPastOrders().length, (int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "${viewController.getGroupedPastOrders().keys.toList()[index].toDayName(withDateNumber: true).inCaps}"),
                      const SizedBox(
                        height: 5,
                      ),
                      ROpStatsOverViewCard(
                        viewController: viewController,
                        date: viewController
                            .getGroupedPastOrders()
                            .keys
                            .toList()[index],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                }),
              ),
            ],
          )),
    );
  }
}
