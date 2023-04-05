import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AssetCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/Homes/AssetServiceView/AssetServiceView.dart';

class CarCard extends StatelessWidget {
  const CarCard({
    super.key,
    required this.title,
    required this.perdayPrice,
    required this.agencyName,
    required this.image,
  });

  final String title;
  final double perdayPrice;
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
        "\$${perdayPrice.toStringAsFixed(2)}/day",
      ),
      onClick: () {
        AssetServiceView.navigate();
      },
    );
  }
}
