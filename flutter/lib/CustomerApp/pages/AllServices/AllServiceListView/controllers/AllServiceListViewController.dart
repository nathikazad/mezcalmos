import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

enum AllServiceViewEnum {
  Delivery,
  Rental,
  Class,
  Wellness,
  Event,
  Volunteer,
  Adventure,
}

class AllServiceListViewController {
  late Rx<AllServiceViewEnum> currentSelectedService;

  late RxList<Map<String, String>> _deliveryServiceListData;
  RxList<Map<String, String>> get deliveryServiceListData =>
      _deliveryServiceListData;

  void init() {
    _deliveryServiceListData = RxList<Map<String, String>>([
      {
        "icon": aDelivery,
        "title": "deliveries",
      },
      {
        "icon": aRentals,
        "title": "rentals",
      },
      {
        "icon": aChakras,
        "title": "classes",
      },
      {
        "icon": aYoga,
        "title": "wellness",
      },
      {
        "icon": aDiscoBall,
        "title": "events",
      },
      {
        "icon": aVolunteering,
        "title": "volunteer",
      },
      {
        "icon": aAdventure,
        "title": "adventures",
      },
    ]);
  }

  void setCurrentSelectedService(AllServiceViewEnum serviceValue) {
    currentSelectedService = serviceValue.obs;
  }

  void dispose() {}
}
