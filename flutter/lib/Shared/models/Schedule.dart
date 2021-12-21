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
      List<int> from = data["from"]
          .toString()
          .split(':')
          .map((val) => int.parse(val))
          .toList();
      List<int> to = data["to"]
          .toString()
          .split(':')
          .map((val) => int.parse(val))
          .toList();
      openHours[day.toString().toWeekDay()] =
          OpenHours(openHour["isOpen"], from, to);
    });
    return Schedule(openHours);
  }

  bool isOpen() {
    DateTime now = DateTime.now();
    Weekday currentWeekDay = now.getDayOfWeek();
    OpenHours? todayHours = this._openHours[currentWeekDay];
    if (todayHours?.isOpen ?? false) {
      return false;
    }
    return (now.hour > todayHours!.from[0] &&
        now.minute > todayHours.from[0] &&
        now.hour < todayHours.to[0] &&
        now.minute < todayHours.to[0]);
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
