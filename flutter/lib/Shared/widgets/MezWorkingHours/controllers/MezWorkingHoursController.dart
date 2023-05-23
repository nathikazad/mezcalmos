import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

class MezWorkingHoursController {
  final Rxn<Schedule> _workingHours = Rxn<Schedule>();
  Schedule get workingHours => _workingHours.value!;

  void initialize({required Schedule schedule}) {
    // Initialize the working hours with default values or fetch from an API
    _workingHours.value = schedule;
  }

  void addWorkingHour({
    required Weekday day,
    required OpenHours openHours,
  }) {
    if (_workingHours.value == null) {
      _workingHours.value = Schedule(openHours: {
        day: [openHours]
      });
    } else {
      if (_workingHours.value!.openHours.containsKey(day)) {
        _workingHours.value!.openHours[day]!.add(openHours);
      } else {
        _workingHours.value!.openHours[day] = [openHours];
      }
    }
  }

  void removeWorkingHour({
    required Weekday day,
    required int index,
  }) {
    if (_workingHours.value != null &&
        _workingHours.value!.openHours.containsKey(day)) {
      if (index >= 0 && index < _workingHours.value!.openHours[day]!.length) {
        _workingHours.value!.openHours[day]!.removeAt(index);
      }
    }
  }

  bool isOpen({
    required Weekday day,
  }) {
    if (_workingHours.value != null &&
        _workingHours.value!.openHours.containsKey(day)) {
      return _workingHours.value!.openHours[day]!.isNotEmpty;
    }
    return false;
  }

  void updateOpeningTime({
    required Weekday day,
    required int index,
    required int hour,
    required int minute,
  }) {
    if (_workingHours.value != null &&
        _workingHours.value!.openHours.containsKey(day)) {
      if (index >= 0 && index < _workingHours.value!.openHours[day]!.length) {
        _workingHours.value!.openHours[day]![index].from = [hour, minute];
      }
    }
  }

  void updateClosingTime({
    required Weekday day,
    required int index,
    required int hour,
    required int minute,
  }) {
    if (_workingHours.value != null &&
        _workingHours.value!.openHours.containsKey(day)) {
      if (index >= 0 && index < _workingHours.value!.openHours[day]!.length) {
        _workingHours.value!.openHours[day]![index].to = [hour, minute];
      }
    }
  }

  bool validateWorkingHours() {
    if (_workingHours.value == null || _workingHours.value!.openHours.isEmpty) {
      return false;
    }

    for (Weekday day in _workingHours.value!.openHours.keys) {
      List<OpenHours> openHoursList = _workingHours.value!.openHours[day]!;
      for (OpenHours openHours in openHoursList) {
        if (openHours.isOpen &&
            openHours.from[0] >= openHours.to[0] &&
            openHours.from[1] >= openHours.to[1]) {
          return false;
        }
      }
    }

    return true;
  }

  void updateOpenStatus(
      {required Weekday day, required int index, required bool isOpen}) {
    if (_workingHours.value != null &&
        _workingHours.value!.openHours.containsKey(day)) {
      _workingHours.value!.openHours[day]![index].isOpen = isOpen;
    }
  }



  // Future<TimeOfDay?> showTimePicker(
  //     BuildContext context, TimeOfDay initialTime) async {
  //   return await showTimePicker(
  //     context: context,
  //     initialTime: initialTime,
  //   );
  // }
}
