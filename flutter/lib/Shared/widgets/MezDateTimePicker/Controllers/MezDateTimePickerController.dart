import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

class MezDateTimePickerController {
  // main variables //
  Rxn<DateTime> pickedDate = Rxn();
  RxnInt hours = RxnInt();
  RxnInt minutes = RxnInt();
  Rx<AmPmEnum> amPmValue = Rx(AmPmEnum.AM);
  Schedule? serviceSchedule;
  late DateTime startDate;
  late int numberOfDaysInterval;

  // methods //
  void init(
      {required DateTime initialDate,
      required int numberOfdays,
      Schedule? schedule}) {
    startDate = initialDate;

    numberOfDaysInterval = numberOfdays;
    pickedDate.value = startDate;
    if (schedule != null) {
      serviceSchedule = schedule;
      setTime();
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
    final MapEntry<Weekday, OpenHours> day = serviceSchedule!
        .getOpenHours.entries
        .firstWhere((MapEntry<Weekday, OpenHours> element) =>
            element.key.toFirebaseFormatString() ==
            DateFormat("EEEE")
                .format(pickedDate.value ?? DateTime.now())
                .toLowerCase());
    for (int i = day.value.from.first; i <= day.value.to.first; i++) {
      hours.add(i);
    }

    return hours;
  }

  List<int> get getMinutes {
    List<int> data = [];
    if (hours.value == selectedWorkDay.value.from.first) {
      for (int i = selectedWorkDay.value.from[1]; i <= 59; i++) {
        data.add(i);
      }
    } else if (hours.value == selectedWorkDay.value.to.first) {
      if (selectedWorkDay.value.to[1] != 0) {
        for (int i = 0; i <= selectedWorkDay.value.to[1]; i++) {
          data.add(i);
        }
      } else
        data.add(0);
    } else {
      data = List<int>.generate(60, (int i) => i);
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

  void setTime() {
    hours.value = selectedWorkDay.value.from.first;
    minutes.value = selectedWorkDay.value.from[1];
  }

  void setAmPm() {
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
    final DateTime date = DateTime(
      pickedDate.value!.year,
      pickedDate.value!.month,
      pickedDate.value!.day,
      hours.value!,
      minutes.value!,
    );
    Get.back(result: date);
  }
}

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
