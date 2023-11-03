// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart' as mat;
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cm;
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

class TaxiOrder {
  int id;
  cm.MinimalDeliveryOrderStatus status;
  MezLocation pickupLocation;
  MezLocation dropoffLocation;
  UserInfo customer;
  UserInfo? driver;
  num rideCost;
  DateTime orderTime;
  TaxiCarType carType;
  RouteInformation routeInformation;
  //
  TaxiOrder({
    required this.id,
    required this.status,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.customer,
    this.driver,
    required this.rideCost,
    required this.orderTime,
    required this.carType,
    required this.routeInformation,
  });
  //

  bool get hasDriver => driver != null;
  bool get inProcess => status != cm.MinimalDeliveryOrderStatus.Finished;
}

enum TaxiCarType { Mini, Suv }

extension ParseTaxiCarTypeToString on TaxiCarType {
  mat.IconData get icon {
    switch (this) {
      case TaxiCarType.Mini:
        return mat.Icons.local_taxi_rounded;
      case TaxiCarType.Suv:
        return mat.Icons.airport_shuttle_rounded;
    }
  }

  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToTaxiCarType on String {
  TaxiCarType toTaxiCarType() {
    return TaxiCarType.values.firstWhere((TaxiCarType TaxiCarType) =>
        TaxiCarType.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}
