import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/User.dart';

abstract class Service {
  ServiceUserInfo info;
  Schedule? schedule;
  ServiceState state;
  Service(
      {required this.info,
      this.schedule,
      required this.state});
}

class ServiceState {
  AuthorizationStatus authorizationStatus = AuthorizationStatus.Unauthorized;
  bool available = false;
  ServiceState(this.authorizationStatus, this.available);
  Map<String, dynamic> toJson() => {
        "authorizationStatus": authorizationStatus.toFirebaseFormatString(),
        "available": available
      };

  bool get authorized =>
      this.authorizationStatus == AuthorizationStatus.Authorized;
}

class ServiceUserInfo extends UserInfo {
  Location? location;

  ServiceUserInfo(
      {required String id,
      required String name,
      required String image,
      required this.location})
      : super(id: id, name: name, image: image);

  factory ServiceUserInfo.fromData(dynamic data) {
    // mezDbgPrint(" TaxiUserInfo.fromData ====> $data");
    Location? location = data["location"] != null
        ? Location.fromFirebaseData(data["location"]);
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
        "location": location?.toFirebaseFormattedJson(),
      };
}
