import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class DeliveryDriverState {
  bool isAuthorized;
  bool isOnline;
  DeliveryDriverState({required this.isAuthorized, required this.isOnline});

  factory DeliveryDriverState.fromSnapshot(dynamic data) {
    mezDbgPrint("TaxiDriver ${data}");
    bool isAuthorized =
        data == null ? false : data['authorizationStatus'] == "authorized";
    bool isOnline = data == null ? false : data['isOnline'] == true;
    // String? currentOrder = data == null ? null : data['currentOrderId'];
    return DeliveryDriverState(isAuthorized: isAuthorized, isOnline: isOnline);
  }

  Map<String, dynamic> toJson() =>
      {"authorizationStatus": this.isAuthorized, "isOnline": this.isOnline};
}

class DeliveryDriver {
  DeliveryDriverState taxiState;
  LatLng driverLocation;
  DateTime? lastLocationUpdateTime;

  DeliveryDriver(
      this.taxiState, this.driverLocation, this.lastLocationUpdateTime);

  factory DeliveryDriver.fromSnapshot(DataSnapshot snapshot) {
    DeliveryDriverState taxiState =
        DeliveryDriverState.fromSnapshot(snapshot.value['state']);
    dynamic driverLocation = snapshot.value['location'] == null
        ? null
        : LatLng(snapshot.value["location"]["position"]["lat"],
            snapshot.value["location"]["position"]["lng"]);
    DateTime? lastLocationUpdateTime = snapshot.value['location'] == null
        ? null
        : DateTime.parse(snapshot.value['location']['lastUpdateTime']);
    return DeliveryDriver(taxiState, driverLocation, lastLocationUpdateTime);
  }

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => {
        "authorizationStatus": this.taxiState.isAuthorized,
        "isOnline": this.taxiState.isOnline,
        "driverLocation": driverLocation.toJson(),
        "lastLocationUpdateTime":
            lastLocationUpdateTime?.toUtc().toIso8601String()
      };
}
