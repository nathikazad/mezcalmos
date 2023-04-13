import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AssetCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/AssetServiceView/AssetServiceView.dart';

class VolunteerCard extends StatelessWidget {
  const VolunteerCard({
    super.key,
    required this.title,
    required this.image,
    required this.location,
  });

  final String title;
  final String location;
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
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Icon(
              Icons.location_on,
              color: Color(0xFF494949),
              size: 22,
            ),
          ),
          Expanded(
            child: Text(location),
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
