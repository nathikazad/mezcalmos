import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/controllers/AdminServiceViewController.dart';
import 'package:mezcalmos/MezAdminApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["MezAdmin"]["pages"]
    ["AdminServicesView"]["components"]["adminServiceCard"];

class AdminDeliveryCompanyServiceCard extends StatelessWidget {
  const AdminDeliveryCompanyServiceCard(
      {super.key, required this.company, required this.viewController});
  final DeliveryCompany company;
  final AdminServicesViewController viewController;

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
              backgroundImage: CachedNetworkImageProvider(company.info.image),
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
                        company.info.name,
                        style: Get.textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(
                      height: 18,
                      child: Switch(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: company.state.status == ServiceStatus.Open,
                        onChanged: (bool v) {
                          mezDbgPrint(v);
                          viewController.switchServiceStatus(
                              serviceId: company.info.hasuraId,
                              providerType: ServiceProviderType.DeliveryCompany,
                              value: v);
                        },
                        activeColor: primaryBlueColor,
                      ),
                    )
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
                        icon: Icons.price_check,
                        label: "${_i18n()['costs']}",
                        ontap: () {
                          navigateToDeliveryCost(
                              deliveryDetailsId: company.deliveryDetailsId!);
                        }),
                    _smallBtn(
                        icon: Icons.history,
                        label: "${_i18n()['orders']}",
                        ontap: () {
                          getserviceOrdersRoute(
                              serviceName: company.info.name,
                              serviceProviderId: company.info.hasuraId,
                              serviceProviderType:
                                  ServiceProviderType.DeliveryCompany);
                        }),
                    _smallBtn(
                        icon: Icons.person,
                        label: "${_i18n()['profile']}",
                        ontap: () {
                          navigateToServiceInfoEdit(
                              serviceDetailsId: company.info.hasuraId,
                              serviceProviderType:
                                  ServiceProviderType.DeliveryCompany);
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
