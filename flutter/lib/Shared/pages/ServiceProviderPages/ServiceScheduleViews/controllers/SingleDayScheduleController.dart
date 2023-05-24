import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

class SingleDayScheduleViewController {
  // final Rxn<Schedule> _workingHours = Rxn<Schedule>();
  // Schedule get workingHours => _workingHours.value!;
  final RxList<OpenHours> _workingHours = RxList<OpenHours>([]);
  late Weekday day;

  List<OpenHours> get workingHours => _workingHours;

  void initialize(
      {required Weekday day, required List<OpenHours> workingHours}) {
    this.day = day;
    _workingHours.addAll(workingHours);
  }

  void addWorkingHours({required OpenHours openHours}) {
    _workingHours.add(openHours);
  }

  void editWorkingHours({required int index, required OpenHours openHours}) {
    _workingHours[index] = openHours;
  }

  void newWorkingHours() {
    _workingHours.add(OpenHours(from: [00, 00], isOpen: true, to: [20, 00]));
  }

  void removeWorkingHours({required int index}) {
    _workingHours.removeAt(index);
  }

  void saveWorkingHours() {
    MezRouter.back(backResult: _workingHours.value);
  }

  void updateToTime(
      {required int index, required int hour, required int minute}) {
    _workingHours[index].to = [hour, minute];
  }

  void updateFromTime(
      {required int index, required int hour, required int minute}) {
    _workingHours[index].from = [hour, minute];
  }
}
