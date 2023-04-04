import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AssetCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/Homes/AssetServiceView/AssetServiceView.dart';

class AssetListView extends StatefulWidget {
  const AssetListView({super.key});

  @override
  State<AssetListView> createState() => _AssetListViewState();
}

class _AssetListViewState extends State<AssetListView> {
  @override
  Widget build(BuildContext context) {
    var txt = Theme.of(context).textTheme;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: AssetCard(
                title: "House for rent in Puerto Escondido",
                onClick: () {
                  AssetServiceView.navigate();
                },
                image: NetworkImage(customImageUrl),
                lBottomText: "Company Name",
                rBottomText: "Company Name 2",
                subtitleWidget: Text("Hello"),
                needBottomTitleText: true,
                needDivider: true,
                needLeadingImage: false,
                needTrailingImage: true,
                needCustomSubtitle: false,
                subtitleIconData: [
                  aPriceCheck,
                  aSingleBed,
                  aHouseSliding,
                ],
                subtitleIconString: [
                  "\$234/day",
                  "3 bedrooms",
                  "330m²",
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
