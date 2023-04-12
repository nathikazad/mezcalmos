import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/SubServiceController.dart';
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
  RentalViewEnum.Vehicle: {
    CurrentSelectedViewEnum.Asset: "Vehicle",
    CurrentSelectedViewEnum.Agency: "Store",
  },
  RentalViewEnum.Homes: {
    CurrentSelectedViewEnum.Asset: "Home",
    CurrentSelectedViewEnum.Agency: "Agency",
  },
  RentalViewEnum.Classes: {
    CurrentSelectedViewEnum.Asset: "Class",
    CurrentSelectedViewEnum.Agency: "Studio",
  },
  RentalViewEnum.Wellness: {
    CurrentSelectedViewEnum.Asset: "Wellness",
  },
  RentalViewEnum.Volunteer: {
    CurrentSelectedViewEnum.Asset: "Volunteer",
  },
  RentalViewEnum.Tour: {
    CurrentSelectedViewEnum.Asset: "Tour",
  },
  RentalViewEnum.Activities: {
    CurrentSelectedViewEnum.Asset: "Activities",
  },
  RentalViewEnum.Parties: {
    CurrentSelectedViewEnum.Asset: "Parties",
  },
  RentalViewEnum.Dance: {
    CurrentSelectedViewEnum.Asset: "Dance",
  },
  RentalViewEnum.GetTogether: {
    CurrentSelectedViewEnum.Asset: "Get Together",
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
      case RentalViewEnum.Vehicle:
        viewName = RentalViewEnum.Vehicle;
        currentSelectedViewList =
            vRentalViewValues[RentalViewEnum.Vehicle]!.keys.toList();
        break;
      case RentalViewEnum.Homes:
        viewName = RentalViewEnum.Homes;
        currentSelectedViewList =
            vRentalViewValues[RentalViewEnum.Homes]!.keys.toList();
        break;
      case RentalViewEnum.Classes:
        viewName = RentalViewEnum.Classes;
        currentSelectedViewList =
            vRentalViewValues[RentalViewEnum.Classes]!.keys.toList();
        break;
      case RentalViewEnum.Wellness:
        viewName = RentalViewEnum.Wellness;
        currentSelectedViewList =
            vRentalViewValues[RentalViewEnum.Wellness]!.keys.toList();
        break;
      case RentalViewEnum.Volunteer:
        viewName = RentalViewEnum.Volunteer;
        currentSelectedViewList =
            vRentalViewValues[RentalViewEnum.Volunteer]!.keys.toList();
        break;
      case RentalViewEnum.Tour:
        viewName = RentalViewEnum.Tour;
        currentSelectedViewList =
            vRentalViewValues[RentalViewEnum.Tour]!.keys.toList();
        break;
      case RentalViewEnum.Activities:
        viewName = RentalViewEnum.Activities;
        currentSelectedViewList =
            vRentalViewValues[RentalViewEnum.Activities]!.keys.toList();
        break;
      case RentalViewEnum.Parties:
        viewName = RentalViewEnum.Parties;
        currentSelectedViewList =
            vRentalViewValues[RentalViewEnum.Parties]!.keys.toList();
        break;
      case RentalViewEnum.Dance:
        viewName = RentalViewEnum.Dance;
        currentSelectedViewList =
            vRentalViewValues[RentalViewEnum.Dance]!.keys.toList();
        break;
      case RentalViewEnum.GetTogether:
        viewName = RentalViewEnum.GetTogether;
        currentSelectedViewList =
            vRentalViewValues[RentalViewEnum.GetTogether]!.keys.toList();
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
      case RentalViewEnum.Vehicle:
        return "vehicle";
      case RentalViewEnum.Homes:
        return "homes";
      case RentalViewEnum.Classes:
        return "classes";
      case RentalViewEnum.Wellness:
        return "wellness";
      case RentalViewEnum.Volunteer:
        return "volunteer";
      case RentalViewEnum.Tour:
        return "tour";
      case RentalViewEnum.Activities:
        return "activities";
      case RentalViewEnum.Parties:
        return "parties";
      case RentalViewEnum.Dance:
        return "dance";
      case RentalViewEnum.GetTogether:
        return "getTogether";
    }
  }

  List<IconData> _getIconList() {
    switch (viewName) {
      case RentalViewEnum.Surf:
        return [
          Icons.surfing,
          Icons.store,
        ];
      case RentalViewEnum.Vehicle:
        return [
          Icons.two_wheeler,
          Icons.store,
        ];
      case RentalViewEnum.Homes:
        return [
          Icons.home,
          Icons.domain,
        ];
      case RentalViewEnum.Classes:
        return [
          Icons.class_,
          Icons.school,
        ];
      case RentalViewEnum.Wellness:
        return [];
      case RentalViewEnum.Volunteer:
        return [];
      case RentalViewEnum.Tour:
        return [];
      case RentalViewEnum.Activities:
        return [];
      case RentalViewEnum.Parties:
        return [];
      case RentalViewEnum.Dance:
        return [];
      case RentalViewEnum.GetTogether:
        return [];
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
