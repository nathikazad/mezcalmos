// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
// import 'package:mezcalmos/Shared/constants/global.dart';
// import 'package:mezcalmos/Shared/controllers/languageController.dart';
// import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryOrderStatus.dart';
// import 'package:rive/rive.dart';

// extension DeliveryOrderHelper on DeliveryOrder {
//   dynamic _i18n() =>
//       Get.find<LanguageController>().strings["CustomerApp"]["pages"]
//           ["Restaurants"]["ViewOrderScreen"]["components"]["OrdersItemsCard"];

//   String getOrderStatus() {
//     switch (status) {
//       case DeliveryOrderStatus.cancelledByServiceProvider:
//         return '${_i18n()["canceledByAdmin"]}';
//       case DeliveryOrderStatus.cancelledByCustomer:
//         return '${_i18n()["canceledByCustomer"]}';
//       case DeliveryOrderStatus.orderReceived:
//         return '${_i18n()["received"]}';
//       // case RestaurantOrderStatus.Preparing:
//       //   return '${_i18n()["preparing"]}';
//       case DeliveryOrderStatus.onTheWayToDropoff:
//         return '${_i18n()["onTheWay"]}';
//       case DeliveryOrderStatus.packageReady:
//         return '${_i18n()["readyForPickUp"]}';
//       case DeliveryOrderStatus.delivered:
//         return '${_i18n()["delivered"]}';

//       default:
//         return 'Unknown status';
//     }
//   }
//   // order status image/icon

//   Widget orderStatusImage() {
//     switch (status) {
//       case DeliveryOrderStatus.cancelledByServiceProvider:

//       case DeliveryOrderStatus.cancelledByCustomer:
//         return Container(
//           padding: const EdgeInsets.all(5),
//           decoration:
//               BoxDecoration(color: Color(0xFFF9D8D6), shape: BoxShape.circle),
//           child: Icon(
//             Icons.close,
//             size: 25,
//             color: Colors.red,
//           ),
//         );

//       case DeliveryOrderStatus.orderReceived:
//         return Container(
//           // padding: const EdgeInsets.only(right: 10.0),
//           child: Icon(
//             Icons.flatware_rounded,
//             size: 40,
//             color: primaryBlueColor,
//           ),
//         );
//       // case DeliveryOrderStatus.Preparing:
//       //   return Container(
//       //     height: 50,
//       //     width: 50,
//       //     child: RiveAnimation.asset(
//       //       "assets/animation/cooking.riv",
//       //       fit: BoxFit.cover,
//       //     ),
//       //   );
//       case DeliveryOrderStatus.onTheWayToDropoff:
//         return Container(
//           height: 50,
//           width: 50,
//           child: RiveAnimation.asset(
//             "assets/animation/scooterWashingMachine.riv",
//             fit: BoxFit.cover,
//           ),
//         );
//       case DeliveryOrderStatus.packageReady:
//         return Container(
//           // padding: const EdgeInsets.only(right: 10.0),
//           child: Icon(
//             Icons.check_circle,
//             size: 40,
//             color: primaryBlueColor,
//           ),
//         );

//       case DeliveryOrderStatus.delivered:
//         return Container(
//           padding: const EdgeInsets.all(5),
//           decoration: BoxDecoration(
//               color: secondaryLightBlueColor, shape: BoxShape.circle),
//           child: Icon(
//             Icons.check,
//             size: 25,
//             color: primaryBlueColor,
//           ),
//         );
//       default:
//         return Container(
//           child: Text('UNKNOWN'),
//         );
//     }
//   }
// }
