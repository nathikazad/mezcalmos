// /*
// * Created By Mirai Devs.
// * On 4/1/2022.
// */
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:in_app_review/in_app_review.dart';

// enum Availability { loading, available, unavailable }

// class InAppReviewPage extends StatefulWidget {
//   const InAppReviewPage({Key? key}) : super(key: key);

//   @override
//   _InAppReviewPageState createState() => _InAppReviewPageState();
// }

// class _InAppReviewPageState extends State<InAppReviewPage> {
//   final InAppReview _inAppReview = InAppReview.instance;

//   String _appStoreId = '';
//   String _microsoftStoreId = '';
//   Availability _availability = Availability.loading;

//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance!.addPostFrameCallback((_) async {
//       try {
//         final bool isAvailable = await _inAppReview.isAvailable();

//         setState(() {
//           // This plugin cannot be tested on Android by installing your app
//           // locally. See https://github.com/britannio/in_app_review#testing for
//           // more information.
//           _availability = isAvailable && Platform.isAndroid
//               ? Availability.available
//               : Availability.unavailable;
//         });
//       } catch (e) {
//         setState(() => _availability = Availability.unavailable);
//       }
//     });
//   }

//   void _setAppStoreId(String id) => _appStoreId = id;

//   void _setMicrosoftStoreId(String id) => _microsoftStoreId = id;

//   //Future<void> _requestReview() => _inAppReview.requestReview();

//   Future<void> _requestReview() async {
//     final bool isAvailable = await _inAppReview.isAvailable();
//     debugPrint('_inAppReview isAvailable: $isAvailable');
//     if (isAvailable) {
//       await _inAppReview.requestReview().catchError((e) {
//         debugPrint('_inAppReview: ${e.toString()}');
//       });
//     }
//   }

//   Future<void> _openStoreListing() => _inAppReview.openStoreListing(
//         appStoreId: _appStoreId,
//         microsoftStoreId: _microsoftStoreId,
//       );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('In App Review')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'In App Review status:\n${_availability.name}',
//                 style: Theme.of(context).textTheme.headline2,
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 26),
//               // TextField(
//               //   onChanged: _setAppStoreId,
//               //   decoration: InputDecoration(hintText: 'App Store ID'),
//               // ),
//               // TextField(
//               //   onChanged: _setMicrosoftStoreId,
//               //   decoration: InputDecoration(hintText: 'Microsoft Store ID'),
//               // ),
//               ElevatedButton(
//                 onPressed: _requestReview,
//                 child: Text('Request Review'),
//               ),
//               const SizedBox(height: 26),
//               ElevatedButton(
//                 onPressed: _openStoreListing,
//                 child: Text('Open Store Listing'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
