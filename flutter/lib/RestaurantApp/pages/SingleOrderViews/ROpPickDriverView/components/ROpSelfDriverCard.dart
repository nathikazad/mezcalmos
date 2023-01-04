import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/User.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpPickDriverView']["components"]["ROpSelfDeliveryCard"];

//
class ROpSelfDeliveryCard extends StatelessWidget {
  const ROpSelfDeliveryCard(
      {super.key, required this.restaurant, required this.assignCallBack});
  final ServiceInfo restaurant;
  final Function()? assignCallBack;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      onTap: assignCallBack,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                    radius: 23,
                    backgroundImage:
                        CachedNetworkImageProvider(restaurant.image)),
                Positioned(
                  right: -35,
                  child: CircleAvatar(
                    radius: 23,
                    child: Icon(
                      Icons.delivery_dining,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 45,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Text(
                '${_i18n()["selfDelivery"]}',
                style: Get.textTheme.bodyText1,
              ),
            ),
            Text(
              '${_i18n()["assign"]}',
              style: Get.textTheme.bodyText1?.copyWith(color: primaryBlueColor),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    ));
  }
}
