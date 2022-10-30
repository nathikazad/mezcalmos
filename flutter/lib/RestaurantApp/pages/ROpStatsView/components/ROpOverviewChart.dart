import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpStatsView/controllers/ROpStatsViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:sizer/sizer.dart';

class ROpOverViewChart extends StatefulWidget {
  const ROpOverViewChart({super.key, required this.viewController});
  final ROpStatsViewController viewController;
  @override
  State<StatefulWidget> createState() => ROpOverViewChartState();
}

class ROpOverViewChartState extends State<ROpOverViewChart> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        gradient: LinearGradient(
            colors: [secondaryLightBlueColor, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  "Today sales",
                  style: Get.textTheme.bodyText1,
                ),
              ),
              Text(
                40.toPriceString(),
                style:
                    Get.textTheme.headline3?.copyWith(color: primaryBlueColor),
              ),
              if (true)
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.trending_up_rounded,
                      color: primaryBlueColor,
                      size: 20.sp,
                    ),
                    Text(
                      "3%",
                      style: Get.textTheme.subtitle1
                          ?.copyWith(color: primaryBlueColor),
                    )
                  ],
                )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  "Last week sales",
                  style: Get.textTheme.bodyText1,
                ),
              ),
              Text(
                15.toPriceString(),
                style: Get.textTheme.headline3?.copyWith(color: Colors.red),
              ),
              if (true)
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.trending_down_rounded,
                      color: Colors.red,
                      size: 20.sp,
                    ),
                    Text(
                      "7%",
                      style:
                          Get.textTheme.subtitle1?.copyWith(color: Colors.red),
                    )
                  ],
                )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "This month sales",
                style: Get.textTheme.bodyText1,
              ),
              Text(
                40.toPriceString(),
                style: Get.textTheme.headline3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
