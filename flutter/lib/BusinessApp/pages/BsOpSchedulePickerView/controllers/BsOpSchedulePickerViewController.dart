import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

class BsOpSchedulePickerViewController {
  // instances //
  final Rxn<Schedule> newSchedule = Rxn();
  final Rxn<Schedule> schedulePreview = Rxn();
  final Rxn<Schedule> oldSchedule = Rxn();
  // getters //

  void init({Schedule? schedule}) {
    if (schedule != null) {
      oldSchedule.value = schedule.clone();
      newSchedule.value = schedule.clone();
      schedulePreview.value = schedule.clone();
    } else {
      oldSchedule.value = scheduleFromData(defaultSchedule);
      newSchedule.value = scheduleFromData(defaultSchedule);
      schedulePreview.value = scheduleFromData(defaultSchedule);
    }
  }

  void dispose() {}

  void saveAndBack() {
    MezRouter.back(backResult: newSchedule.value);
  }
}
