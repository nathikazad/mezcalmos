import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class DeliveryDriverState {
  bool isAuthorized;
  bool isOnline;
  DeliveryDriverState({required this.isAuthorized, required this.isOnline});

  factory DeliveryDriverState.fromSnapshot(dynamic data) {
    mezDbgPrint("DeliveryDriver ${data}");
    bool isAuthorized =
        data == null ? false : data['authorizationStatus'] == "authorized";
    bool isOnline = data == null ? false : data['isOnline'] == true;
    // String? currentOrder = data == null ? null : data['currentOrderId'];
    return DeliveryDriverState(isAuthorized: isAuthorized, isOnline: isOnline);
  }

  Map<String, dynamic> toJson() =>
      {"authorizationStatus": this.isAuthorized, "isOnline": this.isOnline};
}

// used by delivery admin app
class DeliveryDriver {
  DeliveryDriverState deliveryDriverState;
  LatLng driverLocation;
  DateTime? lastLocationUpdateTime;

  DeliveryDriver(
      this.deliveryDriverState, this.driverLocation,
      this.lastLocationUpdateTime);

  factory DeliveryDriver.fromSnapshot(DataSnapshot snapshot) {
    DeliveryDriverState deliveryDriverState =
        DeliveryDriverState.fromSnapshot(snapshot.value['state']);
    dynamic driverLocation = snapshot.value['location'] == null
        ? null
        : LatLng(snapshot.value["location"]["position"]["lat"],
            snapshot.value["location"]["position"]["lng"]);
    DateTime? lastLocationUpdateTime = snapshot.value['location'] == null
        ? null
        : DateTime.parse(snapshot.value['location']['lastUpdateTime']);
    return DeliveryDriver(
        deliveryDriverState, driverLocation, lastLocationUpdateTime);
  }

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => {
        "authorizationStatus": this.deliveryDriverState.isAuthorized,
        "isOnline": this.deliveryDriverState.isOnline,
        "driverLocation": driverLocation.toJson(),
        "lastLocationUpdateTime":
            lastLocationUpdateTime?.toUtc().toIso8601String()
      };
}


class DeliveryDriverUserInfo extends UserInfo { 
  LatLng? location;

  DeliveryDriverUserInfo(
      {required String id,
      required String name,
      required String image,
      required this.location})
      : super(id, name, image);

  factory DeliveryDriverUserInfo.fromData(dynamic data) {
    // mezDbgPrint(" TaxiUserInfo.fromData ====> $data");
    LatLng? location = data["location"] != null
        ? LatLng(data["location"]["position"]["lat"],
            data["location"]["position"]["lng"])
        : null;
    return DeliveryDriverUserInfo(
        id: data["id"],
        name: data["name"],
        image: data["image"],
        location: location);
  }
}

enum DeliveryDriverType {
  Pickup,
  DropOff
}

extension ParseDeliveryDriverTypeToString on DeliveryDriverType {
  String toFirebaseFormatString() {
    return this.toString().split('.').last;
  }
}

extension ParseStringToDeliveryDriverType on String {
  DeliveryDriverType toDeliveryDriverType() {
    return DeliveryDriverType.values.firstWhere(
        (e) => e.toFirebaseFormatString().toLowerCase() == this.toLowerCase());
  }
}