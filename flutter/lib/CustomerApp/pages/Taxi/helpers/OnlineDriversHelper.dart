import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/OnlineTaxiDriver.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/models/Location.dart' as LocModel;

/// Call this to fetch online TaxiDrivers.
///
/// By default it fetchs each 10seconds , nearby Drivers within range of 5km.
Stream<List<OnlineTaxiDriver>> onlineTaxiDriversListener({
  Duration duration = const Duration(seconds: 10),
  double rangeInKm = 5,
  required Rxn<LocModel.Location> centerLocation,
}) async* {
  yield* Stream<Future<List<OnlineTaxiDriver>>>.periodic(duration, (_) {
    return Get.find<TaxiController>().fetchOnlineTaxiDrivers();
  }).asyncMap<List<OnlineTaxiDriver>>(
    (Future<List<OnlineTaxiDriver>> event) async {
      return _checkAndGetValidDrivers(
        taxis: (await event),
        centerLocation: centerLocation.value,
        rangeInKm: rangeInKm,
      );
    },
  );
}

Future<List<OnlineTaxiDriver>> fetchOnlineTaxiDriversOnce({
  double rangeInKm = 5,
  required Rxn<LocModel.Location> centerLocation,
}) async {
  return _checkAndGetValidDrivers(
    taxis: (await Get.find<TaxiController>().fetchOnlineTaxiDrivers()),
    centerLocation: centerLocation.value,
    rangeInKm: rangeInKm,
  );
}

List<OnlineTaxiDriver> _checkAndGetValidDrivers({
  required List<OnlineTaxiDriver> taxis,
  required LocModel.Location? centerLocation,
  required double rangeInKm,
}) {
  final List<OnlineTaxiDriver> tmp = <OnlineTaxiDriver>[];

  if (centerLocation != null) {
    taxis.forEach(
      (OnlineTaxiDriver driver) {
        final LatLng driverLocation =
            LatLng(driver.position['lat'], driver.position['lng']);

        final bool isWithinRange = MapHelper.calculateDistance(
              LocModel.Location.buildLocationData(
                driverLocation.latitude,
                driverLocation.longitude,
              ),
              LocModel.Location.buildLocationData(
                centerLocation.latitude,
                centerLocation.longitude,
              ),
            ) <=
            rangeInKm;

        if (isWithinRange) {
          tmp.add(driver);
        }
      },
    );
  }
  return tmp;
}
