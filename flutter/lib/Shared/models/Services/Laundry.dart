import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';

class Laundry extends Service {
  num costPerKilo = 20;
  Laundry(
      {required ServiceUserInfo userInfo,
      Schedule? schedule,
      required ServiceState laundryState,
      required num costPerKilo})
      : super(info: userInfo, schedule: schedule, state: laundryState);

  factory Laundry.fromLaundryData(
      // ignore: avoid_annotating_with_dynamic
      {required String laundryId, required dynamic laundryData}) {
    final ServiceState laundryState = ServiceState(
        laundryData["state"]?["authorizationStatus"]
                ?.toString()
                .toAuthorizationStatus() ??
            AuthorizationStatus.Unauthorized,
        laundryData["state"]?["available"] ?? false);

    final Schedule? schedule = laundryData["details"]["schedule"] != null
        ? Schedule.fromData(laundryData["details"]["schedule"])
        : null;

    final num costPerKilo = laundryData["details"]["costPerKilo"] != null
        ? laundryData["details"]["costPerKilo"]
        : 20;

    final Laundry laundry = Laundry(
        userInfo: ServiceUserInfo.fromData(laundryData["info"]),
        schedule: schedule,
        laundryState: laundryState,
        costPerKilo: costPerKilo);
    return laundry;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "info": info.toJson(),
      "laundryState": state.toJson(),
    };
  }
}
