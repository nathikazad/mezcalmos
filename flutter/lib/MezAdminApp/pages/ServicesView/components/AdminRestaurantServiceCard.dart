import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/User.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["ServicesView"];

class AdminServiceCard extends StatelessWidget {
  const AdminServiceCard({super.key, required this.serviceInfo});
  final UserInfo serviceInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 5),
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      CachedNetworkImageProvider(serviceInfo.image),
                ),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    serviceInfo.name,
                    style: Get.textTheme.bodyText1,
                  ),
                ),
                // Switch(
                //   // TODO: Switch open @m66are
                //   value: restaurant.state.approved,
                //   onChanged: (bool v) {
                //     Get.find<RestaurantsInfoController>().setOpen(
                //         isAv: v,
                //         restaurantId:
                //             restaurant.info.hasuraId.toString().toString());
                //   },
                //   activeColor: primaryBlueColor,
                // )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                        foregroundColor: primaryBlueColor,
                        backgroundColor: Colors.transparent,
                        textStyle: Get.textTheme.bodyText1,
                        padding: const EdgeInsets.all(3)),
                    onPressed: () {
                      // MezRouter.toNamed(
                      //   getROpEditInfoRoute(
                      //     restaurantId: restaurant.info.hasuraId,
                      //   ),
                      // );
                    },
                    icon: Icon(Icons.person),
                    label: Text('${_i18n()["editProfile"]}'),
                  ),
                ),
                Flexible(
                  child: TextButton.icon(
                    onPressed: () {
                      // MezRouter.toNamed(
                      //   getROpMenuRoute(
                      //     restaurantId: restaurant.info.hasuraId,
                      //   ),
                      // );
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: primaryBlueColor,
                        backgroundColor: Colors.transparent,
                        textStyle: Get.textTheme.bodyText1,
                        padding: const EdgeInsets.all(3)),
                    icon: Icon(Icons.settings),
                    label: Text('${_i18n()["editAdmin"]}'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
