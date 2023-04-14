import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AssetCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/AssetServiceView/AssetServiceView.dart';

class SurfCard extends StatelessWidget {
  const SurfCard({
    super.key,
    required this.title,
    required this.perPrice,
    required this.agencyName,
    required this.image,
    required this.perPriceUnit, required this.serviceId,
  });

  final String title;
  final double perPrice;
  final String perPriceUnit;
  final String agencyName;
  final NetworkImage image;
  final String serviceId;

  @override
  Widget build(BuildContext context) {
    return AssetCard(
      title: title,
      image: image,
      needCustomSubtitle: true,
      lBottomText: agencyName,
      subtitleWidget: Text(
        "\$${perPrice.toStringAsFixed(2)}/$perPriceUnit",
      ),
      onClick: () {
        AssetServiceView.navigate(serviceId: serviceId);
      },
    );
  }
}
