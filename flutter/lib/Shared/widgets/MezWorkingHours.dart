// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
// import 'package:mezcalmos/Shared/controllers/languageController.dart';

// dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
//     ["MezWorkingHours"];

// class MezWorkingHours extends StatelessWidget {
//   const MezWorkingHours({
//     Key? key,
//     required this.schedule,
//   }) : super(key: key);

//   final Schedule schedule;

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Container(
//         child: workingHoursComponent(schedule: schedule, context: context),
//       ),
//     );
//   }

//   Widget workingHoursComponent(
//       {required Schedule schedule, required BuildContext context}) {
//     final DateFormat _dateFormat = DateFormat('hh:mma');

//     final List<Widget> widgets = [
//       Container(
//         alignment: Alignment.centerLeft,
//         child: Text(
//           "${_i18n()["workingHours"]}",
//           style: Theme.of(context).textTheme.bodyLarge,
//         ),
//       ),
//       SizedBox(
//         height: 10,
//       ),
//     ];

//     for (Weekday weekday in Weekday.values) {
//       List<OpenHours>? openHoursList = schedule.openHours[weekday];

//       if (openHoursList != null && openHoursList.isNotEmpty) {
//         for (OpenHours openHours in openHoursList) {
//           widgets.add(_workingHourCard(
//             context: context,
//             weekday: weekday,
//             openHours: openHours,
//             dateFormat: _dateFormat,
//             i18n: _i18n(),
//           ));
//         }
//       }
//     }

//     return Column(
//       children: widgets,
//     );
//   }
// }

// Widget _workingHourCard({
//   required Weekday weekday,
//   required OpenHours openHours,
//   required BuildContext context,
//   required DateFormat dateFormat,
//   required Map<String, dynamic> i18n,
// }) {
//   return Card(
//     child: Container(
//       padding: const EdgeInsets.all(5),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Flexible(
//             flex: 4,
//             fit: FlexFit.tight,
//             child: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 5),
//               child: Text(
//                 "${i18n["weekDays"][weekday.toString().split('.').last.toLowerCase()]}",
//               ),
//             ),
//           ),
//           Flexible(
//             flex: 3,
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: openHours.isOpen
//                     ? Colors.green.withOpacity(0.6)
//                     : Colors.red.withOpacity(0.6),
//               ),
//               child: Center(
//                 child: Text(
//                   openHours.isOpen
//                       ? i18n["workingHoursCard"]["open"]
//                       : i18n["workingHoursCard"]["closed"],
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: openHours.isOpen ? Colors.green : Colors.red,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Flexible(
//             flex: 4,
//             fit: FlexFit.tight,
//             child: openHours.isOpen
//                 ? Column(
//                     children: [
//                       Text(
//                         convertToAmPm(openHours.from[0].toInt(),
//                             openHours.from[1].toInt()),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "${openHours.to[0]} : ${openHours.to[1]}",
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   )
//                 : Container(
//                     height: 40,
//                   ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// String convertToAmPm(int hours, int minutes) {
//   String minutesFormattedString;
//   String formattedString;

//   if (minutes < 10) {
//     minutesFormattedString = "0$minutes";
//   } else {
//     minutesFormattedString = "$minutes";
//   }

//   if (hours <= 12) {
//     formattedString = "$hours:$minutesFormattedString AM";
//   } else {
//     formattedString = "${hours - 12}:$minutesFormattedString PM";
//   }

//   return formattedString;
// }
