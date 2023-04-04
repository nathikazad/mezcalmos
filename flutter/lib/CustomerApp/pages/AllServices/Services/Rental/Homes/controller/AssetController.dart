import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/controller/RentalController.dart';
import 'package:flutter/material.dart';

enum CurrentSelectedViewEnum {
  Asset,
  Agency,
}

Map<RentalViewEnum, Map<CurrentSelectedViewEnum, String>> vRentalViewValues = {
  RentalViewEnum.Surf: {
    CurrentSelectedViewEnum.Asset: "Board",
    CurrentSelectedViewEnum.Agency: "Store",
  },
  RentalViewEnum.MotorCycle: {
    CurrentSelectedViewEnum.Asset: "Vehicle",
    CurrentSelectedViewEnum.Agency: "Store",
  },
  RentalViewEnum.Homes: {
    CurrentSelectedViewEnum.Asset: "Home",
    CurrentSelectedViewEnum.Agency: "Agency",
  },
};

class AssetController {
  late RentalViewEnum _viewName;
  late List<IconData> _iconList;
  late Rx<CurrentSelectedViewEnum> currentSelectedView;
  late List<CurrentSelectedViewEnum> currentSelectedViewList;
  late List<String> currentSelectedViewName;

  String get viewName => _getViewString();
  List<IconData> get iconList => _getIconList();

  void init({
    required RentalViewEnum viewEnum,
  }) {
    switch (viewEnum) {
      case RentalViewEnum.Surf:
        _viewName = RentalViewEnum.Surf;
        currentSelectedViewList =
            vRentalViewValues[RentalViewEnum.Surf]!.keys.toList();
        break;
      case RentalViewEnum.MotorCycle:
        _viewName = RentalViewEnum.MotorCycle;
        currentSelectedViewList =
            vRentalViewValues[RentalViewEnum.MotorCycle]!.keys.toList();
        break;
      case RentalViewEnum.Homes:
        _viewName = RentalViewEnum.Homes;
        currentSelectedViewList =
            vRentalViewValues[RentalViewEnum.Homes]!.keys.toList();
        break;
    }
    currentSelectedView = currentSelectedViewList.first.obs;
    _generateEnumToString();
  }

  void _generateEnumToString() {
    currentSelectedViewName = currentSelectedViewList
        .map((e) => vRentalViewValues[_viewName]![e].toString())
        .toList();
  }

  String _getViewString() {
    switch (_viewName) {
      case RentalViewEnum.Surf:
        return "surf";
      case RentalViewEnum.MotorCycle:
        return "motorcycle";
      case RentalViewEnum.Homes:
        return "homes";
      default:
        return "surf";
    }
  }

  List<IconData> _getIconList() {
    switch (_viewName) {
      case RentalViewEnum.Surf:
        return [
          Icons.surfing,
          Icons.store,
        ];
      case RentalViewEnum.MotorCycle:
        return [
          Icons.two_wheeler,
          Icons.store,
        ];
      case RentalViewEnum.Homes:
        return [
          Icons.home,
          Icons.domain,
        ];
      default:
        return [
          Icons.home,
          Icons.domain,
        ];
    }
  }

  void toggleView(Enum value) {
    if (currentSelectedView.value == value) {
      return;
    }
    if (value == currentSelectedViewList[0]) {
      currentSelectedView.value = currentSelectedViewList[0];
    } else {
      currentSelectedView.value = currentSelectedViewList[1];
    }
  }

  void dispose() {
    currentSelectedView.close();
  }
}
