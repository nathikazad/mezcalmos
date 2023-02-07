// import 'dart:async';
// import 'dart:io';

// import 'package:firebase_core/firebase_core.dart' as firebase_core;
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:get/get.dart';
// import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
// import 'package:mezcalmos/Shared/firebaseNodes/serviceProviderNodes.dart';
// import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
// import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
// import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
// import 'package:mezcalmos/Shared/models/Orders/Order.dart';
// import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
// import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

// class OpLaundryInfoController extends GetxController {
//   FirebaseDb _databaseHelper = Get.find<FirebaseDb>();

//   Stream<Laundry?> getLaundry(String laundryId) {
//     mezDbgPrint(
//         "--------------------> Start listening service providers info  ${serviceProviderInfos(orderType: OrderType.Laundry, providerId: laundryId)}");
//     return _databaseHelper.firebaseDatabase
//         .ref()
//         .child(serviceProviderInfos(
//             orderType: OrderType.Laundry, providerId: laundryId))
//         .onValue
//         .map<Laundry?>((DatabaseEvent event) {
//       if (event.snapshot.value != null) {
//         return Laundry.fromLaundryData(
//             laundryId: laundryId, laundryData: event.snapshot.value);
//       }
//       return null;
//     });
//   }

//   Future<Laundry> getLaundryAsFuture(String laundryId) async {
//     return _databaseHelper.firebaseDatabase
//         .ref()
//         .child(serviceProviderInfos(
//             orderType: OrderType.Laundry, providerId: laundryId))
//         .once()
//         .then<Laundry>((DatabaseEvent event) {
//       return Laundry.fromLaundryData(
//           laundryId: laundryId, laundryData: event.snapshot.value);
//     });
//   }

//   Future<String> uploadUserImgToFbStorage(
//       {required String laundryId,
//       required File imageFile,
//       bool isCompressed = false}) async {
//     String _uploadedImgUrl;
//     final List<String> splitted = imageFile.path.split('.');
//     final String imgPath =
//         "laundries/$laundryId/avatar/$laundryId.${isCompressed ? 'compressed' : 'original'}.${splitted[splitted.length - 1]}";
//     try {
//       await firebase_storage.FirebaseStorage.instance
//           .ref(imgPath)
//           .putFile(imageFile);
//     } on firebase_core.FirebaseException catch (e) {
//       mezDbgPrint(e.message.toString());
//     } finally {
//       _uploadedImgUrl = await firebase_storage.FirebaseStorage.instance
//           .ref(imgPath)
//           .getDownloadURL();
//     }

//     return _uploadedImgUrl;
//   }

//   Future<void> setLaundryName(
//       {required String laundryId, required String newName}) async {
//     mezDbgPrint(
//         "------->>> ${serviceProviderInfos(orderType: OrderType.Laundry, providerId: laundryId)}/name");
//     await _databaseHelper.firebaseDatabase
//         .ref()
//         .child(serviceProviderInfos(
//                 orderType: OrderType.Laundry, providerId: laundryId) +
//             '/info')
//         .child('name')
//         .set(newName);
//   }

//   Future<void> setLaundryImage(
//       {required String laundryId, required String newImage}) async {
//     mezDbgPrint(
//         "------->>> ${serviceProviderInfos(orderType: OrderType.Laundry, providerId: laundryId)}/name");
//     await _databaseHelper.firebaseDatabase
//         .ref()
//         .child(serviceProviderInfos(
//                 orderType: OrderType.Laundry, providerId: laundryId) +
//             '/info')
//         .child('image')
//         .set(newImage);
//   }

//   Future<void> setSchedule(
//       {required String laundryId, required Schedule schedule}) {
//     return _databaseHelper.firebaseDatabase
//         .ref()
//         .child(serviceProviderSchedule(
//             orderType: OrderType.Laundry, providerId: laundryId))
//         .set(schedule.toFirebaseFormattedJson());
//   }

//   Future<void> setCosts(
//       {required String laundryId, required LaundryCosts laundryCosts}) {
//     return _databaseHelper.firebaseDatabase
//         .ref()
//         .child(serviceProviderCosts(
//             orderType: OrderType.Laundry, providerId: laundryId))
//         .set(laundryCosts.toFirebasFormat());
//   }

//   Future<void> setAverageNumberOfDays(
//       {required String laundryId, required num averageNumberOfDays}) {
//     return _databaseHelper.firebaseDatabase
//         .ref()
//         .child(serviceProviderAverageNumberOfDays(
//             orderType: OrderType.Laundry, providerId: laundryId))
//         .set(averageNumberOfDays);
//   }

//   Future<void> setMinCost({required num minCost, required String laundryId}) {
//     return _databaseHelper.firebaseDatabase
//         .ref()
//         .child(serviceProviderMinCost(
//             orderType: OrderType.Laundry, providerId: laundryId))
//         .set(minCost);
//   }

//   Future<void> setPrimaryLanguage(
//       {required String laundryId, required LanguageType lang}) {
//     return _databaseHelper.firebaseDatabase
//         .ref()
//         .child(serviceProviderPrimaryLanguage(
//             orderType: OrderType.Laundry, providerId: laundryId))
//         .set(lang.toFirebaseFormatString());
//   }

//   Future<void> setSecondaryLanguage(
//       {required String laundryId, LanguageType? lang}) {
//     return _databaseHelper.firebaseDatabase
//         .ref()
//         .child(serviceProviderSecondaryLanguage(
//             orderType: OrderType.Laundry, providerId: laundryId))
//         .set(lang?.toFirebaseFormatString() ?? null);
//   }

//   Future<void> setLocation({required String laundryId, required Location loc}) {
//     return _databaseHelper.firebaseDatabase
//         .ref()
//         .child(serviceProviderLocation(
//             orderType: OrderType.Laundry, providerId: laundryId))
//         .set(loc.toFirebaseFormattedJson());
//   }
// }
