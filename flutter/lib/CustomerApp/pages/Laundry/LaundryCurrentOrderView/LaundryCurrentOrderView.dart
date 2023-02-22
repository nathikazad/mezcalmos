import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/CustomerLaundryEstTimes.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryOrderDriverCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryOrderFooterCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryOrderStatusCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/OrderLaundryCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/controllers/CustLaundryOrderViewController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/LaundryOrderPricingCompenent.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderDeliveryLocation.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderNoteCard.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderSummaryCard.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Laundry']['LaundryCurrentOrderView']['LaundryCurrentOrderView'];

class CustLaundryOrderView extends StatefulWidget {
  const CustLaundryOrderView({Key? key}) : super(key: key);

  @override
  State<CustLaundryOrderView> createState() => _CustLaundryOrderViewState();
}

class _CustLaundryOrderViewState extends State<CustLaundryOrderView> {
  CustLaundryOrderViewController viewController =
      CustLaundryOrderViewController();
  late int orderId;
  LaundryOrderPhase? _phaseSnapshot;

  // Rxn<LaundryOrder> order = Rxn<LaundryOrder>();
  StreamSubscription<Order?>? _orderListener;
  //final OrderController controller = Get.find<OrderController>();
  final MGoogleMapController mapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );
  @override
  void initState() {
    // Handle Order id from the rooting
    if (Get.parameters['orderId'] != null) {
      orderId = int.parse(Get.parameters['orderId']!);
      viewController.init(orderId: orderId);
    } else {
      mezDbgPrint("Order id null from the parameters ######");
      MezRouter.back<void>();
    }
    // controller.clearOrderNotifications(int.tryParse(orderId));
    // viewController.order.value = controller.getOrder(int.parse(orderId)) as LaundryOrder?;

    // _orderListener = controller
    //     .getOrderStream(int.parse(orderId))
    //     .listen((Order? newOrderEvent) {
    //   if (newOrderEvent != null) {
    //     viewController.order.value = newOrderEvent as LaundryOrder?;

    //     if (viewController.order.value!.inProcess()) {
    //       // @here
    //       updateMapByPhase(viewController.order.value!.getCurrentPhase());
    //     }
    //   }
    // });

    waitForOrderIfNotLoaded().then((void value) {
      if (viewController.order.value == null) {
        // ignore: inference_failure_on_function_invocation
        Future<Null>.delayed(Duration.zero, () {
          MezRouter.back<Null>();
          MezSnackbar("Error", "Order does not exist");
        });
      } else {
        initMap();
        updateMapByPhase(viewController.order.value!.getCurrentPhase());
      }
    });
    super.initState();
  }

  Future<void> waitForOrderIfNotLoaded() {
    if (viewController.order.value != null) {
      return Future<void>.value(null);
    } else {
      final Completer<void> completer = Completer<void>();
      Timer(Duration(seconds: 5), () {
        completer.complete();
      });
      return completer.future;
    }
  }

  @override
  void dispose() {
    _orderListener?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Obx(
        () {
          if (viewController.order.value != null) {
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraint) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Obx(
                              () => LaundryOrderStatusCard(
                                order: viewController.order.value!,
                              ),
                            ),
                            CustomerLaundryOrderEst(
                              order: viewController.order.value!,
                            ),
                            LaundryOrderDriverCard(
                                order: viewController.order.value!),
                            // @ here
                            if (viewController.order.value!.inDeliveryPhase())
                              Column(
                                children: [
                                  const SizedBox(height: 15),
                                  Column(
                                    children: _mapWidget,
                                  ),
                                ],
                              ),

                            if (viewController.order.value!.laundry != null)
                              OrderLaundryCard(
                                  order: viewController.order.value!),

                            LaundryOrderPricingComponent(
                                order: viewController.order.value!),
                            OrderNoteCard(
                                margin: const EdgeInsets.only(top: 25),
                                note: viewController.order.value!.notes),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(top: 25),
                              child: Text(
                                "Delivery details ",
                                style: Get.textTheme.bodyLarge,
                              ),
                            ),
                            OrderDeliveryLocation(
                              address: viewController.order.value!.to.address,
                              margin: const EdgeInsets.only(top: 10),
                            ),

                            OrderSummaryCard(
                              margin: const EdgeInsets.only(top: 25),
                              order: viewController.order.value!,
                            ),

                            //Spacer(),
                            SizedBox(
                              height: 10,
                            ),
                            Flexible(
                              child: LaundryOrderFooterCard(
                                viewController: viewController,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  AppBar _appBar() {
    return mezcalmosAppBar(
      AppBarLeftButtonType.Back,
      autoBack: true,
      titleWidget: Obx(
        () => Text(
          '${viewController.order.value?.laundry?.name ?? ""}',
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
            fontSize: 15.sp,
            color: Colors.black,
          ),
        ),
      ),
      showNotifications: true,
      ordersRoute: kOrdersRoute,
    );
  }

  List<Widget> get _mapWidget => <Widget>[
        Container(
          height: 350,
          child: MGoogleMap(
            padding: EdgeInsets.zero,
            mGoogleMapController: mapController,
            recenterBtnBottomPadding: 20,
            // rerenderDuration: Duration(seconds: 10),
          ),
        ),
      ];

  void initMap() {
    mapController.periodicRerendering.value = true;
    mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded; // LEZEM
    mapController.animateMarkersPolyLinesBounds.value = true;

    mapController.setLocation(
      LocModel.MezLocation(
        "",
        LocModel.MezLocation.buildLocationData(
          viewController.order.value!.to.latitude,
          viewController.order.value!.to.longitude,
        ),
      ),
    );

    // restaurant ad customer's location are fixed (fit in bound at start)
    mapController.addOrUpdateUserMarker(
      latLng: viewController.order.value?.laundry?.location.toLatLng(),
      markerId: viewController.order.value?.laundry?.firebaseId,
      customImgHttpUrl: viewController.order.value?.laundry?.image,
      fitWithinBounds: true,
    );

    // customer's
    mapController.addOrUpdatePurpleDestinationMarker(
      latLng: viewController.order.value?.to.toLatLng(),
      fitWithinBounds: true,
    );

    if (viewController.order.value!.routeInformation != null)
      mapController.decodeAndAddPolyline(
          encodedPolylineString:
              viewController.order.value!.routeInformation!.polyline);

    mapController.animateAndUpdateBounds(
      shouldFitPolylineInBound:
          viewController.order.value!.routeInformation != null,
    );
  }

  void updateMapByPhase(LaundryOrderPhase phase) {
    switch (phase) {
      case LaundryOrderPhase.Pickup:
        if (_phaseSnapshot != phase) {
          _phaseSnapshot = phase;
          // we ignore the marker within bounds
          mapController.addOrUpdateUserMarker(
            latLng: viewController.order.value?.laundry?.location.toLatLng(),
            markerId: viewController.order.value?.laundry?.firebaseId,
            customImgHttpUrl: viewController.order.value?.laundry?.image,
            fitWithinBounds: true,
          );
          mapController.addOrUpdatePurpleDestinationMarker(
            latLng: viewController.order.value?.to.toLatLng(),
            fitWithinBounds: true,
          );
        }
        // only if pickUpDriver not null
        if (viewController.order.value?.pickupDriver != null &&
            viewController.order.value!.inDeliveryPhase()) {
          mapController.addOrUpdateUserMarker(
            latLng: viewController.order.value?.pickupDriver?.location,
            markerId:
                "pickup_driver", //viewController.order.value!.pickupDriver!.id,
            customImgHttpUrl: viewController.order.value?.pickupDriver?.image,
            fitWithinBounds: true,
          );
        }

        break;

      case LaundryOrderPhase.Dropoff:
        if (_phaseSnapshot != phase) {
          _phaseSnapshot = phase;
          // needed when the view is not disposed, we have to remove it..
          mapController.removeMarkerById("pickup_driver");
          // mezDbgPrint("Phaaaaazeeee::_phaseSnapshot ==> $_phaseSnapshot");
          // we ignore the restaurant's marker within bounds
          mapController.addOrUpdateUserMarker(
            latLng: viewController.order.value?.laundry?.location.toLatLng(),
            markerId: viewController.order.value?.laundry?.firebaseId,
            customImgHttpUrl: viewController.order.value?.laundry?.image,
            fitWithinBounds: true,
          );
          // we fit the destination into bounds
          mapController.addOrUpdatePurpleDestinationMarker(
            latLng: viewController.order.value?.to.toLatLng(),
            fitWithinBounds: true,
          );
        }

        // we keep updating the delivery's
        if (viewController.order.value?.dropoffDriver != null) {
          // mezDbgPrint(
          //     "Phaaaaazeeee::dropoffDriver ==> ${viewController.order.value!.dropoffDriver?.location}");

          mapController.addOrUpdateUserMarker(
            latLng: viewController.order.value?.dropoffDriver?.location,
            markerId:
                "dropoff_driver", //viewController.order.value!.dropoffDriver!.id,
            customImgHttpUrl: viewController.order.value?.dropoffDriver?.image,
            fitWithinBounds: true,
          );
        }
        mapController.animateAndUpdateBounds();
        break;
      default:
    }
    mapController.animateAndUpdateBounds();
  }

  Container _orderEstimatedDeliveryTime() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${_i18n()['estimatedDeliveryTime']}",
            style: Get.textTheme.bodyLarge,
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Icon(
                    Icons.timelapse,
                    color: primaryBlueColor,
                    size: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${DateFormat("dd MMMM yyyy hh:mm a").format(viewController.order.value!.estimatedLaundryReadyTime!.toLocal())}",
                    style: Get.textTheme.bodyLarge,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
