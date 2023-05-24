import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

class MezWorkingHoursController {
  final Rxn<Schedule> _workingHours = Rxn<Schedule>();
  Schedule get workingHours => _workingHours.value!;

  void initialize({required Schedule schedule}) {
    // Initialize the working hours with default values or fetch from an API
    _workingHours.value = schedule;
  }

  void updateWorkingHours(
      {required Weekday day, required List<OpenHours> openHours}) {
    _workingHours.value!.openHours[day] = openHours;
    _workingHours.refresh();
  }
}
