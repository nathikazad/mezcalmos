import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:sizer/sizer.dart';
//
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["RestaurantOrderDeliveryTimeCard"];
//

class RestaurantOrderDeliveryTimeCard extends StatelessWidget {
  const RestaurantOrderDeliveryTimeCard(
      {Key? key, required this.order, this.margin})
      : super(key: key);
  final RestaurantOrder order;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    if (order.deliveryTime != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Text('${_i18n()["dvTime"]} :'),
          SizedBox(
            height: 4,
          ),
          Card(
            margin: margin ?? const EdgeInsets.only(bottom: 20),
            child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.watch_later,
                      color: Colors.black,
                      size: 13.sp,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(
                        "${DateFormat.MMMEd(userLangCode).format(order.deliveryTime!).replaceAll(".", "")}, ${DateFormat("hh:mm a").format(order.deliveryTime!.toLocal())}",
                        style: Get.textTheme.bodyText1,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      );
    } else {
      return SizedBox();
    }
  }
}
