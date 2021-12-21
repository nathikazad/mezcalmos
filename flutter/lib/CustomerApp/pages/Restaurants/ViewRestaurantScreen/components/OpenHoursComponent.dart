// import 'package:flutter/material.dart';

// class OpenHoursComponent extends StatelessWidget {
//   const OpenHoursComponent({
//     Key? key,
//     required this.openHours,
//   }) : super(key: key);

//   final Map<String, WorkDay> openHours;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(color: Colors.white),
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
//         child: Table(
//             children: List.generate(
//           openHours.length,
//           (index) {
//             String key = openHours.keys.elementAt(index);
//             return TableRow(
//               // decoration: BoxDecoration(
//               //     border: Border(
//               //         bottom: BorderSide(color: Colors.white, width: 15))),
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 5),
//                   child: Text(
//                     key,
//                     style: Theme.of(context).textTheme.bodyText2,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 5),
//                   child: Text(
//                     (openHours[key]!.isOpen) ? 'Open' : 'Closed',
//                     style: Theme.of(context).textTheme.bodyText1!.copyWith(
//                         color: (openHours[key]!.isOpen)
//                             ? Colors.green
//                             : Colors.red),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 5),
//                   child: (openHours[key]!.from != null &&
//                           openHours[key]!.to != null)
//                       ? Text(
//                           " ${openHours[key]!.from}  >  ${openHours[key]!.to}")
//                       : Text(" 00:00  >  00:00"),
//                 ),
//               ],
//             );
//           },
//         )));
//   }
// }

