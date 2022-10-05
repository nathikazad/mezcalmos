import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';

enum Weekday { Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday }

extension AddDayOfWeekToDateTime on DateTime {
  Weekday getDayOfWeek() {
    return Weekday.values
        .firstWhere((Weekday weekday) => this.weekday == weekday.index + 1);
  }
}

extension ParseWeekdayToString on Weekday {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToDaysOfWeek on String {
  Weekday toWeekDay() {
    return Weekday.values.firstWhere(
        (Weekday e) => e.toFirebaseFormatString().toLowerCase() == this);
  }
}

class OpenHours {
  bool isOpen;
  List<int> from;
  List<int> to;
  OpenHours(this.isOpen, this.from, this.to);

  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "from": from.join(":"),
      "to": to.join(":"),
      "isOpen": isOpen
    };
  }

  String toString() {
    return "$isOpen ${from.join(':')} ${to.join(':')} ";
  }

  void setOpenHours({
    required bool isOpen,
  }) {
    this.isOpen = isOpen;
  }

  OpenHours.clone(OpenHours openHours)
      : this(openHours.isOpen, openHours.from.toList(), openHours.to.toList());
}

class Schedule {
  Map<Weekday, OpenHours> openHours;
  Map<Weekday, OpenHours> get getOpenHours => openHours;

  Schedule({
    required this.openHours,
  });

  factory Schedule.fromData(data) {
    final Map<Weekday, OpenHours> openHours = {};

    data.forEach((day, openHour) {
      try {
        final List<int> from = openHour["from"]
            .toString()
            .split(':')
            .map((String val) => int.parse(val))
            .toList();
        final List<int> to = openHour["to"]
            .toString()
            .split(':')
            .map((String val) => int.parse(val))
            .toList();

        openHours[day.toString().toWeekDay()] =
            OpenHours(openHour["isOpen"], from, to);
      } catch (e) {
        mezDbgPrint("something went wrong $e");
      }
    });

    return Schedule(openHours: openHours);
  }

  bool isOpen() {
    bool isOpen = false;
    final String dayNane = DateFormat('EEEE').format(DateTime.now());
    final DateTime now = DateTime.now();
    openHours.forEach((Weekday key, OpenHours value) {
      if (key.toFirebaseFormatString() == dayNane.toLowerCase()) {
        if (value.isOpen == true) {
          final DateTime dateOfStart = DateTime(
              now.year, now.month, now.day, value.from[0], value.from[1]);
          final DateTime dateOfClose =
              DateTime(now.year, now.month, now.day, value.to[0], value.to[1]);

          if (now.isAfter(dateOfStart) && now.isBefore(dateOfClose)) {
            isOpen = true;
          }

          if (dateOfClose.isBefore(dateOfStart)) {
            isOpen = now.isBefore(dateOfClose) || now.isAfter(dateOfStart);
          }
        } else {
          isOpen = false;
        }
      }
    });
    return isOpen;
  }

  Map<String, dynamic> toFirebaseFormattedJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    Weekday.values.forEach((Weekday weekday) {
      json[weekday.toFirebaseFormatString()] =
          openHours[weekday]?.toFirebaseFormattedJson();
    });
    return json;
  }

  Map<String, OpenHours> concatenatedVersion() {
    final Map<String, OpenHours> json = <String, OpenHours>{};
    final List<Weekday> weekdays = Weekday.values;
    String? previousDayOpenHours;
    String? currentStringKey;
    for (int i = 0; i < weekdays.length; i++) {
      final Weekday weekday = weekdays[i];
      if (openHours[weekday] == null) continue;
      if (previousDayOpenHours != openHours[weekday].toString()) {
        currentStringKey = weekday.toFirebaseFormatString();
        if (openHours[weekday]!.isOpen) {
          json[currentStringKey] = openHours[weekday]!;
          previousDayOpenHours = openHours[weekday].toString();
        } else {
          previousDayOpenHours = null;
        }
      } else {
        json.remove(currentStringKey);
        currentStringKey =
            "${currentStringKey!.split('-')[0].inCaps}-${weekday.toFirebaseFormatString().inCaps}";
        json[currentStringKey] = openHours[weekday]!;
      }
    }
    return json;
  }

  factory Schedule.clone(Schedule schedule) {
    final Map<Weekday, OpenHours> _cloneSchedule = {};
    schedule.openHours.forEach((Weekday key, OpenHours value) {
      _cloneSchedule[key] = OpenHours.clone(value);
    });

    final Schedule newSchedule = Schedule(openHours: _cloneSchedule);

    return newSchedule;
  }
  List<String> _getServiceDates() {
    final List<String> data = [];
    openHours.keys.forEach((Weekday element) {
      if (openHours[element]!.isOpen) {
        data.add(element.toFirebaseFormatString());
      }
    });

    return data;
  }

  DateTime getTheCLosestOpenDay() {
    DateTime data = DateTime.now();
    if (_getServiceDates()
        .contains(DateFormat("EEEE").format(DateTime.now()).toLowerCase())) {
      data = DateTime.now();
    } else {
      DateTime testDate = DateTime.now();
      for (int i = 0; i < 7; i++) {
        testDate = DateTime(testDate.year, testDate.month, testDate.day + i);
        if (_getServiceDates()
            .contains(DateFormat("EEEE").format(testDate).toLowerCase())) {
          data = testDate;
          break;
        }
      }
    }
    return data;
  }
}
