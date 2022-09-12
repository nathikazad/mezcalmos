import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
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
  }) {
    _initVariables(mode, initPeriod, period, numberOfdays);
    _initStartDateValue(initialDate?.toLocal());
    if (pickFromPeriod) {
      _initPickerModePeriodic();
    }
    if (pickTimeRange) {
      _initPickerModeRange();
    }

    if (schedule != null) {
      serviceSchedule = schedule;
      //   _initTimeValue(p: initPeriod?.toLocal());
    }
    setAmPm();
  }

  void _initVariables(
    MezTimePickerMode mode,
    PeriodOfTime? initPeriod,
    bool? period,
    int numberOfdays,
  ) {
    this.mode.value = mode;
    periodOfTime.value = initPeriod?.toLocal();
    periodic.value = period ?? false;
    numberOfDaysInterval = numberOfdays;
    if (pickFromPeriod) {
      maxHours.value = periodOfTime.value?.end.toLocal().hour ?? null;
      minHours.value = periodOfTime.value?.start.toLocal().hour ?? null;
      maxMinutes.value = periodOfTime.value?.end.minute ?? null;
      minMinutes.value = periodOfTime.value?.start.minute ?? null;
    }
  }

  void _initStartDateValue(DateTime? initialDate) {
    if (initialDate != null) {
      startDate = initialDate.toLocal();
      hours.value = initialDate.hour;
      minutes.value = initialDate.minute;
    } else {
      startDate = DateTime.now().toLocal();
    }
    pickedDate.value = startDate.toLocal();
  }

  void _initPickerModePeriodic() {
    mezDbgPrint("LLLLLLLLLLL   ${startDate.toLocal()}");
    pickedDate.value = DateTime(startDate.year, startDate.month, startDate.day);
    hours.value = startDate.toLocal().hour;
    minutes.value = startDate.toLocal().minute;
  }

  void _initPickerModeRange() {
    mezDbgPrint(
        "pick from range init =======>${periodOfTime.value.toString()}");
    startDate = periodOfTime.value!.start;
    pickedDate.value = periodOfTime.value!.end;

    startHours.value = periodOfTime.value!.start.toLocal().hour;
    startMinutes.value = periodOfTime.value!.start.minute;
    endtHours.value = periodOfTime.value!.end.toLocal().hour;
    endMinutes.value = periodOfTime.value!.end.minute;
    // init period selctor without old data
    mezDbgPrint(pickedDate.value);
  }

  void _initTimeValue({PeriodOfTime? p}) {
    // init of single datetime
    if (periodic.isFalse) {
      hours.value = startDate.hour;
      minutes.value = getMinutes.closest(startDate.minute);
      // init with old period of time //
    } else if (p != null) {
      startDate = DateTime(
        p.start.toLocal().year,
        p.start.toLocal().month,
        p.start.toLocal().day,
      );
      pickedDate.value = DateTime(
        p.start.toLocal().year,
        p.start.toLocal().month,
        p.start.toLocal().day,
      );
      startHours.value = p.start.toLocal().hour;
      startMinutes.value = p.start.minute;
      endtHours.value = p.end.toLocal().hour;
      endMinutes.value = p.end.minute;
      // init period selctor without old data
    } else {
      startHours.value = selectedWorkDay.value.from.first;
      startMinutes.value = selectedWorkDay.value.from[1];
      endtHours.value = selectedWorkDay.value.to.first;
      endMinutes.value = 0;
    }
    setAmPm();
  }

  /// Set period of time based on picked date or the object passed in
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

  /// Called whenever the date changes
  void changeDate(DateTime newValue) {
    pickedDate.value = newValue;
    if (periodic.isFalse) {
      if (!pickFromPeriod) {
        hours.value = selectedWorkDay.value.from.first;
        minutes.value = selectedWorkDay.value.from[1];
      } else {
        hours.value = minHours.value;
        minutes.value = minMinutes.value;
      }
    } else {
      startHours.value = selectedWorkDay.value.from.first;
      startMinutes.value = selectedWorkDay.value.from[1];
      endtHours.value = selectedWorkDay.value.to.first;
      endMinutes.value = 0;
      _setPeriodOfTime();
    }
    setAmPm();
  }

  /// Called whenever the hours changes
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

  /// Called whenever the minutes changes
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

  /// Updates the AM/PM dropdown based on hours
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

  // Getters && Helpers //
  // -------------------//
  /// Getting available dates based on service schedule
  List<DateTime> get getDates {
    return _constructDateChoices();
  }

  // List<DateTime> _getSpecDays() {
  //   final List<DateTime> dates = [];

  //   for (int i = 0; i < numberOfDaysInterval; i++) {
  //     final DateTime newDate = DateTime(
  //       periodOfTime.value!.start.year,
  //       periodOfTime.value!.start.month,
  //       periodOfTime.value!.start.day + i,
  //     );
  //     if (_getServiceDates()
  //         .contains(DateFormat("EEEE").format(newDate).toLowerCase())) {
  //       dates.add(newDate);
  //     }
  //   }
  //   return dates;
  // }

  /// Constructing a list of DateTime based on schedule
  List<DateTime> _constructDateChoices() {
    final List<DateTime> dates = (pickFromPeriod) ? [pickedDate.value!] : [];

    for (int i = 0; i < numberOfDaysInterval; i++) {
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

  List<int> get getHours {
    final List<int> hours = [];

    for (int i = minHours.value ?? selectedWorkDay.value.from.first;
        i <= (maxHours.value ?? selectedWorkDay.value.to.first);
        i++) {
      hours.add(i);
    }
    mezDbgPrint("HOURS ==============>>>> ${hours.toString()}");

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
    if (minMinutes.value != null &&
        maxMinutes.value != null &&
        pickFromPeriod) {
      for (int i = minMinutes.value!;
          i <= ((hours.value == maxHours.value) ? maxMinutes.value! : 59);
          i = i + 5) {
        data.add(i);
      }
    } else if (hours.value == selectedWorkDay.value.from.first) {
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

  /// Filtering and creating an array of weekdays based on service schedule
  List<String> _getServiceDates() {
    final List<String> data = [];
    serviceSchedule?.openHours.keys.forEach((Weekday element) {
      if (serviceSchedule!.openHours[element]!.isOpen) {
        data.add(element.toFirebaseFormatString());
      }
    });

    return data;
  }

  bool get pickFromPeriod {
    return mode.value == MezTimePickerMode.PickDeliveryTime &&
        periodOfTime.value != null;
  }

  bool get pickTimeRange {
    return mode.value == MezTimePickerMode.PickTimeRange &&
        periodOfTime.value != null;
  }

  /// return the selected date on Weekday format
  MapEntry<Weekday, OpenHours> get selectedWorkDay {
    return serviceSchedule!.getOpenHours.entries.firstWhere(
        (MapEntry<Weekday, OpenHours> element) =>
            element.key.toFirebaseFormatString() ==
            DateFormat("EEEE")
                .format(pickedDate.value ?? DateTime.now())
                .toLowerCase());
  }

  // Confirm CallBack //

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
