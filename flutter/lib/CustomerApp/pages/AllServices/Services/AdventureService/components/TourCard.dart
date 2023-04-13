import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AssetCard.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/AssetServiceView/AssetServiceView.dart';

class TourCard extends StatelessWidget {
  const TourCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.startDuration,
    required this.endDuration,
    required this.startMonth,
    required this.endMonth,
    required this.priceUnit,
  });

  final String title;
  final double price;
  final String priceUnit;
  final String startDuration;
  final String endDuration;
  final String startMonth;
  final String endMonth;
  final NetworkImage image;

  @override
  Widget build(BuildContext context) {
    return AssetCard(
      title: title,
      image: image,
      needTrailingImage: false,
      needLeadingImage: true,
      needCustomSubtitle: true,
      subtitleWidget: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Image(
                    image: AssetImage(aPriceCheck),
                  ),
                ),
                Text("\$$price/$priceUnit"),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Icon(
                    Icons.access_time,
                  ),
                ),
                Text("$startDuration $startMonth - $endDuration $endMonth")
              ],
            ),
          ),
        ],
      ),
      needDivider: false,
      needBottomTitleText: false,
      onClick: () {
        // AssetServiceView.navigate();
      },
    );
  }
}
