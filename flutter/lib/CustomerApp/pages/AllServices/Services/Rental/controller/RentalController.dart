import 'package:mezcalmos/Shared/constants/global.dart';
import '../Homes/AssetListsView.dart';

enum RentalViewEnum {
  Surf,
  MotorCycle,
  Car,
  Homes,
  Classes,
}

class RentalController {
  List<Map<String, dynamic>> allRentalValues = [
    {
      "value": RentalViewEnum.Surf,
      "key": "surf",
      "icon": aSurf,
    },
    {
      "value": RentalViewEnum.MotorCycle,
      "key": "motorcycle",
      "icon": aMotocycle,
    },
    {
      "value": RentalViewEnum.Car,
      "key": "car",
      "icon": aCar,
    },
    {
      "value": RentalViewEnum.Homes,
      "key": "homes",
      "icon": aHomes,
    },
  ];
}
