import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AssetCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/Homes/AssetServiceView/AssetServiceView.dart';

class SurfCard extends StatelessWidget {
  const SurfCard({
    super.key,
    required this.title,
    required this.perHourPrice,
    required this.agencyName,
    required this.image,
  });

  final String title;
  final double perHourPrice;
  final String agencyName;
  final NetworkImage image;

  @override
  Widget build(BuildContext context) {
    return AssetCard(
      title: title,
      image: image,
      needCustomSubtitle: true,
      lBottomText: agencyName,
      subtitleWidget: Text(
        "\$${perHourPrice.toStringAsFixed(2)}/hour",
      ),
      onClick: () {
        AssetServiceView.navigate();
      },
    );
  }
}
