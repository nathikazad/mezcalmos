import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

class ROpScheduleController {
  ROpEditInfoController editInfoController;
  ROpScheduleController({
    required this.editInfoController,
  });
  final Rxn<Schedule> newSchedule = Rxn();
  final Rxn<Schedule> schedulePreview = Rxn();
  final Rxn<Schedule> oldSchedule = Rxn();
  Rxn<Restaurant> get restaurant => editInfoController.restaurant;
  Future<void> init() async {
    await fetchSchedule();
  }

  Future<void> fetchSchedule() async {
    await editInfoController.fetchRestaurant();
    if (restaurant.value != null) {
      mezDbgPrint(
          "Restaurant schedule ===================> ${restaurant.value!.schedule!.toFirebaseFormattedJson()}");
      oldSchedule.value = Schedule.clone(restaurant.value!.schedule!);
      newSchedule.value = Schedule.clone(restaurant.value!.schedule!);
      schedulePreview.value = Schedule.clone(newSchedule.value!);
    }
  }

  Future<bool> updateSchedule() async {
    await update_restaurant_info(
        id: editInfoController.restaurantId,
        restaurant: restaurant.value!.copyWith(schedule: newSchedule.value));
    await fetchSchedule();
    return true;
  }

  void dispose() {}
}
