import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';

abstract class Service {
  String id;
  String name;
  String photo;
  Location? location;
  Schedule? schedule;
  ServiceState state;
  Service(
      {required this.id,
      required this.name,
      required this.photo,
      this.location,
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
