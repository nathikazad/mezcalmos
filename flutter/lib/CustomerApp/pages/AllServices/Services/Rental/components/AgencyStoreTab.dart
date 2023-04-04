import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AssetCard.dart';

class AgencyStoreTab extends StatefulWidget {
  const AgencyStoreTab({super.key});

  @override
  State<AgencyStoreTab> createState() => _AgencyStoreTabState();
}

class _AgencyStoreTabState extends State<AgencyStoreTab> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                for (int index = 0; index < 5; index++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AssetCard(
                      title: "Home for rent in Av Juan Pablo II, Pu..",
                      image: NetworkImage(customImageUrl),
                      onClick: () {},
                      needCustomSubtitle: false,
                      needLeadingImage: true,
                      needTrailingImage: false,
                      needDivider: false,
                      needBottomTitleText: false,
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
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
