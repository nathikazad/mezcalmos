import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class PeriodOfTime {
  DateTime start;
  DateTime end;
  PeriodOfTime({
    required this.start,
    required this.end,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PeriodOfTime &&
        other.start.year == start.year &&
        other.start.month == start.month &&
        other.start.day == start.day &&
        other.start.hour == start.hour &&
        other.start.minute == start.minute &&
        other.end.year == end.year &&
        other.end.month == end.month &&
        other.end.day == end.day &&
        other.end.hour == end.hour &&
        other.end.minute == end.minute;
  }

  bool include(PeriodOfTime p2) {
    return (p2.start.isAfter(start) || p2.start.isAtSameMomentAs(start)) &&
        (p2.end.isBefore(end) || p2.end.isAtSameMomentAs(end));
  }

  PeriodOfTime? merge(PeriodOfTime p2) {
    mezDbgPrint("Trying to merge : \n ${toString()} \n ${p2.toString()} ");
    if (include(p2)) {
      mezDbgPrint("Merge two period of time success : $p2");
      return p2;
    }
    return null;
  }

  PeriodOfTime toLocal() {
    final PeriodOfTime data =
        PeriodOfTime(start: start.toLocal(), end: end.toLocal());

    return this;
  }

  @override
  int get hashCode => start.hashCode ^ end.hashCode;

  @override
  String toString() =>
      '${DateFormat.MMMEd(userLangCode).format(start.toLocal())}, ${DateFormat("hh:mm a").format(start.toLocal())} ${Get.find<LanguageController>().strings["General"]["to"]} ${DateFormat("hh:mm a").format(end.toLocal())}'
          .replaceAll(".", "");
}
