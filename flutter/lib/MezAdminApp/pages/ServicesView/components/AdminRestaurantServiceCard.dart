import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/controllers/AdminServiceViewController.dart';
import 'package:mezcalmos/MezAdminApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["ServicesView"];

class AdminRestaurantServiceCard extends StatelessWidget {
  const AdminRestaurantServiceCard(
      {super.key, required this.restaurant, required this.viewController});
  final Restaurant restaurant;
  final AdminServicesViewController viewController;
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
                      image:
                          CachedNetworkImageProvider(restaurant.info.image))),
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
                        restaurant.info.name,
                        style: Get.textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(
                      height: 18,
                      child: Switch(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: restaurant.state.status == ServiceStatus.Open,
                        onChanged: (bool v) {
                          viewController.switchServiceStatus(
                              serviceId: restaurant.info.hasuraId,
                              providerType: ServiceProviderType.Restaurant,
                              value: v);
                        },
                        activeColor: primaryBlueColor,
                      ),
                    )
                  ],
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(restaurant.info.name)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _smallBtn(
                        icon: Icons.flatware,
                        label: "Menu",
                        ontap: () {
                          MezRouter.toNamed(getRestaurantMenuRoute(
                              restaurantId: restaurant.info.hasuraId));
                        }),
                    _smallBtn(
                        icon: Icons.history,
                        label: "Orders",
                        ontap: () {
                          getserviceOrdersRoute(
                              serviceName: restaurant.info.name,
                              serviceProviderId: restaurant.info.hasuraId,
                              serviceProviderType:
                                  ServiceProviderType.Restaurant);
                        }),
                    _smallBtn(
                        icon: Icons.food_bank,
                        label: "Profile",
                        ontap: () {
                          navigateToServiceInfoEdit(
                              serviceProviderId: restaurant.info.hasuraId,
                              serviceProviderType:
                                  ServiceProviderType.Restaurant);
                        }),
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
