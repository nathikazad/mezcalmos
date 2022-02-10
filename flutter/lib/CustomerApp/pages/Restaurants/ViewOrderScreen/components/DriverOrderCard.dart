<<<<<<< HEAD
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:sizer/sizer.dart';
>>>>>>> laundryWithMaster

// import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

// class DriverOrderCard extends StatelessWidget {
//   const DriverOrderCard({
//     Key? key,
//     required this.helperText,
//     required this.ordersStates,
//     required this.order,
//   }) : super(key: key);

//   final RestaurantOrder order;
//   final String helperText;
//   final RestaurantOrderStatus ordersStates;

//   @override
//   Widget build(BuildContext context) {
//     final txt = Theme.of(context).textTheme;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             (ordersStates == RestaurantOrderStatus.Delivered)
//                 ? Icon(
//                     Icons.check_circle,
//                     color: Colors.green,
//                     size: 40,
//                   )
//                 : (ordersStates == RestaurantOrderStatus.CancelledByAdmin ||
//                         ordersStates ==
//                             RestaurantOrderStatus.CancelledByCustomer)
//                     ? Icon(
//                         Icons.cancel,
//                         color: Colors.red,
//                         size: 40,
//                       )
//                     : (ordersStates == RestaurantOrderStatus.OnTheWay ||
//                             ordersStates ==
//                                 RestaurantOrderStatus.ReadyForPickup)
//                         ? CircularProgressIndicator()
//                         : Container(),
//             SizedBox(
//               width: 5,
//             ),
//             Flexible(
//               child: Card(
//                 color: (ordersStates == RestaurantOrderStatus.OnTheWay ||
//                         ordersStates == RestaurantOrderStatus.ReadyForPickup ||
//                         ordersStates == RestaurantOrderStatus.Delivered)
//                     ? Colors.white
//                     : Colors.grey.shade400,
//                 child: Container(
//                   width: double.infinity,
//                   margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 30,
//                         backgroundColor: Theme.of(context)
//                             .primaryColorLight
//                             .withOpacity(0.2),
//                         child: Icon(
//                           Icons.moped,
//                           size: 40,
//                           color: Theme.of(context).primaryColorLight,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 10.w,
//                       ),
//                       Flexible(
//                           flex: 3,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 order.restaurant.name,
//                                 style: txt.subtitle1,
//                               ),
//                               Text(
//                                 getDeliveryOrderStatus(ordersStates),
//                                 style: txt.headline3,
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ],
//                           )),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Container(
//             margin: EdgeInsets.all(5),
//             alignment: Alignment.centerRight,
//             child: Text(getDeliveryOrderHelperText(ordersStates)))
//       ],
//     );
//   }
// }

// String getDeliveryOrderStatus(RestaurantOrderStatus status) {
//   switch (status) {
//     case RestaurantOrderStatus.CancelledByAdmin:
//       return 'Order Canceled';
//     case RestaurantOrderStatus.CancelledByCustomer:
//       return 'Order Canceled';
//     case RestaurantOrderStatus.OrderReceieved:
//       return 'Order on the way';
//     case RestaurantOrderStatus.PreparingOrder:
//       return 'Order on the way';
//     case RestaurantOrderStatus.OnTheWay:
//       return 'Order on the way';
//     case RestaurantOrderStatus.ReadyForPickup:
//       return 'Order is Ready for pickup';
//     case RestaurantOrderStatus.Delivered:
//       return 'Order Delivered';

//     default:
//       return 'Unknown status';
//   }
// }

// String getDeliveryOrderHelperText(RestaurantOrderStatus status) {
//   switch (status) {
//     case RestaurantOrderStatus.CancelledByAdmin:
//       return 'Order Canceled by the Restaurant';
//     case RestaurantOrderStatus.CancelledByCustomer:
//       return 'Order Canceled by the customer';
//     case RestaurantOrderStatus.OrderReceieved:
//       return 'Waiting for the order to be prepared';
//     case RestaurantOrderStatus.PreparingOrder:
//       return 'Waiting for the order to be prepared';
//     case RestaurantOrderStatus.OnTheWay:
//       return 'Estimated arrival in 25 mins ';
//     case RestaurantOrderStatus.ReadyForPickup:
//       return 'Your order is ready for pickup';
//     case RestaurantOrderStatus.Delivered:
//       return 'Your order has been successfully delivered';

//     default:
//       return 'Unknown status';
//   }
// }
