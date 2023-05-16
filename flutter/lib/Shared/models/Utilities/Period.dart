import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';

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

    String formatTime(DateTime time) {
    final int h = int.parse(time.hour.toString());
    final int m = int.parse(time.minute.toString());
    if (h < 0 || h > 23 || m < 0 || m > 59) {
      throw ArgumentError('Invalid time value');
    }
    if (h == 0) {
      return '12:${m.toString().padLeft(2, '0')} AM';
    } else if (h < 12) {
      return '${h.toString()}:${m.toString().padLeft(2, '0')} AM';
    } else if (h == 12) {
      return '12:${m.toString().padLeft(2, '0')} PM';
    } else if (h > 12 && h <= 23) {
      return '${(h - 12).toString()}:${m.toString().padLeft(2, '0')} PM';
    }
    throw ArgumentError('Invalid time value');
  }

  PeriodOfTime? merge(PeriodOfTime p2) {
    if (include(p2)) {
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
  String toString() {
    return '${DateFormat.MMMEd(userLangCode).format(start.toLocal())}, ${DateFormat("hh:mm a").format(start.toLocal())} ${Get.find<LanguageController>().strings["General"]["to"].toString().toLowerCase()} ${DateFormat("hh:mm a").format(end.toLocal())}'
        .replaceAll(".", "");
  }

  String toNormalString({bool removeDay = false, DateFormat? format}) {
    final DateFormat df = format ?? DateFormat.MMMEd(userLangCode);

    return '${(removeDay) ? "" : df.format(start.toLocal()) + ","} ${DateFormat("hh:mm a").format(start.toLocal())} ${Get.find<LanguageController>().strings["General"]["to"].toString().toLowerCase()} ${DateFormat("hh:mm a").format(end.toLocal())}'
        .replaceAll(".", "");
  }
}
