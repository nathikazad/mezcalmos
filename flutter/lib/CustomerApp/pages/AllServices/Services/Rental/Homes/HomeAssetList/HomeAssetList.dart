import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/controller/HomeRentalController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/controller/AssetController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/SubServiceController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/SurfCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/HomeCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/VehicleCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/CarCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/ClassesService/components/ClassCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/WellnessService/components/WellnessCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/VolunteerService/components/VolunteerCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/AdventureService/components/TourCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/AdventureService/components/ActivitiesCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/EventsService/components/PartiesCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class HomeAssetList extends StatefulWidget {
  const HomeAssetList({super.key, required this.homeRentalController});
  @override
  State<HomeAssetList> createState() => _HomeAssetListState();
  final HomeRentalController homeRentalController;
}

class _HomeAssetListState extends State<HomeAssetList> {
  final AssetController assetController = Get.find<AssetController>();
  final LanguageController languageController = Get.find<LanguageController>();
  final HomeRentalController homeRentalController = HomeRentalController();

  @override
  void initState() {
    super.initState();
    homeRentalController.init();
  }

  @override
  Widget build(BuildContext context) {
    final HomeRentalController homeRentalController =
        widget.homeRentalController;
    var txt = Theme.of(context).textTheme;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => homeRentalController.homeRentalData.isEmpty
              ? const Center(
                  child: Text("Empty"),
                )
              : ListView.builder(
                  controller: homeRentalController.homeScrollController,
                  itemCount: homeRentalController.homeRentalData.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String title = homeRentalController
                            .homeRentalData[index]
                            .details
                            .name[languageController.userLanguageKey] ??
                        homeRentalController
                            .homeRentalData[index].details.name[Language.EN]
                            .toString();
                    mezDbgPrint(
                        "homeRentalController ${homeRentalController.homeRentalData[index].details.toFirebaseFormattedJson()}");
                    return HomeCard(
                      title: title,
                      agencyName: "Puerto Estate",
                      image: NetworkImage(customImageUrl),
                      perDayPrice: 234,
                      roomSpace: 330,
                      totalRooms: 3,
                    );
                    // switch (assetController.viewName) {
                    //   case RentalViewEnum.Surf:
                    //     return SurfCard(
                    //       title: "Surfboard 1.5hr rental",
                    //       agencyName: "Puerto surf",
                    //       image: NetworkImage(customImageUrl),
                    //       perHourPrice: 17,
                    //     );
                    //   case RentalViewEnum.Vehicle:
                    //     return VehicleCard(
                    //       title: "KAWAZAKI NINJA ZX-6R",
                    //       agencyName: "Ride N Explore",
                    //       image: NetworkImage(customImageUrl),
                    //       perdayPrice: 54,
                    //     );
                    //   case RentalViewEnum.Homes:
                    //     return HomeCard(
                    //       title: "Home for rent in Av Juan Pablo II...",
                    //       agencyName: "Puerto Estate",
                    //       image: NetworkImage(customImageUrl),
                    //       perDayPrice: 234,
                    //       roomSpace: 330,
                    //       totalRooms: 3,
                    //     );
                    //   case RentalViewEnum.Classes:
                    //     return ClassCard(
                    //       title: "Fitness & group exercise",
                    //       agencyName: "Pueto Fitness",
                    //       image: NetworkImage(customImageUrl),
                    //       groupName: "Group Name",
                    //       price: 30,
                    //       unitTime: "person",
                    //     );
                    //   case RentalViewEnum.Wellness:
                    //     return WellnessCard(
                    //       title: "Wellness",
                    //       timeDuration: "2",
                    //       timeDurationUnit: "Hours",
                    //       image: NetworkImage(customImageUrl),
                    //       price: 30,
                    //       unitTime: "person",
                    //     );
                    //   case RentalViewEnum.Volunteer:
                    //     return VolunteerCard(
                    //       title: "Upcycling & inspiring creativity",
                    //       location: "Sayulita and San Pancho, Mexico",
                    //       image: NetworkImage(customImageUrl),
                    //     );
                    //   case RentalViewEnum.Tour:
                    //     return TourCard(
                    //       title: "Undiscovered Mexico",
                    //       image: NetworkImage(customImageUrl),
                    //       price: 2000,
                    //       priceUnit: "person",
                    //       startDuration: "25",
                    //       startMonth: "Mar",
                    //       endDuration: "4",
                    //       endMonth: "Apr",
                    //     );
                    //   case RentalViewEnum.Activities:
                    //     return ActivitiesCard(
                    //       title: "Hike to Zapotec villages",
                    //       image: NetworkImage(customImageUrl),
                    //       price: 2000,
                    //       priceUnit: "person",
                    //       time: "11",
                    //       timeUnit: "Hours",
                    //     );
                    //   case RentalViewEnum.Parties:
                    //     return PartiesCard(
                    //       title: "Amazonia beach party",
                    //       price: 50,
                    //       priceUnit: "person",
                    //       image: NetworkImage(customImageUrl),
                    //       rating: "4.5",
                    //     );
                    //   case RentalViewEnum.Dance:
                    //     return PartiesCard(
                    //       title: "Amazonia Dance",
                    //       price: 10,
                    //       priceUnit: "person",
                    //       image: NetworkImage(customImageUrl),
                    //       rating: "4.9",
                    //     );
                    //   case RentalViewEnum.GetTogether:
                    //     return PartiesCard(
                    //       title: "Amazonia Get Together",
                    //       price: 10,
                    //       priceUnit: "person",
                    //       image: NetworkImage(customImageUrl),
                    //       rating: "4.7",
                    //     );
                    // }
                  },
                ),
        ),
      ),
    );
  }
}
