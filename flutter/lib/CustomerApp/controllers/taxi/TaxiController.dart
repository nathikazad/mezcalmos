// import 'dart:async';

// import 'package:firebase_database/firebase_database.dart';
// import 'package:get/get.dart';
// import 'package:location/location.dart';
// import 'package:mezcalmos/Shared/controllers/authController.dart';
// import 'package:mezcalmos/Shared/controllers/settingsController.dart';
// import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
// import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
// import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';


// // NOTE : This is a based implementation of the 'Request-Taxi' mockup in Mezcalmos-Delivery

// class Taxist {
//   String id;
//   // String name;
//   LocationData location;
//   bool? isLooking;

//   Taxist({required this.id, required this.isLooking, required this.location});

//   bool available() {
//     return isLooking == true &&
//         location.latitude != null &&
//         location.longitude != null;
//   }

//   factory Taxist.fromData(String key, dynamic data) {
//     return Taxist(
//       id: key,
//       isLooking: data['state'] != null ? data['state']['isLooking'] : null,
//       location: LocationData.fromMap({
//         "latitude": data['location']?['position']?['lat'] ?? null,
//         "longitude": data['location']?['position']?['lng'] ?? null
//       }),
//     );
//   }
// }

// class TaxiController extends GetxController {
//   DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
//   AuthController _authController = Get.find<AuthController>();
//   SettingsController _settingsController = Get.find<SettingsController>();
//   RxList<Taxist> _taxists = <Taxist>[].obs;

//   StreamSubscription? _nearestTaxistsSub;

//   // Functions

//   Stream<List<Taxist>> getTaxistsStream() {
//     return _taxists.stream;
//   }

//   @override
//   void onInit() {

//     // Don't mind this stream here , it is just me trying to diplay taxiDrivers around .
//     _nearestTaxistsSub = _databaseHelper.firebaseDatabase
//         .reference()
//         .child('taxiDrivers/')
//         .onValue
//         .listen((event) async {
//       try {
//         List<Taxist> _newData = [];
//         LocationData _myLocation = await Location().getLocation();
//         if (event.snapshot.value != null) {
//           event.snapshot.value.forEach((dynamic key, dynamic data) {
//             Taxist _taxisto = Taxist.fromData(key, data);
//             mezDbgPrint(
//                 " == NEW TAXI ==>  ${_taxisto.id} | state: ${_taxisto.isLooking} | location :  ${_taxisto.location.toString()}");
//             if (_taxisto.available()) {
//               double distance =
//                   MapHelper.calculateDistance(_myLocation, _taxisto.location);

//               mezDbgPrint(
//                   " == NEW TAXI ==>  ${_taxisto.id} | Distance :  $distance");
//               // less or equal to 5km
//               if (distance <= 6.0) {
//                 _newData.add(_taxisto);
//               }
//             }
//           });
//           // re-assigning!
//           _taxists.assignAll(_newData);
//         }
//       } catch (e) {
//         mezDbgPrint("OOOOOOOOO   $e   0000000000");
//       }
//     });
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     _nearestTaxistsSub?.cancel();
//     _nearestTaxistsSub = null;
//     super.onClose();
//   }
// }
