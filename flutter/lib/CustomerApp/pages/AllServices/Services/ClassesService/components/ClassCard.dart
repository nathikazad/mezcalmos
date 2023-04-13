import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/AssetServiceView/AssetServiceView.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AssetCard.dart';

class ClassCard extends StatelessWidget {
  const ClassCard({
    super.key,
    required this.title,
    required this.image,
    required this.agencyName,
    required this.groupName,
    required this.price,
    required this.unitTime,
  });

  final String title;
  final NetworkImage image;
  final String agencyName;
  final String groupName;
  final double price;
  final String unitTime;

  @override
  Widget build(BuildContext context) {
    return AssetCard(
      title: title,
      image: image,
      needCustomSubtitle: true,
      lBottomText: agencyName,
      rBottomText: groupName,
      subtitleWidget: Text("\$$price/$unitTime"),
      onClick: () {
        // AssetServiceView.navigate();
      },
    );
  }
}
