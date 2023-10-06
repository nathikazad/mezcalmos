import 'package:mezcalmos/Shared/constants/global.dart';

import '../../../../../../CustomerOldStuff/AllServices/AllServiceListView/controllers/AllServiceListViewController.dart';

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
  Map<AllServiceViewEnum, List<Map<String, dynamic>>> allRentalValues = <, List<Map<String, dynamic>>>{
    AllServiceViewEnum.Rental: <Map<String, dynamic>>[
      <String, >{
        "value": RentalViewEnum.Surf,
        "key": "surf",
        "icon": aSurf,
      },
      <String, >{
        "value": RentalViewEnum.Vehicle,
        "key": "vehicle",
        "icon": aMotocycle,
      },
      <String, >{
        "value": RentalViewEnum.Homes,
        "key": "homes",
        "icon": aHomes,
      },
    ],
    AllServiceViewEnum.Adventure: <Map<String, dynamic>>[
      <String, >{
        "value": RentalViewEnum.Tour,
        "key": "tour",
        "icon": aTours,
      },
      <String, >{
        "value": RentalViewEnum.Activities,
        "key": "activities",
        "icon": aActivities,
      },
    ],
    AllServiceViewEnum.Event: <Map<String, dynamic>>[
      <String, >{
        "value": RentalViewEnum.Parties,
        "key": "parties",
        "icon": aParties,
      },
      <String, >{
        "value": RentalViewEnum.Dance,
        "key": "dance",
        "icon": aDance,
      },
      <String, >{
        "value": RentalViewEnum.GetTogether,
        "key": "getTogether",
        "icon": aGetTogether,
      },
    ],
  };
}
