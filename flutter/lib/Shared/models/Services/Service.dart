import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/User.dart';

abstract class Service {
  ServiceUserInfo info;
  Schedule? schedule;
  ServiceState state;
  Service({required this.info, this.schedule, required this.state});
}

class ServiceState {
  AuthorizationStatus authorizationStatus = AuthorizationStatus.Unauthorized;
  bool available = false;
  bool open = true;
  ServiceState(this.authorizationStatus, this.available, this.open);

  factory ServiceState.fromServiceStateData(stateData) {
    return ServiceState(
        stateData?["authorizationStatus"]?.toString().toAuthorizationStatus() ??
            AuthorizationStatus.Unauthorized,
        stateData?["available"] ?? false,
        stateData?["open"] ?? true);
  }

  Map<String, dynamic> toJson() => {
        "authorizationStatus": authorizationStatus.toFirebaseFormatString(),
        "available": available,
        "open": open
      };

  bool get isAuthorized =>
      authorizationStatus == AuthorizationStatus.Authorized;
  bool get isOpen => open;
}

class ServiceUserInfo extends UserInfo {
  Location location;

  ServiceUserInfo(
      {required String id,
      required String name,
      required String image,
      required this.location})
      : super(id: id, name: name, image: image);

  factory ServiceUserInfo.fromData(data) {
    // mezDbgPrint(" TaxiUserInfo.fromData ====> $data");
    final Location location = Location.fromFirebaseData(data["location"]);
    return ServiceUserInfo(
        id: data["id"],
        name: data["name"],
        image: data["image"],
        location: location);
  }

  @override
  Map<String, dynamic> toJson() => {
        "uid": id,
        "name": name,
        "image": image,
        "location": location.toFirebaseFormattedJson(),
      };
}
