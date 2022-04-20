// /*
// * Created By Mirai Devs.
// * On 3/25/2022.
// */
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:sizer/sizer.dart';

// class RestaurantShimmerList extends StatelessWidget {
//   const RestaurantShimmerList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       itemCount: 20,
//       itemBuilder: (_, int index) {
//         return const _RestaurantShimmerCard();
//       },
//     );
//   }
// }

// class _RestaurantShimmerCard extends StatelessWidget {
//   const _RestaurantShimmerCard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(8),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(15),
//         child: Container(
//           width: double.infinity,
//           height: 145,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Flexible(
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Shimmer.fromColors(
//                         highlightColor: Colors.grey[400]!,
//                         baseColor: Colors.grey[300]!,
//                         child: Container(
//                           height: 10,
//                           width: 120,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(2),
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Shimmer.fromColors(
//                         highlightColor: Colors.grey[400]!,
//                         baseColor: Colors.grey[300]!,
//                         child: Container(
//                           height: 10,
//                           width: 240,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(2),
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Shimmer.fromColors(
//                         highlightColor: Colors.grey[400]!,
//                         baseColor: Colors.grey[300]!,
//                         child: Container(
//                           height: 10,
//                           width: 200,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(2),
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ),
//                       Spacer(),
//                       Container(
//                         alignment: Alignment.bottomLeft,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: <Widget>[
//                             Shimmer.fromColors(
//                               highlightColor: Colors.grey[400]!,
//                               baseColor: Colors.grey[300]!,
//                               child: Container(
//                                 height: 15,
//                                 width: 15,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(2),
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 5),
//                             Shimmer.fromColors(
//                               highlightColor: Colors.grey[400]!,
//                               baseColor: Colors.grey[300]!,
//                               child: Container(
//                                 height: 10,
//                                 width: 80,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(2),
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Shimmer.fromColors(
//                 highlightColor: Colors.grey[400]!,
//                 baseColor: Colors.grey[300]!,
//                 child: Container(
//                   height: double.infinity,
//                   width: 35.w,
//                   decoration: BoxDecoration(
//                     color: Colors.grey,
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(15),
//                       bottomRight: Radius.circular(15),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
