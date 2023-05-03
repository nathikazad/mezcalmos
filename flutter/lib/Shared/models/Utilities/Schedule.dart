import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';

extension AddDayOfWeekToDateTime on DateTime {
  Weekday getDayOfWeek() {
    return Weekday.values
        .firstWhere((Weekday weekday) => this.weekday == weekday.index + 1);
  }
}

extension ParseStringToDaysOfWeek on String {
  Weekday toWeekDay() {
    return Weekday.values.firstWhere(
        (Weekday e) => e.toFirebaseFormatString().toLowerCase() == this);
  }
}

extension OpenHoursFunctions on OpenHours {
  void setOpenHours({
    required bool isOpen,
  }) {
    this.isOpen = isOpen;
  }

  String toFirebaseFormattedString() {
    return "$isOpen ${from.join(':')} ${to.join(':')} ";
  }

  OpenHours clone() {
    return OpenHours(
      isOpen: this.isOpen,
      from: from,
      to: to,
    );
  }
}

Schedule scheduleFromData(data) {
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
          OpenHours(isOpen: openHour["isOpen"], from: from, to: to);
    } catch (e) {
      mezDbgPrint("something went wrong $e");
    }
  });
  // final List<num> timezone = data.timezone.split(':').map((String val) {
  //   return num.parse(val);
  // }).toList();
  // if (data.timezone.contains('-')) {
  //   timezone[1] = -timezone[1];
  // }
  // return Schedule(openHours: openHours, timezone: timezone);
  return Schedule(openHours: openHours);
}

extension ScheduleFunctions on Schedule {
  bool isOpen() {
    bool isOpen = false;
    final String dayNane = DateFormat('EEEE').format(DateTime.now());
    final DateTime now = DateTime.now(); //.toUtc().add(
    // Duration(hours: timezone[0].toInt(), minutes: timezone[1].toInt()));
    openHours.forEach((Weekday key, OpenHours value) {
      if (key.toFirebaseFormatString() == dayNane.toLowerCase()) {
        if (value.isOpen == true) {
          final DateTime dateOfStart = DateTime(now.year, now.month, now.day,
              value.from[0].toInt(), value.from[1].toInt());
          final DateTime dateOfClose = DateTime(now.year, now.month, now.day,
              value.to[0].toInt(), value.to[1].toInt());

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
    // if (timezone[0] < 0) {
    //   timezone[1] = -timezone[1];
    //   json["timezone"] = timezone.join(':');
    //   timezone[1] = -timezone[1];
    // } else {
    //   json["timezone"] = timezone.join(':');
    // }
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

  Schedule clone() {
    final Map<Weekday, OpenHours> _cloneSchedule = {};
    openHours.forEach((Weekday key, OpenHours value) {
      _cloneSchedule[key] = value.clone();
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
      data = DateTime.now(); //.toUtc().add(
      // Duration(hours: timezone[0].toInt(), minutes: timezone[1].toInt()));
    } else {
      DateTime testDate = DateTime.now(); //.toUtc().add(
      // Duration(hours: timezone[0].toInt(), minutes: timezone[1].toInt()));
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
