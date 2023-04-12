import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/controller/AssetController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AgencyStoreTile.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/SubServiceController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AssetCard.dart';
import 'package:get/get.dart';

class AgencyStoreTab extends StatefulWidget {
  const AgencyStoreTab({super.key});

  @override
  State<AgencyStoreTab> createState() => _AgencyStoreTabState();
}

class _AgencyStoreTabState extends State<AgencyStoreTab> {
  final AssetController assetController = Get.find<AssetController>();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                switch (assetController.viewName) {
                  case RentalViewEnum.Homes:
                    return Padding(
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
                    );
                  case RentalViewEnum.Surf:
                    return AgencyStoreTile(
                      title: "Surfboard + wetsuit rental",
                      image: NetworkImage(customImageUrl),
                      price: 27,
                      unitTime: "hour",
                    );
                  case RentalViewEnum.Vehicle:
                    return AgencyStoreTile(
                      title: "ROYAL ENFIELD CLASSIC 500",
                      image: NetworkImage(customImageUrl),
                      price: 50,
                      unitTime: "day",
                    );
                  case RentalViewEnum.Classes:
                    return AgencyStoreTile(
                      title: "6 days surf camp",
                      image: NetworkImage(customImageUrl),
                      price: 40,
                      unitTime: "person",
                    );
                  case RentalViewEnum.Wellness:
                    // Wellness screen not going to navigate here thats why no UI needed
                    return Offstage();
                  case RentalViewEnum.Volunteer:
                    // Volunteer screen not going to navigate here thats why no UI needed
                    return Offstage();
                  case RentalViewEnum.Tour:
                    // Tour screen not going to navigate here thats why no UI needed
                    return Offstage();
                  case RentalViewEnum.Activities:
                    // Activities screen not going to navigate here thats why no UI needed
                    return Offstage();
                  case RentalViewEnum.Parties:
                    // Parties screen not going to navigate here thats why no UI needed
                    return Offstage();
                  case RentalViewEnum.Dance:
                    // Dance screen not going to navigate here thats why no UI needed
                    return Offstage();
                  case RentalViewEnum.GetTogether:
                    // GetTogether screen not going to navigate here thats why no UI needed
                    return Offstage();
                }
              },
              childCount: 10,
            ),
          ),
        ),
      ],
    );
  }
}
