import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/deliveryAdminAuth.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/graphql/delivery_driver/hsDeliveryDriver.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';

class DeliveryDriversList extends StatefulWidget {
  const DeliveryDriversList({super.key});

  @override
  State<DeliveryDriversList> createState() => _DeliveryDriversListState();
}

class _DeliveryDriversListState extends State<DeliveryDriversList> {
  final DeliveryOperatorAuthController _operatorAuthController =
      Get.find<DeliveryOperatorAuthController>();
  final MGoogleMapController mapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );
  RxList<DeliveryDriver> _drivers = <DeliveryDriver>[].obs;
  DeliveryOrder? order;
  @override
  void initState() {
    mezDbgPrint("[PARAMS] ===> ${Get.parameters}");
    if (Get.parameters['orderId'] != null) {
      final int? orderId = int.tryParse(Get.parameters['orderId']!);
      if (orderId != null) {
        order = Get.find<OrderController>().getOrder(orderId);
        if (order != null) {
          get_drivers_by_service_provider_id(
                  serviceProviderId:
                      _operatorAuthController.deliveryOperator!.companyId)
              .then((List<DeliveryDriver>? value) {
            mezDbgPrint("[AAA] GOT drivers list === len ===> ${value?.length}");
            if (value != null) _drivers.assignAll(value);
            initMap();
          });
        }
      }
    } else {
      MezRouter.back();
    }

    super.initState();
  }

  void initMap() {
    mapController.periodicRerendering.value = true;
    mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded; // LEZEM
    mapController.animateMarkersPolyLinesBounds.value = true;
    mapController.recenterButtonEnabled.value = true;
    mapController.myLocationButtonEnabled.value = false;
    mapController.setLocation(
      Location(
        order!.pickupLocation.address,
        order!.pickupLocation.position,
      ),
    );
    _drivers.forEach((DeliveryDriver d) {
      mezDbgPrint(
        "[AAA] Driver ===> ${d.driverInfo.name} | loc => ${d.driverLocation}",
      );
      mapController.addOrUpdateUserMarker(
        latLng: d.driverLocation,
        markerId: "driver-${d.deliveryDriverId.toString()}",
        customImgHttpUrl: d.driverInfo.image,
        fitWithinBounds: true,
      );
    });

    mezDbgPrint(
      "[AAA] addOrUpdatePurpleDestinationMarker | loc => ${order?.dropoffLocation.position.latitude}",
    );
    mezDbgPrint(
      "[AAA] addOrUpdateUserMarker::restaurant | loc => ${order?.pickupLocation.position}",
    );
    mezDbgPrint(
      "[AAA] decodeAndAddPolyline:: | loc => ${order!.routeInformation?.polyline}",
    );

    if (order != null) {
      mapController.addOrUpdatePurpleDestinationMarker(
        latLng: LatLng(
          order!.dropoffLocation.position.latitude!,
          order!.dropoffLocation.position.longitude!,
        ),
      );

      mapController.addOrUpdateUserMarker(
        // customImgHttpUrl: order?.moreInfo.serviceProviderImage,
        // markerId: order?.serviceProviderId?.toString(),
        latLng: LatLng(
          order!.pickupLocation.position.latitude!,
          order!.pickupLocation.position.longitude!,
        ),
      );
      if (order?.routeInformation?.polyline != null)
        mapController.decodeAndAddPolyline(
          encodedPolylineString: order!.routeInformation!.polyline,
        );
    }

    mapController.animateAndUpdateBounds(
      shouldFitPolylineInBound: order!.routeInformation != null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
        title: 'Assign driver',
        showNotifications: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.shade300,
            height: 350,
            child: MGoogleMap(
              padding: EdgeInsets.zero,
              mGoogleMapController: mapController,
              recenterBtnBottomPadding: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(
            () => SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _drivers.map<Widget>((DeliveryDriver d) {
                  return _noDriverYet(d);
                  // Container(
                  //   padding: EdgeInsets.all(5),
                  //   child: Center(child: Text(d.driverInfo.name)),
                  // );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _noDriverYet(DeliveryDriver driver) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: Image.network(driver.driverInfo.image).image,
                  backgroundColor: Color.fromARGB(255, 203, 203, 203),
                ),
                Positioned(
                  right: -30,
                  bottom: 3,
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: primaryBlueColor, shape: BoxShape.circle),
                    child: Icon(
                      Icons.delivery_dining,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 40,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    driver.driverInfo.name,
                    style: Get.textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryBlueColor,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Available',
                        style: Get.textTheme.bodySmall?.copyWith(fontSize: 14),
                      ),
                    ],
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () async {},
              child: Ink(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: (order.estimatedPkgReadyTime != null)
                  //     ? Colors.grey.shade300
                  //     : Colors.transparent
                ),
                child: InkWell(
                  onTap: () => MezRouter.back<DeliveryDriver>(result: driver),
                  child: Text(
                    'Assign',
                    style: Get.textTheme.bodyText1
                        ?.copyWith(color: primaryBlueColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
