import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

//
dynamic _18n() => Get.find<LanguageController>().strings["Shared"]["helpers"]
    ["DateTimeHelper"];

// This helper will do the calculataion and return the differnce
// between the current time and the passed date time
// wit will alse do the needed format on the string
//

String getEstimatedTime(DateTime dateTime) {
  final DateTime cDate = DateTime.now();
  if (cDate.difference(dateTime).inDays >= 1) {
    return DateFormat("EEEE , hh:mm a").format(dateTime);
  } else if (cDate.difference(dateTime).inHours >= 1) {
    return DateFormat("${_18n()["today"]} , hh:mm a").format(dateTime);
  } else {
    return "${cDate.difference(dateTime).inMinutes} min";
  }
}
