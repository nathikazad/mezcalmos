import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Period.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

class MezPeriodPickerController {
  // State variables //
  Rxn<PeriodOfTime> period = Rxn<PeriodOfTime>();
  Rx<DateTime> pickedDate = Rx<DateTime>(DateTime.now());
  RxnInt startHours = RxnInt();
  RxnInt startMinutes = RxnInt();
  RxnInt endtHours = RxnInt();
  RxnInt endMinutes = RxnInt();
  RxBool isEditing = RxBool(false);
  int numberOfDaysInterval = 7;
  Rx<AmPmEnum> startAmpPm = Rx(AmPmEnum.AM);
  Rx<AmPmEnum> endAmPm = Rx(AmPmEnum.AM);
  late Schedule serviceSchedule;

  // init //
  void init({required Schedule schedule, required PeriodOfTime? period}) {
    // assign variables //
    serviceSchedule = schedule;
    // init first time mode //
    if (period == null) {
      _initDefaultValues();
    }
    // init edit mode //
    else {
      isEditing.value = true;
      this.period.value = period;
      _initPeriodValues();
    }
    _setAmPm();
  }

  /// init hours and minutes values with values comming based on the period passed in
  /// basically it's used on edit mode of a period of time
  void _initPeriodValues() {
    pickedDate.value = DateTime(
      period.value!.start.toLocal().year,
      period.value!.start.toLocal().month,
      period.value!.start.toLocal().day,
    );
    startHours.value = period.value!.start.toLocal().hour;
    startMinutes.value = period.value!.start.minute;
    endtHours.value = period.value!.end.toLocal().hour;
    endMinutes.value = period.value!.end.minute;
  }

  /// init hours and minutes values with default values based on the open hours of selected day
  /// called once when the period passed to component is null
  void _initDefaultValues() {
    pickedDate.value = _getTheCLosestOpenDay();
    startHours.value = selectedWorkDay.value.from.first.toInt();
    startMinutes.value = selectedWorkDay.value.from[1].toInt();
    endtHours.value = selectedWorkDay.value.to.first.toInt();
    endMinutes.value = 0;
  }

  // Basic methods when changes date hours or minutes //
  void changeDate(DateTime newValue) {
    pickedDate.value = newValue;
    startHours.value = selectedWorkDay.value.from.first.toInt();
    startMinutes.value = selectedWorkDay.value.from[1].toInt();
    endtHours.value = selectedWorkDay.value.to.first.toInt();
    endMinutes.value = 0;
    _setPeriodOfTime();

    _setAmPm();
  }

  /// Called whenever the hours changes
  void changeHours({required int hour, required bool start}) {
    if (start) {
      startHours.value = hour;
      startMinutes.value = getStartMinutes().first;
    } else {
      endtHours.value = hour;
      endMinutes.value = getEndMinutes().first;
    }

    _setAmPm();
  }

  /// Called whenever the minutes changes
  void changeMinutes({required int minuteValue, required bool start}) {
    if (start) {
      startMinutes.value = minuteValue;
    } else {
      endMinutes.value = minuteValue;
    }
  }

  // DATE HANDLERS //
  List<DateTime> _constructDateChoices() {
    final List<DateTime> dates = [pickedDate.value];
    if (pickedDate.value.difference(DateTime.now().toLocal()).inDays > 1 &&
        pickedDate.value.difference(DateTime.now().toLocal()).inDays < 7) {
      dates.clear();
      for (int i = 1; i < numberOfDaysInterval; i++) {
        final DateTime newDate = DateTime(
          DateTime.now().toLocal().year,
          DateTime.now().toLocal().month,
          DateTime.now().toLocal().day + i,
        );

        if (_getServiceDates()
            .contains(DateFormat("EEEE").format(newDate).toLowerCase())) {
          dates.add(newDate);
        }
      }
    } else {
      for (int i = 1; i < numberOfDaysInterval; i++) {
        final DateTime newDate = DateTime(
          pickedDate.value.year,
          pickedDate.value.month,
          pickedDate.value.day + i,
        );

        if (_getServiceDates()
            .contains(DateFormat("EEEE").format(newDate).toLowerCase())) {
          dates.add(newDate);
        }
      }
    }

    if (dates.last.isBefore(DateTime.now().toLocal())) {
      dates.clear();
      dates.add(pickedDate.value);
      for (int i = 0; i < numberOfDaysInterval; i++) {
        final DateTime newDate = DateTime(
          DateTime.now().toLocal().year,
          DateTime.now().toLocal().month,
          DateTime.now().toLocal().day + i,
        );

        if (_getServiceDates()
            .contains(DateFormat("EEEE").format(newDate).toLowerCase())) {
          dates.add(newDate);
        }
      }
    }

    return dates;
  }

  // HOURS HANDLERS //
  List<int> getStartHours() {
    final List<int> hours = [];
    for (int i = selectedWorkDay.value.from.first.toInt();
        i <= selectedWorkDay.value.to.first - 1;
        i++) {
      hours.add(i);
    }

    return hours;
  }

  List<int> getEndtHours() {
    final List<int> hours = [];
    for (int i = startHours.value! + 1;
        i <= selectedWorkDay.value.to.first;
        i++) {
      hours.add(i);
    }

    return hours;
  }

  //  MINUTES HANDLERS //
  List<int> getEndMinutes() {
    final List<int> data = [];
    if (endtHours.value == selectedWorkDay.value.from.first) {
      for (int i = selectedWorkDay.value.from[1].toInt(); i <= 59; i = i + 5) {
        data.add(i);
      }
    } else if (endtHours.value == selectedWorkDay.value.to.first) {
      if (selectedWorkDay.value.to[1] != 0) {
        for (int i = 0; i <= selectedWorkDay.value.to[1]; i = i + 5) {
          data.add(i);
        }
      } else
        data.add(0);
    } else {
      for (int i = 0; i <= 59; i = i + 5) {
        data.add(i);
      }
    }

    return data.toSet().toList();
  }

  List<int> getStartMinutes() {
    final List<int> data = [];
    if (startHours.value == selectedWorkDay.value.from.first) {
      for (int i = selectedWorkDay.value.from[1].toInt(); i <= 59; i = i + 5) {
        data.add(i);
      }
    } else if (startHours.value == selectedWorkDay.value.to.first) {
      if (selectedWorkDay.value.to[1] != 0) {
        for (int i = 0; i <= selectedWorkDay.value.to[1]; i = i + 5) {
          data.add(i);
        }
      } else
        data.add(0);
    } else {
      for (int i = 0; i <= 59; i = i + 5) {
        data.add(i);
      }
    }

    return data.toSet().toList();
  }

  // AM/PM HANDLERS //
  void _setAmPm() {
    if (startHours.value != null && startHours.value! >= 12) {
      startAmpPm.value = AmPmEnum.PM;
    } else if (startHours.value != null) {
      startAmpPm.value = AmPmEnum.AM;
    }
    if (endtHours.value != null && endtHours.value! >= 12) {
      endAmPm.value = AmPmEnum.PM;
    } else if (endtHours.value != null) {
      endAmPm.value = AmPmEnum.AM;
    }
  }

  // setters //
  /// Updates the period value based on values
  /// should be called before the confirma callback
  void _setPeriodOfTime() {
    period.value = PeriodOfTime(
      start: DateTime(
        pickedDate.value.year,
        pickedDate.value.month,
        pickedDate.value.day,
        startHours.value!,
        startMinutes.value!,
      ),
      end: DateTime(
        pickedDate.value.year,
        pickedDate.value.month,
        pickedDate.value.day,
        endtHours.value!,
        endMinutes.value!,
      ),
    );
  }

  /// this getter will return null if the pickedDate value is null
  MapEntry<Weekday, OpenHours> get selectedWorkDay {
    return serviceSchedule.openHours.entries.firstWhere(
        (MapEntry<Weekday, OpenHours> element) =>
            element.key.toFirebaseFormatString() ==
            DateFormat("EEEE")
                .format(pickedDate.value.toLocal())
                .toLowerCase());
  }

  DateTime _getTheCLosestOpenDay() {
    return serviceSchedule.getTheCLosestOpenDay();
  }

  /// Returns an array of strings with open days names
  /// based on service schedule,
  /// For example ["friday","sunday","monday"]
  List<String> _getServiceDates() {
    final List<String> data = [];
    serviceSchedule.openHours.keys.forEach((Weekday element) {
      if (serviceSchedule.openHours[element]!.isOpen) {
        data.add(element.toFirebaseFormatString());
      }
    });

    return data;
  }

  // getters //

  List<DateTime> get getDates {
    return _constructDateChoices();
  }

  void confirmCallBack(BuildContext context) {
    mezDbgPrint("ConfirmCallBack");
    _setPeriodOfTime();

    if (period.value != null) {
      Navigator.pop(context, period.value!);
    }
  }
}
