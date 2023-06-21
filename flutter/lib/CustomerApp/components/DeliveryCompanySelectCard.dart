import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Courrier/CustCourierServiceView/CustCourierServiceView.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/widgets/Buttons/MezInkwell.dart';

class DeliveryCompanySelectCard extends StatelessWidget {
  final DeliveryCompany deliveryCompany;
  final bool isSelected;
  final void Function(DeliveryCompany) onSelect;
  const DeliveryCompanySelectCard({
    super.key,
    required this.deliveryCompany,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage:
                  CachedNetworkImageProvider(deliveryCompany.info.image),
            ),
            const SizedBox(width: 10),
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      deliveryCompany.info.name,
                      style: context.textTheme.bodyLarge,
                    ),
                    SizedBox(width: 3),
                    MezInkwell(
                      backgroundColor: Colors.transparent,
                      label: "View",
                      textColor: primaryBlueColor,
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                      onClick: () async {
                        // ignore: unawaited_futures
                        CustCourierServiceView.navigate(
                          companyId: deliveryCompany.info.hasuraId,
                        );
                      },
                    ),
                  ],
                ),
                smallSepartor,
                Row(
                  children: [
                    Text(
                        "${deliveryCompany.deliveryCost!.costPerKm.toPriceString()}/KM"),
                    const SizedBox(width: 5),
                    Text("${6} Drivers"),
                    const SizedBox(width: 5),
                    Icon(Icons.star_rate_rounded, color: primaryBlueColor),
                    Text(
                        "${deliveryCompany.rate?.toStringAsFixed(1)}(${deliveryCompany.numberOfReviews})"),
                  ],
                ),
              ],
            )),
            Checkbox(
                value: isSelected,
                onChanged: (bool? value) => onSelect(deliveryCompany))
          ],
        ),
      ),
    );
  }
}
