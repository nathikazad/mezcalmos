import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';

class Laundry extends Service {
  Laundry(
      {
      required ServiceUserInfo userInfo,
      Schedule? schedule,
      required ServiceState laundryState})
      : super(
            info: userInfo,
            schedule: schedule,
            state: laundryState);

  factory Laundry.fromLaundryData(
      {required String laundryId, required dynamic laundryData}) {
    ServiceState laundryState = ServiceState(
        laundryData["state"]?["authorizationStatus"]
                ?.toString()
                .toAuthorizationStatus() ??
            AuthorizationStatus.Unauthorized,
        laundryData["state"]?["available"] ?? false);

    Schedule? schedule = laundryData["details"]["schedule"] != null
        ? Schedule.fromData(laundryData["details"]["schedule"])
        : null;

    

    Laundry laundry = Laundry(
        userInfo: ServiceUserInfo.fromData(laundryData["info"]),
        schedule: schedule,
        laundryState: laundryState);
    return laundry;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "info": info.toJson(),
      "laundryState": state.toJson(),
    };
  }
}
