import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Courrier/CustCourierServiceView/CustCourierServiceView.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/widgets/Buttons/MezInkwell.dart';
import 'package:sizer/sizer.dart';

class MezOrderDeliverySelector extends StatelessWidget {
  final List<DeliveryCompany> deliveryCompanies;
  final List<int> selectedCompanies;
  final double minDeliveryPrice;
  final double maxDeliveryPrice;
  final double estDeliveryPrice;
  final ValueChanged<DeliveryCompany> onCompanySelect;
  final ValueChanged<double> onEstDeliveryPriceChange;

  const MezOrderDeliverySelector({
    required this.deliveryCompanies,
    required this.selectedCompanies,
    this.minDeliveryPrice = 40,
    this.maxDeliveryPrice = 200,
    required this.estDeliveryPrice,
    required this.onCompanySelect,
    required this.onEstDeliveryPriceChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose Company',
          style: context.textTheme.bodyLarge,
        ),
        SizedBox(
          height: 5,
        ),
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Icon(
                  Icons.info_outline_rounded,
                  color: primaryBlueColor,
                  size: 15.sp,
                ),
              ),
              WidgetSpan(child: SizedBox(width: 3)),
              TextSpan(
                text: 'Choose Company Info',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: primaryBlueColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Obx(
          () => Column(
            children: deliveryCompanies.map((DeliveryCompany company) {
              return deliveryCompanySelectCard(
                context: context,
                deliveryCompany: company,
                isSelected: selectedCompanies.contains(company.info.hasuraId),
                onSelect: (DeliveryCompany selectedCompany) {
                  onCompanySelect(selectedCompany);
                },
              );
            }).toList(),
          ),
        ),
        smallSepartor,
        Text(
          "Enter the approximate amount you are willing to pay for the delivery of this order, we will notify all the drivers next to you.",
          style: context.textTheme.bodyLarge,
        ),
        smallSepartor,
        Slider(
          min: minDeliveryPrice,
          max: maxDeliveryPrice,
          thumbColor: primaryBlueColor,
          inactiveColor: secondaryLightBlueColor,
          activeColor: primaryBlueColor,
          label: estDeliveryPrice.toPriceString(),
          value: estDeliveryPrice,
          onChanged: (double v) {
            onEstDeliveryPriceChange(v);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(minDeliveryPrice.toPriceString()),
            Text(maxDeliveryPrice.toPriceString()),
          ],
        ),
      ],
    );
  }
}

void navigateToCourierServiceView(DeliveryCompany deliveryCompany) {
  // ignore: unawaited_futures
  CustCourierServiceView.navigate(
    companyId: deliveryCompany.info.hasuraId,
  );
}

Widget deliveryCompanySelectCard({
  required BuildContext context,
  required DeliveryCompany deliveryCompany,
  required bool isSelected,
  required void Function(DeliveryCompany) onSelect,
}) {
  return Card(
    margin: const EdgeInsets.only(bottom: 10),
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: CachedNetworkImageProvider(
              deliveryCompany.info.image,
            ),
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
                      label: 'View',
                      textColor: primaryBlueColor,
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                      onClick: () async =>
                          navigateToCourierServiceView(deliveryCompany),
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
                      "${deliveryCompany.rate?.toStringAsFixed(1)}(${deliveryCompany.numberOfReviews})",
                    ),
                  ],
                ),
              ],
            ),
          ),
          Checkbox(
            value: isSelected,
            onChanged: (bool? value) => onSelect(deliveryCompany),
          ),
        ],
      ),
    ),
  );
}
