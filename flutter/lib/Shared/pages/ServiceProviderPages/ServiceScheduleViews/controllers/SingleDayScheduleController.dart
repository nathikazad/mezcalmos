import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ['ServiceProviderPages']['ServiceScheduleViews']['SingleDayScheduleView'];

class SingleDayScheduleViewController {
  // final Rxn<Schedule> _workingDay.value?.openHours = Rxn<Schedule>();
  // Schedule get workingHours => _workingDay.value?.openHours.value!;
  Rxn<WorkingDay> _workingDay = Rxn<WorkingDay>();

  late Weekday day;

  List<OpenHours>? get workingHours => _workingDay.value?.openHours;
  WorkingDay? get workingDay => _workingDay.value;

  bool get hasData => _workingDay.value != null;

  void initialize({required Weekday day, required WorkingDay workingDay}) {
    this.day = day;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _workingDay.value = workingDay;
    });
    mezDbgPrint("Working hours =============> $workingHours");
  }

  void addWorkingHours({required OpenHours openHours}) {
    _workingDay.value?.openHours.add(openHours);
  }

  void editWorkingHours({required int index, required OpenHours openHours}) {
    _workingDay.value?.openHours[index] = openHours;
  }

  void newWorkingHours() {
    _workingDay.value?.openHours.add(OpenHours(from: [00, 00], to: [20, 00]));
    _workingDay.refresh();
  }

  void removeWorkingHours({required int index}) {
    _workingDay.value?.openHours.removeAt(index);
    _workingDay.refresh();
  }

  void saveWorkingHours() {
    if (_workingDay.value?.hasOverlaps == false) {
      MezRouter.back(backResult: _workingDay.value);
    } else {
      showErrorSnackBar(errorText: _i18n()['overlapError']);
    }
  }

  void updateToTime(
      {required int index, required int hour, required int minute}) {
    _workingDay.value?.openHours[index].to = [hour, minute];
    _workingDay.refresh();
  }

  void updateFromTime(
      {required int index, required int hour, required int minute}) {
    _workingDay.value?.openHours[index].from = [hour, minute];
    _workingDay.refresh();
  }

  void switchAvailable({required bool value}) {
    _workingDay.value?.isOpen = value;
    _workingDay.refresh();
  }
}
