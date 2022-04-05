import 'package:mezcalmos/Shared/models/User.dart';

class LaundryOperatorState {
  UserInfo userInfo;
  String laundryId;
  LaundryOperatorState({required this.userInfo, required this.laundryId});

  factory LaundryOperatorState.fromSnapshot(data) {
    final UserInfo userInfo = UserInfo.fromData(data['info']);
    final String laundryId = data['laundryId'];
    return LaundryOperatorState(userInfo: userInfo, laundryId: laundryId);
  }

  Map<String, dynamic> toJson() =>
      {"userInfo": userInfo.toFirebaseFormatJson(), "laundryId": laundryId};
}

// used by delivery admin app
// class DeliveryDriver {
//   LaundryOperatorState deliveryDriverState;
//   DeliveryDriverUserInfo driverInfo;
//   LatLng driverLocation;
//   DateTime? lastLocationUpdateTime;
//   String deliveryDriverId;

//   DeliveryDriver(
//       {required this.deliveryDriverState,
//       required this.driverLocation,
//       required this.lastLocationUpdateTime,
//       required this.deliveryDriverId,
//       required this.driverInfo});

//   factory DeliveryDriver.fromData(String deliveryDriverId, deliveryDriverData) {
//     final LaundryOperatorState deliveryDriverState =
//         LaundryOperatorState.fromSnapshot(deliveryDriverData['state']);
//     final DeliveryDriverUserInfo deliveryDriverUserInfo =
//         DeliveryDriverUserInfo.fromData(deliveryDriverData['info']);
//     final dynamic driverLocation = deliveryDriverData['location'] == null
//         ? null
//         : LatLng(deliveryDriverData["location"]["position"]["lat"],
//             deliveryDriverData["location"]["position"]["lng"]);
//     final DateTime? lastLocationUpdateTime =
//         deliveryDriverData['location'] == null
//             ? null
//             : DateTime.parse(deliveryDriverData['location']['lastUpdateTime']);
//     return DeliveryDriver(
//         deliveryDriverId: deliveryDriverId,
//         deliveryDriverState: deliveryDriverState,
//         driverLocation: driverLocation,
//         lastLocationUpdateTime: lastLocationUpdateTime,
//         driverInfo: deliveryDriverUserInfo);
//   }

//   // Added for Debugging Perposes - Don't delete for now
//   Map<String, dynamic> toJson() => {
//         "authorizationStatus": deliveryDriverState.isAuthorized,
//         "isOnline": deliveryDriverState.isOnline,
//         "driverLocation": driverLocation.toJson(),
//         "lastLocationUpdateTime":
//             lastLocationUpdateTime?.toUtc().toIso8601String()
//       };
// }

// class DeliveryDriverUserInfo extends UserInfo {
//   LatLng? location;

//   DeliveryDriverUserInfo(
//       {required String id,
//       required String name,
//       required String image,
//       this.location,
//       LanguageType? language})
//       : super(id: id, name: name, image: image, language: language);

//   factory DeliveryDriverUserInfo.fromData(data) {
//     // mezDbgPrint(" TaxiUserInfo.fromData ====> $data");
//     final LatLng? location = data["location"] != null
//         ? LatLng(data["location"]["position"]["lat"],
//             data["location"]["position"]["lng"])
//         : null;
//     final LanguageType? language = data["language"] != null
//         ? data["language"].toString().toLanguageType()
//         : null;
//     return DeliveryDriverUserInfo(
//         id: data["id"],
//         name: data["name"],
//         image: data["image"],
//         location: location,
//         language: language);
//   }
// }

// enum DeliveryDriverType { Pickup, DropOff }

// extension ParseDeliveryDriverTypeToString on DeliveryDriverType {
//   String toFirebaseFormatString() {
//     final String str = toString().split('.').last;
//     return str[0].toLowerCase() + str.substring(1).toLowerCase();
//   }
// }

// extension ParseStringToDeliveryDriverType on String {
//   DeliveryDriverType toDeliveryDriverType() {
//     return DeliveryDriverType.values.firstWhere((DeliveryDriverType e) =>
//         e.toFirebaseFormatString().toLowerCase() == toLowerCase());
//   }
// }
