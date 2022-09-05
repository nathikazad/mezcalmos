import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Period.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

class MezDateTimePickerController {
  // main variables //
  Rxn<DateTime> pickedDate = Rxn();
  Rx<MezTimePickerMode> mode = Rx(MezTimePickerMode.PickDeliveryTime);
  RxnInt hours = RxnInt();
  RxnInt minutes = RxnInt();
  RxnInt startHours = RxnInt();
  RxnInt startMinutes = RxnInt();
  RxnInt endtHours = RxnInt();
  RxnInt endMinutes = RxnInt();
  Rx<AmPmEnum> amPmValue = Rx(AmPmEnum.AM);
  Rx<AmPmEnum> startAmpPm = Rx(AmPmEnum.AM);
  Rx<AmPmEnum> endAmPm = Rx(AmPmEnum.AM);
  Schedule? serviceSchedule;
  late DateTime startDate;
  late int numberOfDaysInterval;
  RxBool periodic = RxBool(false);
  Rxn<PeriodOfTime> periodOfTime = Rxn();
  RxnInt maxHours = RxnInt();
  RxnInt maxMinutes = RxnInt();
  RxnInt minHours = RxnInt();
  RxnInt minMinutes = RxnInt();

  // methods //
  void init({
    required DateTime? initialDate,
    required int numberOfdays,
    required MezTimePickerMode mode,
    Schedule? schedule,
    bool? period,
    PeriodOfTime? initPeriod,
    int? maxHours,
    int? minHours,
    int? maxMinutes,
    int? minMinutes,
  }) {
    this.mode.value = mode;
    periodic.value = period ?? false;
    this.maxHours.value = maxHours ?? null;
    this.minHours.value = minHours ?? null;
    this.maxMinutes.value = maxMinutes ?? null;
    this.minMinutes.value = minMinutes ?? null;

    if (initialDate != null) {
      startDate = initialDate;
      hours.value = this.minHours.value ?? initialDate.hour;
      minutes.value = this.minMinutes.value ?? initialDate.minute;
    } else {
      startDate = DateTime.now();
    }

    numberOfDaysInterval = numberOfdays;
    pickedDate.value = startDate;
    if (schedule != null) {
      serviceSchedule = schedule;
      setTime(p: initPeriod);
    }
  }

  List<DateTime> _constructDateChoices() {
    final List<DateTime> dates = [startDate];

    for (int i = 1; i < numberOfDaysInterval; i++) {
      final DateTime newDate = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day + i,
      );
      if (_getServiceDates()
          .contains(DateFormat("EEEE").format(newDate).toLowerCase())) {
        dates.add(newDate);
      }
    }

    return dates;
  }

  List<DateTime> get getDates {
    return _constructDateChoices();
  }

  List<int> get getHours {
    final List<int> hours = [];
    for (int i = minHours.value ?? selectedWorkDay.value.from.first;
        i <= (maxHours.value ?? selectedWorkDay.value.to.first);
        i++) {
      hours.add(i);
    }

    return hours;
  }

  List<int> get getStartHours {
    final List<int> hours = [];
    for (int i = selectedWorkDay.value.from.first;
        i <= selectedWorkDay.value.to.first - 1;
        i++) {
      hours.add(i);
    }

    return hours;
  }

  List<int> get getEndtHours {
    final List<int> hours = [];
    for (int i = startHours.value! + 1;
        i <= selectedWorkDay.value.to.first;
        i++) {
      hours.add(i);
    }

    return hours;
  }

  List<int> get getMinutes {
    final List<int> data = [];
    if (hours.value == selectedWorkDay.value.from.first) {
      for (int i = selectedWorkDay.value.from[1]; i <= 59; i = i + 5) {
        data.add(i);
      }
    } else if (hours.value == selectedWorkDay.value.to.first) {
      if (selectedWorkDay.value.to[1] != 0) {
        for (int i = 0; i <= selectedWorkDay.value.to[1]; i = i + 5) {
          data.add(i);
        }
      } else
        data.add(0);
    } else if (minMinutes.value != null && maxMinutes.value != null) {
      for (int i = minMinutes.value!;
          i <= ((hours.value == maxHours.value) ? maxMinutes.value! : 59);
          i = i + 5) {
        data.add(i);
      }
    } else {
      for (int i = 0; i <= 59; i = i + 5) {
        data.add(i);
      }
    }

    return data.toSet().toList();
  }

  List<int> get getEndMinutes {
    final List<int> data = [];
    if (endtHours.value == selectedWorkDay.value.from.first) {
      for (int i = selectedWorkDay.value.from[1]; i <= 59; i = i + 5) {
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

  List<int> get getStartMinutes {
    final List<int> data = [];
    if (startHours.value == selectedWorkDay.value.from.first) {
      for (int i = selectedWorkDay.value.from[1]; i <= 59; i = i + 5) {
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

  List<String> _getServiceDates() {
    final List<String> data = [];
    serviceSchedule?.openHours.keys.forEach((Weekday element) {
      if (serviceSchedule!.openHours[element]!.isOpen) {
        data.add(element.toFirebaseFormatString());
      }
    });

    return data;
  }

  void setTime({PeriodOfTime? p}) {
    if (periodic.isFalse) {
      hours.value = minHours.value ?? selectedWorkDay.value.from.first;
      minutes.value = minMinutes.value ?? selectedWorkDay.value.from[1];
    } else if (p != null) {
      pickedDate.value = DateTime(
        p.start.year,
        p.start.month,
        p.start.day,
      );
      startHours.value = p.start.hour.toAmpPmInt();
      startMinutes.value = p.start.minute;
      endtHours.value = p.end.hour.toAmpPmInt();
      endMinutes.value = p.end.minute;
    } else {
      startHours.value = selectedWorkDay.value.from.first;
      startMinutes.value = selectedWorkDay.value.from[1];
      endtHours.value = selectedWorkDay.value.to.first;
      endMinutes.value = 0;
    }
    setAmPm();
  }

  void _setPeriodOfTime({PeriodOfTime? period}) {
    if (period == null) {
      periodOfTime.value = PeriodOfTime(
        start: DateTime(
          pickedDate.value!.year,
          pickedDate.value!.month,
          pickedDate.value!.day,
          startHours.value!,
          startMinutes.value!,
        ),
        end: DateTime(
          pickedDate.value!.year,
          pickedDate.value!.month,
          pickedDate.value!.day,
          endtHours.value!,
          endMinutes.value!,
        ),
      );
    } else
      periodOfTime.value = period;
  }

  void changeHours({required int hour, bool? start}) {
    if (periodic.isTrue) {
      if (start != null && start) {
        startHours.value = hour;
        startMinutes.value = getStartMinutes.first;
      } else if (start != null) {
        endtHours.value = hour;
        endMinutes.value = getEndMinutes.first;
      }
      _setPeriodOfTime();
    } else {
      hours.value = hour;
      minutes.value = getMinutes.first;
    }
    setAmPm();
  }

  void changeMinutes({required int minuteValue, bool? start}) {
    if (periodic.isTrue) {
      if (start != null && start) {
        startMinutes.value = minuteValue;
      } else if (start != null) {
        endMinutes.value = minuteValue;
      }
      _setPeriodOfTime();
    } else {
      minutes.value = minuteValue;
    }
  }

  void setAmPm() {
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
    if (hours.value! >= 12) {
      amPmValue.value = AmPmEnum.PM;
    } else {
      amPmValue.value = AmPmEnum.AM;
    }
  }

  MapEntry<Weekday, OpenHours> get selectedWorkDay {
    return serviceSchedule!.getOpenHours.entries.firstWhere(
        (MapEntry<Weekday, OpenHours> element) =>
            element.key.toFirebaseFormatString() ==
            DateFormat("EEEE")
                .format(pickedDate.value ?? DateTime.now())
                .toLowerCase());
  }

  void confirmCallBack() {
    if (periodic.isFalse) {
      final DateTime date = DateTime(
        pickedDate.value!.year,
        pickedDate.value!.month,
        pickedDate.value!.day,
        hours.value!,
        minutes.value!,
      );

      Get.back(result: date);
    } else {
      Get.back(result: periodOfTime.value);
    }
  }
}

enum MezTimePickerMode { PickDeliveryTime, PickTimeRange }

enum AmPmEnum { AM, PM }

extension ParseDeliveryTypeToString on AmPmEnum {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }

  String toNormalString() {
    final String str = toString().split('.').last;

    return str;
  }
}
