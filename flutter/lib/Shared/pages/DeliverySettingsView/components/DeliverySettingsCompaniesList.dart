import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/pages/DeliverySettingsView/controllers/DeliverySettingsViewController.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

class DeliverySettingsCompaniesList extends StatefulWidget {
  const DeliverySettingsCompaniesList(
      {super.key, required this.viewController});
  final DeliverySettingsViewController viewController;

  @override
  State<DeliverySettingsCompaniesList> createState() =>
      _DeliverySettingsCompaniesListState();
}

class _DeliverySettingsCompaniesListState
    extends State<DeliverySettingsCompaniesList> {
  @override
  void initState() {
    widget.viewController.getDeliveryCompanies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Obx(
        () {
          if (widget.viewController.deliveryCompanies.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      "Delivery partner next to you",
                      style: Get.textTheme.bodyText1,
                    )),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: List.generate(
                      widget.viewController.deliveryCompanies.length,
                      (int index) => _companyCard(
                          widget.viewController.deliveryCompanies[index])),
                )
              ],
            );
          } else {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.delivery_dining,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      Positioned(
                        right: -50,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 35,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey.shade200,
                            child: Icon(
                              Icons.handshake,
                              size: 25,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "No delivery partners found",
                    style: Get.textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Unfortunately, there are no delivery companies next to you but if you know of any delivery company you can share this link with them and when they register you can make them your delivery partner.",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    color: Colors.grey.shade200,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Flexible(fit: FlexFit.tight, child: Text("Link")),
                          MezIconButton(
                            onTap: () {},
                            icon: Icons.copy_outlined,
                            iconSize: 25,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _companyCard(DeliveryCompany company) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: CachedNetworkImageProvider(company.info.image),
            ),
            SizedBox(
              width: 15,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    company.info.name,
                    style: Get.textTheme.bodyText1,
                  ),
                  Text(
                      "Joined ${DateFormat.yMMMEd().format(company.creationTime)}")
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            radioCircleButton(
                value:
                    widget.viewController.getPartnerId == company.info.hasuraId,
                onTap: (bool? v) {
                  widget.viewController
                      .pickDeliveryCompany(company.info.hasuraId);
                })
          ],
        ),
      ),
    );
  }
}
