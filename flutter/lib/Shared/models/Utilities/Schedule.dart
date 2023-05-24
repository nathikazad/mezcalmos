import 'package:get/get.dart';
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

  Map<String, dynamic> toFirebaseFormattedString() {
    return <String, dynamic>{
      "isOpen": isOpen,
      "from": from.join(":"),
      "to": to.join(":"),
    };
  }

  OpenHours clone() {
    return OpenHours(
      isOpen: isOpen,
      from: from,
      to: to,
    );
  }
}

OpenHours openHoursfromJson(Map<dynamic, dynamic> json) {
  return OpenHours(
    isOpen: json['isOpen'],
    from: (json['from'] as String).split(':').map(int.parse).toList(),
    to: (json['to'] as String).split(':').map(int.parse).toList(),
  );
}

Schedule scheduleFromData(json) {
  Map<Weekday, List<OpenHours>> openHours = {};
  if (json != null) {
    for (String weekdayKey in json.keys) {
      final Weekday weekday = Weekday.values
          .firstWhere((Weekday e) => e.toFirebaseFormatString() == weekdayKey);
      final dynamic openHoursJson = json[weekdayKey];
      if (openHoursJson is List) {
        List<OpenHours> openHoursList = openHoursJson
            .map<OpenHours>((hourJson) => openHoursfromJson(hourJson))
            .toList();
        openHours[weekday] = openHoursList;
      } else if (openHoursJson is Map) {
        final OpenHours singleOpenHours = openHoursfromJson(openHoursJson);
        openHours[weekday] = [singleOpenHours];
      }
    }
  }
  return Schedule(openHours: openHours);
}
extension ListOfOpenHoursHelpers on List<OpenHours> {
  bool get isOpen {
    return any((OpenHours hour) => hour.isOpen);
  }
}

extension ScheduleFunctions on Schedule {
  bool get atLeastOneDayIsOpen {
    return openHours.values
            .toList()
            .firstWhereOrNull((List<OpenHours> element) {
          return element.isNotEmpty == true;
        }) !=
        null;
  }

  bool isOpen() {
    bool isOpen = false;
    final String dayName = DateFormat('EEEE').format(DateTime.now());
    final DateTime now = DateTime.now();
    final Weekday? currentWeekday = Weekday.values.firstWhereOrNull(
      (Weekday weekday) =>
          weekday.toFirebaseFormatString() == dayName.toLowerCase(),
    );

    if (currentWeekday != null) {
      final List<OpenHours>? hours = openHours[currentWeekday];
      if (hours != null) {
        for (final OpenHours openHour in hours) {
          if (openHour.isOpen) {
            final num openingHour = openHour.from[0];
            final num openingMinute = openHour.from[1];
            final num closingHour = openHour.to[0];
            final num closingMinute = openHour.to[1];

            final num currentHour = now.hour;
            final num currentMinute = now.minute;

            if (currentHour > openingHour && currentHour < closingHour) {
              isOpen = true;
              break;
            } else if (currentHour == openingHour &&
                currentMinute >= openingMinute) {
              isOpen = true;
              break;
            } else if (currentHour == closingHour &&
                currentMinute < closingMinute) {
              isOpen = true;
              break;
            }
          }
        }
      }
    }

    return isOpen;
  }

  // Map<String, dynamic> toFirebaseFormattedJson() {
  //   Map<String, dynamic> json = {};
  //   openHours.forEach((Weekday weekday, List<OpenHours> openHoursList) {
  //     if (openHoursList.length == 1) {
  //       json[weekday.toString().split('.').last] =
  //           openHoursList[0].toFirebaseFormattedString();
  //     } else {
  //       json[weekday.toString().split('.').last] = openHoursList
  //           .map((OpenHours openHours) => openHours.toFirebaseFormattedString())
  //           .toList();
  //     }
  //   });

  //   return json;
  // }

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
      json[weekday.toFirebaseFormatString()] = openHours[weekday]
          ?.map((OpenHours e) => e.toFirebaseFormattedString())
          .toList();
    });
    mezDbgPrint(" ------- Schedule toFirebaseFormattedJson  ------- \n $json");
    return json;
  }

  // Map<String, OpenHours> concatenatedVersion() {
  //   final Map<String, OpenHours> json = <String, OpenHours>{};
  //   final List<Weekday> weekdays = Weekday.values;
  //   String? previousDayOpenHours;
  //   String? currentStringKey;
  //   for (int i = 0; i < weekdays.length; i++) {
  //     final Weekday weekday = weekdays[i];
  //     if (openHours[weekday] == null) continue;
  //     if (previousDayOpenHours != openHours[weekday].toString()) {
  //       currentStringKey = weekday.toFirebaseFormatString();
  //       if (openHours[weekday]!.isOpen) {
  //         json[currentStringKey] = openHours[weekday]!;
  //         previousDayOpenHours = openHours[weekday].toString();
  //       } else {
  //         previousDayOpenHours = null;
  //       }
  //     } else {
  //       json.remove(currentStringKey);
  //       currentStringKey =
  //           "${currentStringKey!.split('-')[0].inCaps}-${weekday.toFirebaseFormatString().inCaps}";
  //       json[currentStringKey] = openHours[weekday]!;
  //     }
  //   }
  //   return json;
  // }
  Map<String, OpenHours> concatenatedVersion() {
    final Map<String, OpenHours> json = {};
    final List<Weekday> weekdays = Weekday.values;
    OpenHours? previousOpenHours;
    String? currentStringKey;

    for (final Weekday weekday in weekdays) {
      final List<OpenHours> hours = openHours[weekday] ?? [];

      if (hours.isEmpty) continue;

      final OpenHours currentOpenHours = hours.first;

      if (previousOpenHours != currentOpenHours) {
        currentStringKey = weekday.toFirebaseFormatString();

        if (currentOpenHours.isOpen) {
          json[currentStringKey] = currentOpenHours;
          previousOpenHours = currentOpenHours;
        } else {
          previousOpenHours = null;
        }
      } else {
        json.remove(currentStringKey);

        final String firstPart = currentStringKey!.split('-')[0].inCaps;
        final String secondPart = weekday.toFirebaseFormatString().inCaps;
        currentStringKey = "$firstPart-$secondPart";

        final OpenHours? openHoursWithIsOpen =
            hours.firstWhereOrNull((OpenHours hour) => hour.isOpen);
        if (openHoursWithIsOpen != null) {
          json[currentStringKey] = openHoursWithIsOpen;
        }
      }
    }
    mezDbgPrint("printing the json inside concatenatedVersion $json");

    return json;
  }

  Schedule clone() {
    final Map<Weekday, List<OpenHours>> _cloneOpenHours = {};
    openHours.forEach((Weekday key, List<OpenHours> value) {
      _cloneOpenHours[key] =
          List<OpenHours>.from(value.map((OpenHours hour) => hour.clone()));
    });

    final Schedule newSchedule = Schedule(openHours: _cloneOpenHours);

    return newSchedule;
  }

  // Schedule clone() {
  //   final Map<Weekday, OpenHours> _cloneSchedule = {};
  //   openHours.forEach((Weekday key, OpenHours value) {
  //     _cloneSchedule[key] = value.clone();
  //   });

  //   final Schedule newSchedule = Schedule(openHours: _cloneSchedule);

  //   return newSchedule;
  // }

  List<String> getServiceDates() {
    final List<String> data = [];
    openHours.keys.forEach((Weekday element) {
      final List<OpenHours>? hours = openHours[element];
      if (hours != null &&
          hours.isNotEmpty &&
          hours.any((OpenHours hour) => hour.isOpen)) {
        data.add(element.toFirebaseFormatString());
      }
    });

    return data;
  }

  DateTime getTheCLosestOpenDay() {
    DateTime data = DateTime.now();
    if (getServiceDates()
        .contains(DateFormat("EEEE").format(DateTime.now()).toLowerCase())) {
      data = DateTime.now(); //.toUtc().add(
      // Duration(hours: timezone[0].toInt(), minutes: timezone[1].toInt()));
    } else {
      DateTime testDate = DateTime.now(); //.toUtc().add(
      // Duration(hours: timezone[0].toInt(), minutes: timezone[1].toInt()));
      for (int i = 0; i < 7; i++) {
        testDate = DateTime(testDate.year, testDate.month, testDate.day + i);
        if (getServiceDates()
            .contains(DateFormat("EEEE").format(testDate).toLowerCase())) {
          data = testDate;
          break;
        }
      }
    }
    return data;
  }
}
