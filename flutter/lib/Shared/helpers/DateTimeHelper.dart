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
extension parseDateTime on DateTime {
  String getEstimatedTime() {
    final DateTime cDate = DateTime.now();
    // mezDbgPrint(cDate.difference(toLocal()).inHours);
    if (cDate.difference(toLocal()).inDays < 0) {
      return " at ${DateFormat("EEEE , hh:mm a").format(toLocal())}";
    } else if (cDate.difference(toLocal()).inHours < 0) {
      return " ${_18n()["at"]} ${DateFormat("hh:mm a").format(toLocal())}";
    } else {
      return " ${_18n()["in"]} ${cDate.difference(toLocal()).inMinutes} min";
    }
  }
}
