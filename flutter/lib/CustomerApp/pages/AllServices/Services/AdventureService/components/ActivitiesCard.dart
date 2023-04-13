import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AssetCard.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/AssetServiceView/AssetServiceView.dart';

class ActivitiesCard extends StatelessWidget {
  const ActivitiesCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.priceUnit,
    required this.time,
    required this.timeUnit,
  });

  final String title;
  final double price;
  final String priceUnit;
  final NetworkImage image;
  final String time;
  final String timeUnit;

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
                Text("$time $timeUnit")
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
