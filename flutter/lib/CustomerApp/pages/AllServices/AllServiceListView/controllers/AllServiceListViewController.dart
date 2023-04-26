import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/graphql/common/hsCommon.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

enum AllServiceViewEnum {
  Delivery,
  Rental,
  Class,
  Therapy,
  Event,
  Volunteer,
  Adventure,
  Service,
  LocallyMade,
  Food,
}

class AllServiceListViewController {
  late Rx<AllServiceViewEnum> currentSelectedService;

  late RxList<Map<String, String>> _deliveryServiceListData;
  RxList<Map<String, String>> get deliveryServiceListData =>
      _deliveryServiceListData;

  void init() {
    _fetchServiceTree();
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
        "icon": aYoga,
        "title": "classes",
      },
      {
        "icon": aChakras,
        "title": "therapy",
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
      {
        "icon": aServices,
        "title": "services",
      },
      {
        "icon": aLocallyMade,
        "title": "locallyMade",
      },
      {
        "icon": aFood,
        "title": "food",
      },
    ]);
  }

  void _fetchServiceTree() async {
    var data = await get_service_tree(
      distance: 1000000000,
      lat: 15.8.toDouble(),
      lng: -97.toDouble(),
      withCache: true,
    );
    mezDbgPrint("service_tree: $data");
  }

  void setCurrentSelectedService(AllServiceViewEnum serviceValue) {
    currentSelectedService = serviceValue.obs;
  }

  void dispose() {}
}
