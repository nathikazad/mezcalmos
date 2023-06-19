import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServicesListView/BsOpServicesListView.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/controllers/AdminServiceViewController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceProfileView/ServiceProfileView.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["MezAdmin"]["pages"]
    ["AdminServicesView"]["components"]["adminServiceCard"];

class AdminBsServiceCard extends StatelessWidget {
  const AdminBsServiceCard(
      {super.key, required this.business, required this.viewController});

  final Business business;
  final AdminServicesViewController viewController;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 23,
              backgroundImage:
                  CachedNetworkImageProvider(business.details.image),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        child: RichText(
                            text: TextSpan(
                                text: business.details.name,
                                style: context.txt.bodyLarge,
                                children: [
                              WidgetSpan(
                                child: MezIconButton(
                                  onTap: () async {
                                    await viewController.messageService(
                                        serviceId: business.id.toInt(),
                                        type: RecipientType.Business);
                                  },
                                  icon: Icons.textsms_rounded,
                                  backgroundColor: primaryBlueColor,
                                  iconColor: Colors.white,
                                  margin: EdgeInsets.only(left: 12),
                                ),
                              )
                            ]))),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 18,
                      child: Switch(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: business.details.openStatus == OpenStatus.Open,
                        onChanged: (bool v) {
                          viewController.switchServiceStatus(
                              serviceDetailsId: business.details.id.toInt(),
                              providerType: ServiceProviderType.Business,
                              value: v);
                        },
                        activeColor: primaryBlueColor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _smallBtn(
                        icon: Icons.sell_rounded,
                        context: context,
                        label: "${_i18n()['offerings']}",
                        ontap: () {
                          BsOpServicesListView.navigate(
                              id: business.id.toInt(),
                              detailsId: business.details.id.toInt(),
                              profile: business.profile);
                        }),
                    _smallBtn(
                        icon: Icons.person,
                        context: context,
                        label: "${_i18n()['profile']}",
                        ontap: () {
                          ServiceProfileView.navigate(
                            deliveryDetailsId: null,
                            serviceProviderId: business.id.toInt(),
                            serviceDetailsId: business.details.id.toInt(),
                          );
                        }),
                  ],
                ),
                if (business.details.approved == false)
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Flexible(
                            child: MezButton(
                                height: 45,
                                backgroundColor: offRedColor,
                                textColor: Colors.red,
                                label: "${_i18n()['reject']}",
                                onClick: () async {
                                  await viewController.deleteService(
                                    serviceProviderType:
                                        ServiceProviderType.Business,
                                    serviceProviderId: business.id.toInt(),
                                  );
                                })),
                        SizedBox(
                          width: 8,
                        ),
                        Flexible(
                            child: MezButton(
                                height: 45,
                                backgroundColor: primaryBlueColor,
                                textColor: Colors.white,
                                label: "${_i18n()['accept']}",
                                onClick: () async {
                                  await viewController.approveService(
                                    detailsId: business.details.id.toInt(),
                                  );
                                })),
                      ],
                    ),
                  )
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
      required BuildContext context,
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
              style: context.txt.bodyLarge?.copyWith(color: primaryBlueColor),
            )
          ],
        ),
      ),
    );
  }
}
