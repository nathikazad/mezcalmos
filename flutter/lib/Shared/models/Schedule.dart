import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

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
}

class Schedule {
  Map<Weekday, OpenHours> _openHours;
  Map<Weekday, OpenHours> get openHours => _openHours;

  Schedule(this._openHours);

  factory Schedule.fromData(data) {
    mezDbgPrint("schedulllllllllllllllllllle =============> $data");
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

    return Schedule(openHours);
  }

  bool isOpen() {
    final DateTime now = DateTime.now();
    final Weekday currentWeekDay = now.getDayOfWeek();
    final OpenHours? todayHours = _openHours[currentWeekDay];
    if (todayHours?.isOpen ?? false) {
      return false;
    }
    return (now.hour > todayHours!.from[0] &&
        now.minute > todayHours.from[0] &&
        now.hour < todayHours.to[0] &&
        now.minute < todayHours.to[0]);
  }

  Map<String, dynamic> toFirebaseFormattedJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    Weekday.values.forEach((Weekday weekday) {
      json[weekday.toFirebaseFormatString()] =
          _openHours[weekday]?.toFirebaseFormattedJson();
    });
    return json;
  }
}

// retaurants
//   info
//     $id
//       info
//         schedule
//           monday
//             isOpen: true
//             from: 09:00
//             to: 17:00
//           tuesda
