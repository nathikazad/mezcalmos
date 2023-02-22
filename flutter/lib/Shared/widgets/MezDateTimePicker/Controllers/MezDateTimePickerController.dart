import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Period.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

class MezDateTimePickerController {
  // main variables //
  Rxn<DateTime> pickedDate = Rxn();

  RxnInt hours = RxnInt();
  RxnInt minutes = RxnInt();

  Rx<AmPmEnum> amPmValue = Rx(AmPmEnum.AM);

  late Schedule serviceSchedule;

  late int numberOfDaysInterval;

  Rxn<PeriodOfTime> periodOfTime = Rxn();
  RxnInt maxHours = RxnInt();
  RxnInt maxMinutes = RxnInt();
  RxnInt minHours = RxnInt();
  RxnInt minMinutes = RxnInt();
  bool fixed7days = false;

  bool get _isToday {
    return pickedDate.value!.day == DateTime.now().day &&
        pickedDate.value!.month == DateTime.now().month;
  }

  bool get maxAndMinAreSet {
    return maxHours.value != null &&
        minHours.value != null &&
        maxMinutes.value != null &&
        minMinutes.value != null;
  }

  // methods //
  void init({
    required DateTime? initialDate,
    required int numberOfdays,
    required Schedule schedule,
    PeriodOfTime? initPeriod,
    bool? fixed7days,
  }) {
    this.fixed7days = fixed7days ?? false;
    numberOfDaysInterval = numberOfdays;
    serviceSchedule = schedule;

    if (initPeriod == null) {
      pickedDate.value = DateTime(
          initialDate?.toLocal().year ?? _getTheCLosestOpenDay().toLocal().year,
          initialDate?.toLocal().month ??
              _getTheCLosestOpenDay().toLocal().month,
          initialDate?.toLocal().day ?? _getTheCLosestOpenDay().toLocal().day);
      hours.value =
          initialDate?.toLocal().hour ?? selectedWorkDay.value.from.first;
      minutes.value =
          initialDate?.toLocal().minute ?? selectedWorkDay.value.from[1];
    } else {
      periodOfTime.value = initPeriod.toLocal();
      pickedDate.value = DateTime(
        periodOfTime.value!.start.year,
        periodOfTime.value!.start.month,
        periodOfTime.value!.start.day,
      );
      _setMinAndMAx();
      hours.value = minHours.value;
      minutes.value = minMinutes.value;
    }
    setAmPm();
  }

  void _setMinAndMAx() {
    maxHours.value = periodOfTime.value?.end.toLocal().hour ?? null;
    minHours.value = periodOfTime.value?.start.toLocal().hour ?? null;
    maxMinutes.value = periodOfTime.value?.end.minute ?? null;
    minMinutes.value = periodOfTime.value?.start.minute ?? null;
    if (_isToday && maxAndMinAreSet) {
      minHours.value = (DateTime.now().hour <= maxHours.value!)
          ? DateTime.now().hour
          : minHours.value;
      minMinutes.value = (DateTime.now().minute >= minMinutes.value!)
          ? getMinutes()
              .firstWhere((int element) => element > DateTime.now().minute)
          : minMinutes.value;
    }
  }

  /// Called whenever the date changes
  void changeDate(DateTime newValue) {
    pickedDate.value = newValue;
    if (!pickFromPeriod) {
      hours.value = selectedWorkDay.value.from.first;
      minutes.value = selectedWorkDay.value.from[1];
    } else {
      hours.value = minHours.value;
      minutes.value = minMinutes.value;
    }

    setAmPm();
  }

  /// Called whenever the hours changes
  void changeHours({required int hour, bool? start}) {
    hours.value = hour;
    if (!getMinutes().contains(minutes.value)) {
      minutes.value = getMinutes().first;
    }

    setAmPm();
  }

  /// Called whenever the minutes changes
  void changeMinutes({required int minuteValue, bool? start}) {
    minutes.value = minuteValue;
  }

  /// Updates the AM/PM dropdown based on hours
  void setAmPm() {
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

  /// Constructing a list of DateTime based on schedule
  List<DateTime> _constructDateChoices() {
    final List<DateTime> dates = [];

    for (int i = 0; i < numberOfDaysInterval; i++) {
      final DateTime newDate = DateTime(
        fixed7days ? DateTime.now().year : pickedDate.value!.year,
        fixed7days ? DateTime.now().month : pickedDate.value!.month,
        fixed7days ? DateTime.now().day + i : pickedDate.value!.day + i,
      );
      mezDbgPrint(_getServiceDates().toString());
      if (_getServiceDates()
          .contains(DateFormat("EEEE").format(newDate).toLowerCase())) {
        dates.add(newDate);
      }
    }

    return dates;
  }

  List<int> getHours() {
    final List<int> hours = [];

    for (int i = minHours.value ?? selectedWorkDay.value.from.first;
        i <= (maxHours.value ?? selectedWorkDay.value.to.first);
        i++) {
      hours.add(i);
    }

    return hours;
  }

  List<int> getMinutes() {
    final List<int> data = [];
    if (pickFromPeriod) {
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

  /// Filtering and creating an array of weekdays based on service schedule
  List<String> _getServiceDates() {
    final List<String> data = [];
    serviceSchedule.openHours.keys.forEach((Weekday element) {
      if (serviceSchedule.openHours[element]!.isOpen) {
        data.add(element.toFirebaseFormatString());
      }
    });

    return data;
  }

  bool get pickFromPeriod {
    return periodOfTime.value != null;
  }

  /// return the selected date on Weekday format
  MapEntry<Weekday, OpenHours> get selectedWorkDay {
    return serviceSchedule.getOpenHours.entries.firstWhere(
        (MapEntry<Weekday, OpenHours> element) =>
            element.key.toFirebaseFormatString() ==
            DateFormat("EEEE")
                .format(pickedDate.value?.toLocal() ?? DateTime.now().toLocal())
                .toLowerCase());
  }

  DateTime _getTheCLosestOpenDay() {
    return serviceSchedule.getTheCLosestOpenDay();
  }

  // Confirm CallBack //

  void confirmCallBack() {
    final DateTime date = DateTime(
      pickedDate.value!.year,
      pickedDate.value!.month,
      pickedDate.value!.day,
      hours.value!,
      minutes.value!,
    );

    MezRouter.back(result: date);
  }
}
