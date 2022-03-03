import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/User.dart';

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
  LatLng driverLocation;
  DateTime? lastLocationUpdateTime;

  TaxiDriver(this.taxiState, this.driverLocation, this.lastLocationUpdateTime);

  factory TaxiDriver.fromSnapshot(DataSnapshot snapshot) {
    TaxiState taxiState = TaxiState.fromSnapshot(snapshot.value['state']);
    dynamic driverLocation = snapshot.value['location'] == null
        ? null
        : LatLng(snapshot.value["location"]["position"]["lat"],
            snapshot.value["location"]["position"]["lng"]);
    DateTime? lastLocationUpdateTime = snapshot.value['location'] == null
        ? null
        : DateTime.parse(snapshot.value['location']['lastUpdateTime']);
    return TaxiDriver(taxiState, driverLocation, lastLocationUpdateTime);
  }

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => {
        "authorizationStatus": this.taxiState.isAuthorized,
        "isLooking": this.taxiState.isLooking,
        "currentOrder": this.taxiState.currentOrder,
        "driverLocation": driverLocation.toJson(),
        "lastLocationUpdateTime":
            lastLocationUpdateTime?.toUtc().toIso8601String()
      };
}

// Used by taxi order
class TaxiUserInfo extends UserInfo {
  String taxiNumber;
  String? sitio;
  LatLng? location;

  TaxiUserInfo(
      {required String id,
      required String name,
      required String image,
      required this.taxiNumber,
      this.sitio,
      LanguageType? language,
      required this.location})
      : super(id: id, name: name, image: image, language: language);

  factory TaxiUserInfo.fromData(dynamic data) {
    // mezDbgPrint(" TaxiUserInfo.fromData ====> $data");
    LatLng? location = data["location"] != null
        ? LatLng(data["location"]["position"]["lat"],
            data["location"]["position"]["lng"])
        : null;
    LanguageType? language = data["language"] != null
        ? data["language"].toString().toLanguageType()
        : null;
    return TaxiUserInfo(
        id: data["id"] ?? '',
        name: data["name"] ?? '',
        image: data["image"],
        taxiNumber: data["taxiNumber"].toString(),
        sitio: data["sitio"] ?? '',
        language: language,
        location: location);
  }
}
