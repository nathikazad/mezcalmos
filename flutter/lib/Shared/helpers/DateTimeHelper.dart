import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

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
    mezDbgPrint(cDate.difference(toLocal()).inHours);
    if (cDate.difference(toLocal()).inDays < 0) {
      return DateFormat("EEEE , hh:mm a").format(toLocal());
    } else if (cDate.difference(toLocal()).inHours < 0) {
      return "${_18n()["today"]} ${DateFormat("hh:mm a").format(toLocal())}";
    } else {
      return "${cDate.difference(toLocal()).inMinutes} min";
    }
  }

  String toDayAmPm() {
    return DateFormat("EEE, hh:mm a").format(this);
  }
}
