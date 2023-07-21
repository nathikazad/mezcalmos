import 'dart:async';

import 'package:get/get.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/graphql/common/hsCommon.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';

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
    fetchServiceTree();
    _deliveryServiceListData = RxMap<MezService, Map<String, String>>({
      MezService.Deliveries: {
        "icon": aDelivery,
        "title": "deliveries",
      },
      MezService.Courier: {
        "icon": aDelivery,
        "title": "courier",
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
      MezService.RealEstate: {
        "icon": aProperty,
        "title": "realEstate",
      },
    });
  }

  Future<void> fetchServiceTree() async {
    logEventToServer("Fetching Service tree");

    if (await locPkg.Location().hasPermission() !=
        LocationPermissionsStatus.Ok) {
      unawaited(MezRouter.toNamed(SharedRoutes.kLocationPermissionPage));
      // return;
    }

    // temporary hack, need to check location permission and redirect user to
    final locPkg.LocationData? location = await locPkg.Location()
        .getLocation()
        .timeout(Duration(seconds: 3),
            onTimeout: () => locPkg.LocationData.fromMap({}));
    logEventToServer("Fetching Service tree got location");
    final ServiceTree data = await get_service_tree(
      distance: defaultDistance,
      lat: location?.latitude ?? 15.8720.toDouble(),
      lng: location?.longitude ?? 97.0767.toDouble(),
      withCache: true,
    );

    serviceTreeData.value = data;
    mezDbgPrint("service_tree: $data");
    logEventToServer("Fetching Service tree finished",
        debugData: {"serviceTree": data.toString()});
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
