import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpStatsView/components/ROpOverviewChart.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpStatsView/components/ROpStatsDayCard.dart';
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
              ROpOverViewChart(
                viewController: viewController,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Last week",
                  style: Get.textTheme.bodyText1,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Obx(
                () => Column(
                  children: List.generate(
                      viewController.getLastWeekSales().length, (int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "${viewController.getLastWeekSales().keys.toList()[index].toDayName(withDateNumber: true).inCaps}"),
                        const SizedBox(
                          height: 5,
                        ),
                        ROpStatsDayCard(
                          viewController: viewController,
                          date: viewController
                              .getLastWeekSales()
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
              ),
            ],
          )),
    );
  }
}
