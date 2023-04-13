import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AssetCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/AssetServiceView/AssetServiceView.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/controller/AgencyController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.title,
    required this.perDayPrice,
    required this.totalRooms,
    required this.roomSpace,
    required this.agencyName,
    required this.image,
    required this.serviceId,
  });

  final String title;
  final double perDayPrice;
  final int totalRooms;
  final double roomSpace;
  final String agencyName;
  final NetworkImage image;
  final String serviceId;

  @override
  Widget build(BuildContext context) {
    return AssetCard(
      title: title,
      image: image,
      lBottomText: agencyName,
      needCustomSubtitle: false,
      subtitleIconData: [
        aPriceCheck,
        aSingleBed,
        aHouseSliding,
      ],
      subtitleIconString: [
        "\$$perDayPrice/day",
        "$totalRooms bedrooms",
        "${roomSpace}m²",
      ],
      onClick: () {
        AssetServiceView.navigate(serviceId: serviceId);
      },
    );
  }
}
