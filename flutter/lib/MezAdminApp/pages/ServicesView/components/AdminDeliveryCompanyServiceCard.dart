import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/User.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["ServicesView"];

class AdminDeliveryCompanyServiceCard extends StatelessWidget {
  const AdminDeliveryCompanyServiceCard({super.key, required this.serviceInfo});
  final UserInfo serviceInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundImage: CachedNetworkImageProvider(serviceInfo.image),
            ),
            SizedBox(
              width: 10,
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
                  ],
                ),
                Divider(
                  color: Colors.grey.shade100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // spacing: 5,
                  // runSpacing: 5,
                  // alignment: WrapAlignment.spaceAround,
                  // runAlignment: WrapAlignment.spaceAround,
                  // crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    // _smallBtn(
                    //     icon: Icons.delivery_dining,
                    //     label: "Drivers",
                    //     ontap: () {}),
                    _smallBtn(
                        icon: Icons.price_check, label: "Costs", ontap: () {}),
                    _smallBtn(
                        icon: Icons.history, label: "Orders", ontap: () {}),
                    _smallBtn(
                        icon: Icons.person, label: "Profile", ontap: () {}),
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
          mainAxisSize: MainAxisSize.min,
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
