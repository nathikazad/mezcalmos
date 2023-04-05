import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/Homes/controller/AssetController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/controller/RentalController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/SurfCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/HomeCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/VehicleCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/CarCard.dart';

class AssetListView extends StatefulWidget {
  const AssetListView({super.key});
  @override
  State<AssetListView> createState() => _AssetListViewState();
}

class _AssetListViewState extends State<AssetListView> {
  final AssetController assetController = Get.find<AssetController>();

  @override
  Widget build(BuildContext context) {
    var txt = Theme.of(context).textTheme;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            switch (assetController.viewName) {
              case RentalViewEnum.Surf:
                return SurfCard(
                  title: "Surfboard 1.5hr rental",
                  agencyName: "Puerto surf",
                  image: NetworkImage(customImageUrl),
                  perHourPrice: 17,
                );
              case RentalViewEnum.MotorCycle:
                return VehicleCard(
                  title: "KAWAZAKI NINJA ZX-6R",
                  agencyName: "Ride N Explore",
                  image: NetworkImage(customImageUrl),
                  perdayPrice: 54,
                );
              case RentalViewEnum.Car:
                return CarCard(
                  title: "Volkswagen Polo VI",
                  agencyName: "Snap Auto Rental",
                  image: NetworkImage(customImageUrl),
                  perdayPrice: 64,
                );
              case RentalViewEnum.Homes:
                return HomeCard(
                  title: "Home for rent in Av Juan Pablo II...",
                  agencyName: "Puerto Estate",
                  image: NetworkImage(customImageUrl),
                  perDayPrice: 234,
                  roomSpace: 330,
                  totalRooms: 3,
                );
            }
            // return Padding(
            //   padding: const EdgeInsets.only(bottom: 8.0),
            //   child: AssetCard(
            //     title: "House for rent in Puerto Escondido",
            //     onClick: () {
            //       AssetServiceView.navigate();
            //     },
            //     image: NetworkImage(customImageUrl),
            //     lBottomText: "Company Name",
            //     rBottomText: "Company Name 2",
            //     subtitleWidget: Text("Hello"),
            //     needBottomTitleText: true,
            //     needDivider: true,
            //     needLeadingImage: false,
            //     needTrailingImage: true,
            //     needCustomSubtitle: false,
            //     subtitleIconData: [
            //       aPriceCheck,
            //       aSingleBed,
            //       aHouseSliding,
            //     ],
            //     subtitleIconString: [
            //       "\$234/day",
            //       "3 bedrooms",
            //       "330m²",
            //     ],
            //   ),
            // );
          },
        ),
      ),
    );
  }
}
