import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/Homes/controller/AssetController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/controller/RentalController.dart';
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
              case RentalViewEnum.Classes:
                return ClassCard(
                  title: "Fitness & group exercise",
                  agencyName: "Pueto Fitness",
                  image: NetworkImage(customImageUrl),
                  groupName: "Group Name",
                  price: 30,
                  unitTime: "person",
                );
              case RentalViewEnum.Wellness:
                return WellnessCard(
                  title: "Wellness",
                  timeDuration: "2",
                  timeDurationUnit: "Hours",
                  image: NetworkImage(customImageUrl),
                  price: 30,
                  unitTime: "person",
                );
              case RentalViewEnum.Volunteer:
                return VolunteerCard(
                  title: "Upcycling & inspiring creativity",
                  location: "Sayulita and San Pancho, Mexico",
                  image: NetworkImage(customImageUrl),
                );
              case RentalViewEnum.Tour:
                return TourCard(
                  title: "Undiscovered Mexico",
                  image: NetworkImage(customImageUrl),
                  price: 2000,
                  priceUnit: "person",
                  startDuration: "25",
                  startMonth: "Mar",
                  endDuration: "4",
                  endMonth: "Apr",
                );
              case RentalViewEnum.Activities:
                return ActivitiesCard(
                  title: "Hike to Zapotec villages",
                  image: NetworkImage(customImageUrl),
                  price: 2000,
                  priceUnit: "person",
                  time: "11",
                  timeUnit: "Hours",
                );
            }
          },
        ),
      ),
    );
  }
}
