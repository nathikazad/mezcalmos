// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
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

class Schedule {
  final Map<Weekday, WorkingDay> openHours;
  const Schedule({
    required this.openHours,
  });
}

Schedule scheduleFromData(json) {
  Map<Weekday, WorkingDay> openHours = {};
  if (json != null) {
    for (String weekdayKey in json.keys) {
      final Weekday weekday = Weekday.values
          .firstWhere((Weekday e) => e.toFirebaseFormatString() == weekdayKey);
      final dynamic workindDay = json[weekdayKey];
      if (workindDay is List) {
        throw Exception(
            "The schedule is in the old format <Weekday : <OpenHours>[]>, please update it");
      }
      if (workindDay["openHours"] != null) {
        List<OpenHours> openHoursList = workindDay["openHours"]
            .map<OpenHours>((hourJson) => openHoursfromJson(hourJson))
            .toList();
        openHours[weekday] = WorkingDay(
            isOpen: workindDay["isOpen"] ?? true, openHours: openHoursList);
      }
      // the old format
      else {
        final OpenHours singleOpenHour = openHoursfromJson(workindDay);

        openHours[weekday] =
            WorkingDay(isOpen: true, openHours: [singleOpenHour]);
      }
      //  }
    }
  }
  List<Weekday> sortedKeys = openHours.keys.toList()
    ..sort((Weekday a, Weekday b) => a.index.compareTo(b.index));

  Map<Weekday, WorkingDay> sortedOpenHours =
      Map.fromIterable(sortedKeys, key: (k) => k, value: (k) => openHours[k]!);
  return Schedule(openHours: sortedOpenHours);
}

extension ScheduleFunctions on Schedule {
  bool get atLeastOneDayIsOpen {
    return openHours.values.toList().firstWhereOrNull((WorkingDay element) {
          return element.isOpen == true;
        }) !=
        null;
  }

  // bool isOpen {
  //   bool isOpen = false;
  //   final String dayName = DateFormat('EEEE').format(DateTime.now());
  //   final DateTime now = DateTime.now();
  //   final Weekday? currentWeekday = Weekday.values.firstWhereOrNull(
  //     (Weekday weekday) =>
  //         weekday.toFirebaseFormatString() == dayName.toLowerCase(),
  //   );

  //   if (currentWeekday != null) {
  //     final List<OpenHours>? hours = openHours[currentWeekday]?.openHours;
  //     if (hours != null) {
  //       for (final OpenHours openHour in hours) {
  //         if (openHours[currentWeekday]?.isOpen == true) {
  //           final num openingHour = openHour.from[0];
  //           final num openingMinute = openHour.from[1];
  //           final num closingHour = openHour.to[0];
  //           final num closingMinute = openHour.to[1];

  //           final num currentHour = now.hour;
  //           final num currentMinute = now.minute;

  //           if (currentHour > openingHour && currentHour < closingHour) {
  //             isOpen = true;
  //             break;
  //           } else if (currentHour == openingHour &&
  //               currentMinute >= openingMinute) {
  //             isOpen = true;
  //             break;
  //           } else if (currentHour == closingHour &&
  //               currentMinute < closingMinute) {
  //             isOpen = true;
  //             break;
  //           }
  //         }
  //       }
  //     }
  //   }

  //   return isOpen;
  // }

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

    Weekday.values.forEach((Weekday weekday) {
      json[weekday.toFirebaseFormatString()] = {
        "isOpen": openHours[weekday]!.isOpen,
        "openHours": openHours[weekday]
            ?.openHours
            .map((OpenHours e) => e.toFirebaseFormattedString())
            .toList()
      };
    });
    mezDbgPrint(" ------- Schedule toFirebaseFormattedJson  ------- \n $json");
    return json;
  }

  Map<String, WorkingDay> concatenatedVersion() {
    final Map<String, WorkingDay> json = <String, WorkingDay>{};
    final List<Weekday> weekdays = Weekday.values;
    String? previousDayOpenHours;
    String? currentStringKey;

    for (int i = 0; i < weekdays.length; i++) {
      final Weekday weekday = weekdays[i];
      if (openHours[weekday] == null) continue;

      if (previousDayOpenHours != openHours[weekday].toString()) {
        currentStringKey = weekday.toFirebaseFormatString().inCaps;
        if (openHours[weekday]!.isOpen) {
          json[currentStringKey] = openHours[weekday]!;
          previousDayOpenHours = openHours[weekday].toString();
        } else {
          previousDayOpenHours = null;
        }
      } else {
        final WorkingDay currentWorkingDay = openHours[weekday]!;
        final WorkingDay previousWorkingDay = json[currentStringKey]!;

        if (areWorkingDaysEqual(currentWorkingDay, previousWorkingDay)) {
          json.remove(currentStringKey);
          currentStringKey =
              "${currentStringKey!.split('-')[0].toString().inCaps}-${weekday.toFirebaseFormatString().inCaps}";
          json[currentStringKey] = openHours[weekday]!;
        } else {
          currentStringKey = "${weekday.toFirebaseFormatString().inCaps}";
          json[currentStringKey] = openHours[weekday]!;
        }
      }
    }
    return json;
  }

  bool areWorkingDaysEqual(WorkingDay day1, WorkingDay day2) {
    if (day1.isOpen != day2.isOpen) return false;
    if (day1.openHours.length != day2.openHours.length) return false;

    for (int i = 0; i < day1.openHours.length; i++) {
      final OpenHours openHours1 = day1.openHours[i];
      final OpenHours openHours2 = day2.openHours[i];
      if (DeepCollectionEquality().equals(openHours1, openHours2)) return false;
    }
    return true;
  }

  Schedule clone() {
    final Map<Weekday, WorkingDay> clonedOpenHours =
        Map<Weekday, WorkingDay>.from(openHours.map(
      (Weekday key, WorkingDay value) => MapEntry(key, value.clone()),
    ));

    return Schedule(openHours: clonedOpenHours);
  }

  List<String> getServiceDates() {
    final List<String> data = [];
    openHours.keys.forEach((Weekday element) {
      final List<OpenHours>? hours = openHours[element]?.openHours;
      if (hours != null &&
          hours.isNotEmpty &&
          openHours[element]?.isOpen == true) {
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

// working day
extension WorkingDayExtension on WorkingDay {
  WorkingDay clone() {
    final List<OpenHours> clonedOpenHours = List<OpenHours>.from(openHours.map(
      (OpenHours openHour) => openHour.clone(),
    ));

    return WorkingDay(
      isOpen: isOpen,
      openHours: clonedOpenHours,
    );
  }

  bool get hasOverlaps {
    openHours
        .sort((OpenHours a, OpenHours b) => a.from[0].compareTo(b.from[0]));

    for (int i = 0; i < openHours.length - 1; i++) {
      final OpenHours current = openHours[i];
      final OpenHours next = openHours[i + 1];
      mezDbgPrint("current ${current.from[0]} next ${next.from[0]}");

      if (current.toOld[0] > next.fromOld[0]) {
        return true;
      }
    }
    return false;
  }
}

// open hours
extension OpenHoursFunctions on OpenHours {
  List<num> get fromOld {
    final List<String> timeParts = from.split(':');
    final int hours = int.parse(timeParts[0]);
    final int minutes = int.parse(timeParts[1]);
    return [hours, minutes];
  }

  List<num> get toOld {
    final List<String> timeParts = to.split(':');
    final int hours = int.parse(timeParts[0]);
    final int minutes = int.parse(timeParts[1]);
    return [hours, minutes];
  }

  Map<String, dynamic> toFirebaseFormattedString() {
    return <String, dynamic>{"from": from, "to": to};
  }

  String get fromTimeFormatted {
    final String hours = fromOld[0] == 12
        ? '12'
        : (fromOld[0] > 12 ? fromOld[0] - 12 : fromOld[0])
            .toString()
            .padLeft(2, '0');

    final String minutes = from[1].toString().padLeft(2, '0');
    final String period = fromOld[0] < 12 ? 'AM' : 'PM';

    return '$hours:$minutes $period';
  }

  String get toTimeFormatted {
    final String hours = to[0] == 12
        ? '12'
        : (toOld[0] > 12 ? toOld[0] - 12 : toOld[0]).toString().padLeft(2, '0');

    final String minutes = toOld[1].toString().padLeft(2, '0');

    final String period = toOld[0] < 12 ? 'AM' : 'PM';

    return '$hours:$minutes $period';
  }

  OpenHours clone() {
    return OpenHours(
      from: from,
      to: to,
    );
  }
}

OpenHours openHoursfromJson(Map<dynamic, dynamic> json) {
  return OpenHours(
    from: json['from'] as String,
    to: json['to'],
  );
}

// weekday

extension WeekdayExtension on Weekday {
  String translate() {
    return Get.find<LanguageController>().strings["BusinessApp"]["pages"]
        ["services"]["weekdays"][toFirebaseFormatString()];
  }
}

extension ScheduleMapHelper on Map<Weekday, WorkingDay> {
  Map<String, dynamic> toFirebaseFormattedJson() {
    final Map<String, dynamic> json = <String, dynamic>{};

    Weekday.values.forEach((Weekday weekday) {
      json[weekday.toFirebaseFormatString()] = {
        "isOpen": this[weekday]!.isOpen,
        "openHours": this[weekday]
            ?.openHours
            .map((OpenHours e) => e.toFirebaseFormattedString())
            .toList()
      };
    });
    mezDbgPrint(" ------- Schedule toFirebaseFormattedJson  ------- \n $json");
    return json;
  }

  Schedule toSchedule() {
    return Schedule(openHours: this);
  }
}
