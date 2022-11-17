import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/User.dart';

class InCounterOfferNegotiation {
  String orderId;
  String customerId;
  InCounterOfferNegotiation({required this.customerId, required this.orderId});
}

class TaxiState {
  bool isAuthorized;
  bool isLooking;
  String? currentOrder;
  InCounterOfferNegotiation? inOrderNegotation;
  TaxiState(this.isAuthorized, this.isLooking,
      [this.currentOrder, this.inOrderNegotation]);

  factory TaxiState.fromSnapshot(data) {
    mezDbgPrint("TaxiDriver $data");
    final bool isAuthorized =
        data == null ? false : data['authorizationStatus'] == "authorized";
    final bool isLooking = data == null ? false : data['isLooking'] == true;
    final String? currentOrder = data == null ? null : data['currentOrderId'];
    final InCounterOfferNegotiation? _inOrderNegotation =
        data?['inNegotiation'] == null
            ? null
            : InCounterOfferNegotiation(
                customerId: data['inNegotiation']['customerId'],
                orderId: data['inNegotiation']['orderId']);
    return TaxiState(isAuthorized, isLooking, currentOrder, _inOrderNegotation);
  }

  Map<String, dynamic> toJson() => {
        "authorizationStatus": isAuthorized,
        "isLooking": isLooking,
        "currentOrderId": currentOrder,
      };
}

class TaxiDriver {
  TaxiState taxiState;
  LatLng driverLocation;
  DateTime? lastLocationUpdateTime;

  TaxiDriver(this.taxiState, this.driverLocation, this.lastLocationUpdateTime);

  factory TaxiDriver.fromSnapshot(DataSnapshot snapshot) {
    final TaxiState taxiState =
        TaxiState.fromSnapshot((snapshot.value as dynamic)['state']);
    final dynamic driverLocation =
        (snapshot.value as dynamic)['location'] == null
            ? null
            : LatLng((snapshot.value as dynamic)["location"]["position"]["lat"],
                (snapshot.value as dynamic)["location"]["position"]["lng"]);
    final DateTime? lastLocationUpdateTime =
        (snapshot.value as dynamic)['location'] == null
            ? null
            : DateTime.parse(
                (snapshot.value as dynamic)['location']['lastUpdateTime']);
    return TaxiDriver(taxiState, driverLocation, lastLocationUpdateTime);
  }

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => {
        "authorizationStatus": taxiState.isAuthorized,
        "isLooking": taxiState.isLooking,
        "currentOrder": taxiState.currentOrder,
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
      : super(firebaseId: id, name: name, image: image, language: language);

  factory TaxiUserInfo.fromData(data) {
    // mezDbgPrint(" TaxiUserInfo.fromData ====> $data");
    final LatLng? location = data["location"] != null
        ? LatLng(data["location"]["position"]["lat"],
            data["location"]["position"]["lng"])
        : null;
    final LanguageType? language = data["language"] != null
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
