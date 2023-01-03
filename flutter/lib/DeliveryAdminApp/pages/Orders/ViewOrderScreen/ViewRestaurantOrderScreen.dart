import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/DeliveryAdminApp/models/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/orderController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewOrderScreen"]["ViewRestaurantOrderScreen"];

class ViewRestaurantOrderScreen extends StatefulWidget {
  @override
  _ViewRestaurantOrderScreenState createState() =>
      _ViewRestaurantOrderScreenState();
}

class _ViewRestaurantOrderScreenState extends State<ViewRestaurantOrderScreen> {
  final MGoogleMapController mapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );

  /// order
  Rxn<DeliveryOrder> order = Rxn<DeliveryOrder>();

  /// controller
  OrderController controller = Get.find<OrderController>();

  /// restaurantController
  // RestaurantController restaurantController = Get.find<RestaurantController>();
  StreamSubscription<Order?>? _orderListener;
  bool _clickedButton = false;

  RestaurantOrderStatus? _statusSnapshot;

  Future<void> onTapButtonsShowLoading(Function function) async {
    if (!_clickedButton) {
      // set true to show loading button
      setState(() {
        _clickedButton = true;
      });

      await function();

      // after function done set to back to false
      setState(() {
        _clickedButton = false;
      });
    }
  }

  Widget getWidgetOrShowLoading(Widget desiredWidget) {
    if (!_clickedButton) {
      return desiredWidget;
    } else {
      return Container(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 1.5,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    mezDbgPrint("[=] ViewRestaurantOrderScreeen params :: ${Get.parameters}");
    final int orderId = int.parse(Get.parameters['orderId']!);
    mezDbgPrint("+orderId ==> $orderId");
    if (Get.parameters['orderId'] == null) MezRouter.back();
    order.value = controller.getOrder(orderId);

    if (order.value != null) {
      initMap();
    }

    super.initState();
  }

  Future<void> waitForOrderIfNotLoaded() {
    if (order.value != null) {
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
  void didUpdateWidget(ViewRestaurantOrderScreen oldWidget) {
    final int orderId = int.parse(Get.parameters['orderId']!);
    super.didUpdateWidget(oldWidget);
    mezDbgPrint("this widget is updated");
    if (order.value == null) {
      order.value = controller.getOrder(orderId);
    }
  }

  @override
  void dispose() {
    _orderListener?.cancel();
    _orderListener = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
        title: 'Order info',
      ),
      bottomNavigationBar: Obx(() {
        if (showReviewBtn()) {
          return MezButton(
            label: "${_i18n()["writeReview"]}",
            withGradient: true,
            onClick: () async {
              await showReviewDialog(
                context,
                orderId: order.value!.id,
                orderType: OrderType.Restaurant,
              );
            },
            borderRadius: 0,
          );
        } else {
          return SizedBox();
        }
      }),
      body: Obx(
        () {
          if (order.value != null) {
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraint) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(8),
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            // OrderStatusCard(
                            //   order: order.value!,
                            //   ordersStates: order.value!.status,
                            // ),

                            // if (order.value!.isInProcess)
                            //   CustomerRestaurantOrderEst(order: order.value!),

                            // [AAA]  Delivery
                            if (order.value?.deliveryDriverId != null)
                              _driverCardInfos(order.value!)
                            else
                              _noDriverYet(order.value!),

                            _serviceProviderInfoCard(order.value!),
                            _customerInfoCard(order.value!),
                            // OrderItemsCard(
                            //   order: order.value!,
                            // ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Text(
                                '${_i18n()["deliveryDet"]}',
                                style: Get.textTheme.bodyText1,
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
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  List<Widget> get _mapWidget => <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
          height: 350,
          width: Get.width - 20,
          child: MGoogleMap(
            padding: EdgeInsets.zero,
            mGoogleMapController: mapController,
            recenterBtnBottomPadding: 20,
          ),
        ),
      ];

  void initMap() {
    mapController.periodicRerendering.value = true;
    mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded; // LEZEM
    mapController.animateMarkersPolyLinesBounds.value = true;

    if (order.value!.routeInformation != null)
      mapController.decodeAndAddPolyline(
          encodedPolylineString: order.value!.routeInformation!.polyline);

    mapController.animateAndUpdateBounds(
        shouldFitPolylineInBound: order.value!.routeInformation != null);
  }

  void updateMapIfDeliveryPhase(RestaurantOrderStatus status) {
    switch (status) {
      case RestaurantOrderStatus.Ready:
        mapController.animateAndUpdateBounds();
        break;

      case RestaurantOrderStatus.OnTheWay:
        break;
      default:
    }
  }

  bool showReviewBtn() {
    return order.value != null &&
        order.value!.status == RestaurantOrderStatus.Delivered;
    // &&
    // order.value!.review == null;
  }

  Widget _driverCardInfos(DeliveryOrder order) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                    order.moreInfo.deliveryDriverImage!,
                  ),
                  radius: 25,
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.moreInfo.deliveryDriverName ?? 'Driver',
                        style: Get.textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _noDriverYet(DeliveryOrder order) {
    return order.isInProcess
        ? Card(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 25,
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
                    child: Text(
                      'No driver assigned yet.',
                      style: Get.textTheme.bodyText1,
                    ),
                  ),
                  InkWell(
                    onTap: () async {},
                    child: Ink(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (order.estimatedPkgReadyTime != null)
                              ? Colors.grey.shade300
                              : Colors.transparent),
                      child: (order.estimatedPkgReadyTime != null)
                          ? Icon(
                              Icons.edit_outlined,
                              size: 18,
                            )
                          : Text(
                              'Assign',
                              style: Get.textTheme.bodyText1
                                  ?.copyWith(color: primaryBlueColor),
                            ),
                    ),
                  )
                ],
              ),
            ),
          )
        : SizedBox();
  }

  Widget _serviceProviderInfoCard(DeliveryOrder order) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: order.moreInfo.serviceProviderImage != null
                      ? CachedNetworkImageProvider(
                          order.moreInfo.serviceProviderImage!)
                      : null,
                  radius: 25,
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.moreInfo.serviceProviderName ??
                              "ServiceProvider's name",

                          // order.restaurant.name,
                          style: Get.textTheme.bodyText1,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.place,
                              size: 18,
                              color: primaryBlueColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              flex: 8,
                              fit: FlexFit.tight,
                              child: Text(
                                order.moreInfo.serviceProviderAddress ??
                                    "ServiceProvider's address",
                                style: Get.textTheme.bodyText2,
                                overflow: TextOverflow.visible,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                MessageButton(onTap: () {}),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _customerInfoCard(DeliveryOrder order) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 3),
          child: Text(
            "Customer Info",
            style: Get.textTheme.bodyText1,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: order.moreInfo.customerImage != null
                      ? CachedNetworkImageProvider(
                          order.moreInfo.customerImage!,
                        )
                      : null,
                  radius: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.moreInfo.customerName ?? "Customer's name",
                        style: Get.textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                MessageButton(onTap: () {}),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
