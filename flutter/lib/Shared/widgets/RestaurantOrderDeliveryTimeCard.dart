import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

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
      return Card(
        margin: margin ?? const EdgeInsets.only(bottom: 20),
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: primaryBlueColor,
                  child: Icon(
                    Icons.date_range,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${_i18n()["dvTime"]}'),
                      Text(
                        "${DateFormat.MMMEd(userLangCode).format(order.deliveryTime!).replaceAll(".", "")}, ${DateFormat("hh:mm a").format(order.deliveryTime!.toLocal())}",
                        style: Get.textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ],
            )),
      );
    } else {
      return SizedBox();
    }
  }
}
