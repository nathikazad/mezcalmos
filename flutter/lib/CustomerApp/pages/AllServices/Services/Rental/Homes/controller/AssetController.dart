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
  RentalViewEnum.Car: {
    CurrentSelectedViewEnum.Asset: "Car",
    CurrentSelectedViewEnum.Agency: "Store",
  },
  RentalViewEnum.Homes: {
    CurrentSelectedViewEnum.Asset: "Home",
    CurrentSelectedViewEnum.Agency: "Agency",
  },
};

class AssetController {
  late RentalViewEnum viewName;
  late List<IconData> _iconList;
  late Rx<CurrentSelectedViewEnum> currentSelectedView;
  late List<CurrentSelectedViewEnum> currentSelectedViewList;
  late List<String> currentSelectedViewName;

  String get getViewNameString => _getViewString();
  List<IconData> get iconList => _getIconList();

  void init({
    required RentalViewEnum viewEnum,
  }) {
    switch (viewEnum) {
      case RentalViewEnum.Surf:
        viewName = RentalViewEnum.Surf;
        currentSelectedViewList =
            vRentalViewValues[RentalViewEnum.Surf]!.keys.toList();
        break;
      case RentalViewEnum.MotorCycle:
        viewName = RentalViewEnum.MotorCycle;
        currentSelectedViewList =
            vRentalViewValues[RentalViewEnum.MotorCycle]!.keys.toList();
        break;
      case RentalViewEnum.Car:
        viewName = RentalViewEnum.Car;
        currentSelectedViewList =
            vRentalViewValues[RentalViewEnum.Car]!.keys.toList();
        break;
      case RentalViewEnum.Homes:
        viewName = RentalViewEnum.Homes;
        currentSelectedViewList =
            vRentalViewValues[RentalViewEnum.Homes]!.keys.toList();
        break;
    }
    currentSelectedView = currentSelectedViewList.first.obs;
    _generateEnumToString();
  }

  void _generateEnumToString() {
    currentSelectedViewName = currentSelectedViewList
        .map((e) => vRentalViewValues[viewName]![e].toString())
        .toList();
  }

  String _getViewString() {
    switch (viewName) {
      case RentalViewEnum.Surf:
        return "surf";
      case RentalViewEnum.MotorCycle:
        return "motorcycle";
      case RentalViewEnum.Car:
        return "car";
      case RentalViewEnum.Homes:
        return "homes";
    }
  }

  List<IconData> _getIconList() {
    switch (viewName) {
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
      case RentalViewEnum.Car:
        return [
          Icons.directions_car,
          Icons.store,
        ];
      case RentalViewEnum.Homes:
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
