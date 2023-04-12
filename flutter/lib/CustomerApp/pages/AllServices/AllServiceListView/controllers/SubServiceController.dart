import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/AllServiceListViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

enum RentalViewEnum {
  Surf,
  Vehicle,
  Homes,
  Classes,
  Wellness,
  Volunteer,
  Tour,
  Activities,
  Parties,
  Dance,
  GetTogether,
}

class SubServiceController {
  Map<AllServiceViewEnum, List<Map<String, dynamic>>> allRentalValues = {
    AllServiceViewEnum.Rental: [
      {
        "value": RentalViewEnum.Surf,
        "key": "surf",
        "icon": aSurf,
      },
      {
        "value": RentalViewEnum.Vehicle,
        "key": "vehicle",
        "icon": aMotocycle,
      },
      {
        "value": RentalViewEnum.Homes,
        "key": "homes",
        "icon": aHomes,
      },
    ],
    AllServiceViewEnum.Adventure: [
      {
        "value": RentalViewEnum.Tour,
        "key": "tour",
        "icon": aTours,
      },
      {
        "value": RentalViewEnum.Activities,
        "key": "activities",
        "icon": aActivities,
      },
    ],
    AllServiceViewEnum.Event: [
      {
        "value": RentalViewEnum.Parties,
        "key": "parties",
        "icon": aParties,
      },
      {
        "value": RentalViewEnum.Dance,
        "key": "dance",
        "icon": aDance,
      },
      {
        "value": RentalViewEnum.GetTogether,
        "key": "getTogether",
        "icon": aGetTogether,
      },
    ],
  };
}
