import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

extension RestaurantOrderHelper on RestaurantOrder {
  dynamic _i18n() =>
      Get.find<LanguageController>().strings["CustomerApp"]["pages"]
          ["Restaurants"]["ViewOrderScreen"]["components"]["OrdersItemsCard"];
  String getOrderStatus() {
    switch (status) {
      case RestaurantOrderStatus.CancelledByAdmin:
        return '${_i18n()["canceledByAdmin"]}';
      case RestaurantOrderStatus.CancelledByCustomer:
        return '${_i18n()["canceledByCustomer"]}';
      case RestaurantOrderStatus.OrderReceieved:
        return '${_i18n()["received"]}';
      case RestaurantOrderStatus.PreparingOrder:
        return '${_i18n()["preparing"]}';
      case RestaurantOrderStatus.OnTheWay:
        return '${_i18n()["onTheWay"]}';
      case RestaurantOrderStatus.ReadyForPickup:
        return '${_i18n()["readyForPickUp"]}';
      case RestaurantOrderStatus.Delivered:
        return '${_i18n()["delivered"]}';

      default:
        return 'Unknown status';
    }
  }
}
