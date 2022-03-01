import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/User.dart';

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
  DeliveryDriverUserInfo driverInfo;
  LatLng driverLocation;
  DateTime? lastLocationUpdateTime;
  String deliveryDriverId;

  DeliveryDriver(
      {required this.deliveryDriverState,
      required this.driverLocation,
      required this.lastLocationUpdateTime,
      required this.deliveryDriverId,
      required this.driverInfo});

  factory DeliveryDriver.fromData(
      String deliveryDriverId, dynamic deliveryDriverData) {
    DeliveryDriverState deliveryDriverState =
        DeliveryDriverState.fromSnapshot(deliveryDriverData['state']);
    DeliveryDriverUserInfo deliveryDriverUserInfo =
        DeliveryDriverUserInfo.fromData(deliveryDriverData['info']);
    dynamic driverLocation = deliveryDriverData['location'] == null
        ? null
        : LatLng(deliveryDriverData["location"]["position"]["lat"],
            deliveryDriverData["location"]["position"]["lng"]);
    DateTime? lastLocationUpdateTime = deliveryDriverData['location'] == null
        ? null
        : DateTime.parse(deliveryDriverData['location']['lastUpdateTime']);
    return DeliveryDriver(
        deliveryDriverId: deliveryDriverId,
        deliveryDriverState: deliveryDriverState,
        driverLocation: driverLocation,
        lastLocationUpdateTime: lastLocationUpdateTime,
        driverInfo: deliveryDriverUserInfo);
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
      this.location,
      LanguageType? language})
      : super(id: id, name: name, image: image, language: language);

  factory DeliveryDriverUserInfo.fromData(dynamic data) {
    // mezDbgPrint(" TaxiUserInfo.fromData ====> $data");
    LatLng? location = data["location"] != null
        ? LatLng(data["location"]["position"]["lat"],
            data["location"]["position"]["lng"])
        : null;
    LanguageType? language = data["language"] != null
        ? data["language"].toString().toLanguageType()
        : null;
    return DeliveryDriverUserInfo(
        id: data["id"],
        name: data["name"],
        image: data["image"],
        location: location,
        language: language);
  }
}

enum DeliveryDriverType { Pickup, DropOff }

extension ParseDeliveryDriverTypeToString on DeliveryDriverType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1).toLowerCase();
  }
}

extension ParseStringToDeliveryDriverType on String {
  DeliveryDriverType toDeliveryDriverType() {
    return DeliveryDriverType.values.firstWhere(
        (e) => e.toFirebaseFormatString().toLowerCase() == this.toLowerCase());
  }
}
