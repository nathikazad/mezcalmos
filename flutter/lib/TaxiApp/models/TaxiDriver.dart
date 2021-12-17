import 'package:firebase_database/firebase_database.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class TaxiState {
  bool isAuthorized;
  bool isLooking;
  String? currentOrder;
  TaxiState(this.isAuthorized, this.isLooking, [this.currentOrder]);

  factory TaxiState.fromSnapshot(dynamic data) {
    mezDbgPrint("TaxiDriver ${data}");
    bool isAuthorized =
        data == null ? false : data['authorizationStatus'] == "authorized";
    bool isLooking = data == null ? false : data['isLooking'] == true;
    String? currentOrder = data == null ? null : data['currentOrderId'];
    return TaxiState(isAuthorized, isLooking, currentOrder);
  }

  Map<String, dynamic> toJson() => {
        "authorizationStatus": this.isAuthorized,
        "isLooking": this.isLooking,
        "currentOrderId": this.currentOrder,
      };
}

class TaxiDriver {
  TaxiState taxiState;
  dynamic driverLocation;
  dynamic lastLocationUpdateTime;
  dynamic isEmpty = false;

  TaxiDriver(this.taxiState, this.driverLocation, this.lastLocationUpdateTime);

  factory TaxiDriver.fromSnapshot(DataSnapshot snapshot) {
    TaxiState taxiState = TaxiState.fromSnapshot(snapshot.value['state']);
    dynamic driverLocation = snapshot.value['location'] == null
        ? null
        : snapshot.value['location']['position'];
    dynamic lastLocationUpdateTime = snapshot.value['location'] == null
        ? null
        : snapshot.value['location']['lastUpdateTime'];
    return TaxiDriver(taxiState, driverLocation, lastLocationUpdateTime);
  }

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => {
        "authorizationStatus": this.taxiState.isAuthorized,
        "isLooking": this.taxiState.isLooking,
        "currentOrder": this.taxiState.currentOrder,
        "driverLocation": driverLocation,
        "lastLocationUpdateTime": lastLocationUpdateTime
      };
}
