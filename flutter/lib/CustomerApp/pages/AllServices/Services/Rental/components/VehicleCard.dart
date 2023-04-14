import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AssetCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/AssetServiceView/AssetServiceView.dart';

class VehicleCard extends StatelessWidget {
  const VehicleCard({
    super.key,
    required this.title,
    required this.perPrice,
    required this.agencyName,
    required this.image,
    required this.serviceId,
    required this.priceUnit,
  });

  final String title;
  final double perPrice;
  final String priceUnit;
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
        "\$${perPrice.toStringAsFixed(2)}/$priceUnit",
      ),
      onClick: () {
        AssetServiceView.navigate(serviceId: serviceId);
      },
    );
  }
}
