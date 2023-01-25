import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/pages/CreateServiceOnboarding/controllers/CreateServiceViewController.dart';

class CreateServiceDeliveryCompaniesList extends StatefulWidget {
  const CreateServiceDeliveryCompaniesList(
      {super.key, required this.viewController});
  final CreateServiceViewController viewController;

  @override
  State<CreateServiceDeliveryCompaniesList> createState() =>
      _CreateServiceDeliveryCompaniesListState();
}

class _CreateServiceDeliveryCompaniesListState
    extends State<CreateServiceDeliveryCompaniesList> {
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
                Container(
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      "Delivery partner next to you",
                      style: Get.textTheme.bodyText1,
                    )),
                SizedBox(
                  height: 10,
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
              child: Text("No dleivery companies found"),
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
              width: 5,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Text(
                company.info.name,
                style: Get.textTheme.bodyText1,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            radioCircleButton(
                value: widget
                        .viewController.serviceInput.value.deliveryPartnerId ==
                    company.info.hasuraId,
                onTap: (bool? v) {
                  widget.viewController.serviceInput.value.deliveryPartnerId =
                      company.info.hasuraId;
                  widget.viewController.serviceInput.refresh();
                })
          ],
        ),
      ),
    );
  }
}
