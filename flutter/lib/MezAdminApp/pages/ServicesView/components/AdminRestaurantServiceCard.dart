import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["ServicesView"];

class AdminRestaurantServiceCard extends StatelessWidget {
  const AdminRestaurantServiceCard({super.key, required this.serviceInfo});
  final UserInfo serviceInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              width: 20.w,
              height: 12.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(serviceInfo.image))),
            ),
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        serviceInfo.name,
                        style: Get.textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(
                      height: 18,
                      child: Switch(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: true,
                        onChanged: (bool v) {
                          // Get.find<RestaurantsInfoController>().setOpen(
                          //     isAv: v,
                          //     restaurantId:
                          //         restaurant.info.hasuraId.toString().toString());
                        },
                        activeColor: primaryBlueColor,
                      ),
                    )
                  ],
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(serviceInfo.name)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _smallBtn(
                        icon: Icons.flatware, label: "Menu", ontap: () {}),
                    _smallBtn(
                        icon: Icons.history, label: "Orders", ontap: () {}),
                    _smallBtn(
                        icon: Icons.food_bank, label: "Profile", ontap: () {}),
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  InkWell _smallBtn(
      {required IconData icon,
      required String label,
      required Function()? ontap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: ontap,
      child: Ink(
        padding: const EdgeInsets.all(3),
        child: Row(
          children: [
            Icon(
              icon,
              size: 17,
              color: primaryBlueColor,
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              label,
              style: Get.textTheme.bodyText1?.copyWith(color: primaryBlueColor),
            )
          ],
        ),
      ),
    );
  }
}
