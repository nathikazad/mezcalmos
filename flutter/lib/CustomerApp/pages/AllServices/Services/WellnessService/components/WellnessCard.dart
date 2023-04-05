import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AssetCard.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/Homes/AssetServiceView/AssetServiceView.dart';

class WellnessCard extends StatelessWidget {
  const WellnessCard({
    super.key,
    required this.title,
    required this.price,
    required this.unitTime,
    required this.timeDuration,
    required this.timeDurationUnit,
    required this.image,
  });

  final String title;
  final double price;
  final String unitTime;
  final String timeDuration;
  final String timeDurationUnit;
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
                Image(
                  image: AssetImage(aPriceCheck),
                ),
                Text("\$$price/$unitTime"),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Icon(
                  Icons.access_time,
                ),
                Text("$timeDuration $timeDurationUnit"),
              ],
            ),
          ),
        ],
      ),
      needDivider: false,
      needBottomTitleText: false,
      onClick: () {
        AssetServiceView.navigate();
      },
    );
  }
}
