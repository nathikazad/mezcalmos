import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:intl/intl.dart';

enum Weekday { Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday }

extension AddDayOfWeekToDateTime on DateTime {
  Weekday getDayOfWeek() {
    return Weekday.values
        .firstWhere((weekday) => this.weekday == weekday.index + 1);
  }
}

extension ParseWeekdayToString on Weekday {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToDaysOfWeek on String {
  Weekday toWeekDay() {
    return Weekday.values
        .firstWhere((e) => e.toFirebaseFormatString().toLowerCase() == this);
  }
}

class OpenHours {
  bool isOpen;
  List<int> from;
  List<int> to;
  OpenHours(this.isOpen, this.from, this.to);
}

class Schedule {
  Map<Weekday, OpenHours> _openHours;
  Map<Weekday, OpenHours> get openHours => this._openHours;

  Schedule(this._openHours);

  factory Schedule.fromData(dynamic data) {
    Map<Weekday, OpenHours> openHours = {};
    data.forEach((dynamic day, dynamic openHour) {
      try {
        List<int> from = openHour["from"]
            .toString()
            .split(':')
            .map((val) => int.parse(val))
            .toList();
        List<int> to = openHour["to"]
            .toString()
            .split(':')
            .map((val) => int.parse(val))
            .toList();

        openHours[day.toString().toWeekDay()] =
            OpenHours(openHour["isOpen"], from, to);
      } catch (e) {
        mezDbgPrint("something went wrong $e");
      }
    });

    return Schedule(openHours);
  }

  bool isOpen() {
    bool isOpen = false;
    final String dayNane = DateFormat('EEEE').format(DateTime.now());
    final DateTime x = DateTime.now();
    openHours.forEach((Weekday key, OpenHours value) {
      if (key.toFirebaseFormatString() == dayNane.toLowerCase()) {
        if (value.isOpen == true) {
          final DateTime dateOfStart =
              DateTime(x.year, x.month, x.day, value.from[0], value.from[1]);
          final DateTime dateOfClose =
              DateTime(x.year, x.month, x.day, value.to[0], value.to[1]);

          if (dateOfStart.isBefore(x) && dateOfClose.isAfter(x)) {
            isOpen = true;
          }

          if (dateOfClose.isBefore(dateOfStart)) {
            isOpen = x.isBefore(dateOfStart) || x.isAfter(dateOfClose);
          }
        } else {
          isOpen = false;
        }
      }
    });
    return isOpen;
  }
}
