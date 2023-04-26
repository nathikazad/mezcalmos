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
  late Rx<MezService> currentSelectedService;
  Rx<ServiceTree?> serviceTreeData = Rx<ServiceTree?>(null);

  late RxMap<MezService, Map<String, String>> _deliveryServiceListData;
  RxMap<MezService, Map<String, String>> get deliveryServiceListData =>
      _deliveryServiceListData;

  void init() {
    _fetchServiceTree();
    _deliveryServiceListData = RxMap<MezService, Map<String, String>>({
      MezService.Deliveries: {
        "icon": aDelivery,
        "title": "deliveries",
      },
      MezService.Rentals: {
        "icon": aRentals,
        "title": "rentals",
      },
      MezService.Classes: {
        "icon": aYoga,
        "title": "classes",
      },
      MezService.Therapy: {
        "icon": aChakras,
        "title": "therapy",
      },
      MezService.Events: {
        "icon": aDiscoBall,
        "title": "events",
      },
      MezService.Volunteer: {
        "icon": aVolunteering,
        "title": "volunteer",
      },
      MezService.Adventure: {
        "icon": aAdventure,
        "title": "adventures",
      },
      MezService.Services: {
        "icon": aServices,
        "title": "services",
      },
      MezService.LocallyMade: {
        "icon": aLocallyMade,
        "title": "locallyMade",
      },
      MezService.Food: {
        "icon": aFood,
        "title": "food",
      },
    });
  }

  void _fetchServiceTree() async {
    var data = await get_service_tree(
      distance: 1000000000,
      lat: 15.8.toDouble(),
      lng: -97.toDouble(),
      withCache: true,
    );
    serviceTreeData.value = data;
    mezDbgPrint("service_tree: $data");
  }

  void setCurrentSelectedService(MezService serviceValue) {
    currentSelectedService = serviceValue.obs;
  }

  void dispose() {}
}

// Data from `get_service_tree`
// var data = ServiceTree(
//   name: MezService.Root,
//   count: 0,
//   children: [
//     ServiceTree(
//       name: MezService.Deliveries,
//       count: 2,
//       children: [
//         ServiceTree(
//           name: MezService.Courier,
//           count: 1,
//           children: [],
//         ),
//         ServiceTree(
//           name: MezService.Laundry,
//           count: 1,
//           children: [],
//         )
//       ],
//     ),
//     ServiceTree(
//       name: MezService.Food,
//       count: 4,
//       children: [
//         ServiceTree(
//           name: MezService.Restaurants,
//           count: 4,
//           children: [],
//         ),
//       ],
//     ),
//     ServiceTree(
//       name: MezService.Classes,
//       count: 15,
//       children: [],
//     ),
//     ServiceTree(
//       name: MezService.Therapy,
//       count: 22,
//       children: [],
//     ),
//     ServiceTree(
//       name: MezService.Events,
//       count: 12,
//       children: [],
//     )
//   ],
// );
