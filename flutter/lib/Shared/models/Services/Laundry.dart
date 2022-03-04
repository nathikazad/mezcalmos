import 'dart:convert';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';

class Laundry extends Service {
  Laundry(
      {required String id,
      required String name,
      required String photo,
      Location? location,
      Schedule? schedule,
      required ServiceState laundryState})
      : super(
            id: id,
            name: name,
            photo: photo,
            location: location,
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
    String name = laundryData["info"]["name"];
    String photo = laundryData["info"]["image"];

    Schedule? schedule = laundryData["details"]["schedule"] != null
        ? Schedule.fromData(laundryData["details"]["schedule"])
        : null;

    Location? location = laundryData["details"]["locaiton"] != null
        ? Location.fromFirebaseData(laundryData["details"]["locaiton"]);

    Laundry laundry = Laundry(
        id: laundryId,
        name: name,
        photo: photo,
        schedule: schedule,
        laundryState: laundryState,
        location: location);
    return laundry;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "photo": photo,
      "laundryState": state.toJson(),
      "location": location?.toFirebaseFormattedJson()
    };
  }
}
