import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/components/CustomerRestaurantOrderEst.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/components/OrderFooterCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/components/OrderRestaurantCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/components/OrderStatusCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/components/OrdersItemsCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/components/RestaurantBankInfo.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/components/RestaurantOrderDriverCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/components/notesWidget.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/controllers/CustRestaurantOrderViewController.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/order/hsRestaurantOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;

import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderDeliveryLocation.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderPaymentMethod.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderScheduledTime.dart';
import 'package:mezcalmos/Shared/widgets/Order/ReviewCard.dart';
import 'package:mezcalmos/Shared/widgets/RestaurantOrderDeliveryTimeCard.dart';
import 'package:mezcalmos/WebApp/routes/MessagesScreen.dart';
import 'package:mezcalmos/WebApp/values/constants.dart';
import 'package:mezcalmos/WebApp/widgets/MezSnackbar.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';
import 'package:mezcalmos/WebApp/widgets/mezLoaderWidget.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../../../../Shared/widgets/Order/OrderSummaryCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewOrderScreen"]["ViewRestaurantOrderScreen"];

class OrderViewScreenFordesktop extends StatefulWidget {
  OrderViewScreenFordesktop({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderViewScreenFordesktop> createState() =>
      _OrderViewScreenFordesktopState();
}

class _OrderViewScreenFordesktopState extends State<OrderViewScreenFordesktop> {
  final MGoogleMapController mapController = MGoogleMapController(
      enableMezSmartPointer: true, imagePath: aLocationPicker, isWeb: true);
  CustRestaurantOrderViewController viewController =
      CustRestaurantOrderViewController();

  /// order
  Rxn<RestaurantOrder> order = Rxn<RestaurantOrder>();

  /// controller

  /// restaurantController
  StreamSubscription<Order?>? _orderListener;
  bool _clickedButton = false;

  RestaurantOrderStatus? _statusSnapshot;
  //bool isDone = false;
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
    final int orderId = int.parse(QR.params['orderId'].toString());
    if (QR.params['orderId'] == null) QR.back();
    viewController.init(orderId: orderId);
    super.initState();
    // _itializeController();

    // mezDbgPrint("[=] ViewRestaurantOrderScreeen params :: ${Get.parameters}");
    // final int orderId = int.parse(QR.params['orderId'].toString());
    // mezDbgPrint("+orderId ==> $orderId");
    // if (QR.params['orderId'] == null) QR.back();
    // // orderId = Get.parameters['orderId']!;
    // controller.clearOrderNotifications(orderId);
    // order.value = controller.getOrder(orderId) as RestaurantOrder?;
    // mezDbgPrint("Got Order ===> ${order.value?.orderId}");
    // // order.value = listen_on_restaurant_order(order_id: order_id, cus_id: cus_id).first;
    // if (order.value != null) {
    //   initMap();
    //   updateMapIfDeliveryPhase(order.value!.status);
    // }

    // mezDbgPrint("Listening on + OrderId ($orderId)");
    // _orderListener = listen_on_restaurant_order_by_id(orderId: orderId)
    //     .listen((RestaurantOrder? _order) {
    //   mezDbgPrint(
    //       "[+] listen_on_restaurant_order Trigger ===> ${_order?.orderId}");

    //   if (_order != null) {
    //     order.value = _order;
    //     if (order.value!.inProcess()) {
    //       updateMapIfDeliveryPhase(order.value!.status);
    //     }
    //   }
    // });

    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    _orderListener?.cancel();
    _orderListener = null;
    super.dispose();
  }

  _itializeController() async {
    await Get.put<ForegroundNotificationsController>(
        ForegroundNotificationsController(),
        permanent: true);
  }

  // void initMap() {
  //   // if (true) {
  //   //  isDone = true;
  //   mezDbgPrint("opopop =--|>  1");
  //   mapController.periodicRerendering.value = true;
  //   mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded; // LEZEM
  //   mapController.animateMarkersPolyLinesBounds.value = true;

  //   mapController.setLocation(
  //     LocModel.Location(
  //       "",
  //       LocModel.Location.buildLocationData(
  //         order.value?.to.latitude,
  //         order.value?.to.longitude,
  //       ),
  //     ),
  //   );

  //   // restaurant ad customer's location are fixed (fit in bound at start)
  //   mezDbgPrint(
  //       "[cc]===> order resto location ${order.value?.restaurant.location.toLatLng()}");
  //   mapController.addOrUpdateUserMarker(
  //     latLng: order.value?.restaurant.location.toLatLng(),
  //     markerId: order.value?.restaurant.hasuraId.toString(),
  //     customImgHttpUrl: order.value?.restaurant.image,
  //     fitWithinBounds: true,
  //   );
  //   // customer's
  //   mezDbgPrint(
  //       "[cc]===> order customer location ${order.value?.to.toLatLng()}");
  //   mapController.addOrUpdatePurpleDestinationMarker(
  //     latLng: order.value?.to.toLatLng(),
  //     fitWithinBounds: true,
  //   );
  //   if (order.value!.routeInformation != null) {
  //     mezDbgPrint("opopop =--|> . ${order.value!.routeInformation?.polyline}");
  //     mapController.decodeAndAddPolyline(
  //         encodedPolylineString: order.value!.routeInformation!.polyline);
  //   } else
  //     mezDbgPrint("opopop =--|>  rinfo mnull");

  //   mapController.animateAndUpdateBounds(
  //       shouldFitPolylineInBound: order.value!.routeInformation != null);
  // }
  //}

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
  void didUpdateWidget(OrderViewScreenFordesktop oldWidget) {
    // final String orderId = QR.params['orderId'].toString();
    // super.didUpdateWidget(oldWidget);
    // mezDbgPrint("this widget is updated");
    // if (order.value == null) {
    //   order.value = controller.getOrder(int.parse(orderId)) as RestaurantOrder?;
    // }
  }

  // void updateMapIfDeliveryPhase(RestaurantOrderStatus status) {
  //   switch (status) {
  //     case RestaurantOrderStatus.Ready:
  //       mezDbgPrint("opopop =--|>  2");

  //       mezDbgPrint("+ poly => ${order.value!.routeInformation?.toJson()}");
  //       mezDbgPrint("+ markers => ${mapController.markers.length}");
  //       mezDbgPrint("+ polys => ${mapController.polylines.length}");

  //       // Customer + Restau  + Polyline

  //       // PICKUP :  DELIVERY -> restau
  //       //
  //       if (_statusSnapshot != status) {
  //         _statusSnapshot = status;
  //         mapController.addOrUpdateUserMarker(
  //           latLng: order.value?.restaurant.location.toLatLng(),
  //           markerId: order.value?.restaurant.hasuraId.toString(),
  //           customImgHttpUrl: order.value?.restaurant.image,
  //           fitWithinBounds: true,
  //         );
  //         mapController.addOrUpdatePurpleDestinationMarker(
  //           latLng: order.value?.to.toLatLng(),
  //           fitWithinBounds: true,
  //         );
  //       }
  //       mapController.addOrUpdateUserMarker(
  //         latLng: order.value?.dropoffDriver?.location,
  //         markerId: order.value?.dropoffDriver?.hasuraId.toString(),
  //         customImgHttpUrl: order.value?.dropoffDriver?.image,
  //         fitWithinBounds: true,
  //       );

  //       mapController.animateAndUpdateBounds();
  //       break;

  //     case RestaurantOrderStatus.OnTheWay:
  //       mezDbgPrint("opopop =--|>  3");

  //       if (_statusSnapshot != status) {
  //         _statusSnapshot = status;
  //         // we ignore the restaurant's marker within bounds
  //         mapController.addOrUpdateUserMarker(
  //           latLng: order.value?.restaurant.location.toLatLng(),
  //           markerId: order.value?.restaurant.hasuraId.toString(),
  //           customImgHttpUrl: order.value?.restaurant.image,
  //           fitWithinBounds: true,
  //         );
  //         // we fit the destination into bounds
  //         mapController.addOrUpdatePurpleDestinationMarker(
  //           latLng: order.value?.to.toLatLng(),
  //           fitWithinBounds: true,
  //         );
  //       }

  //       // we keep updating the delivery's
  //       mapController.addOrUpdateUserMarker(
  //         latLng: order.value?.dropoffDriver?.location,
  //         markerId: order.value?.dropoffDriver?.hasuraId.toString(),
  //         customImgHttpUrl: order.value?.dropoffDriver?.image,
  //         fitWithinBounds: true,
  //       );
  //       setState(() {
  //         mapController.animateAndUpdateBounds();
  //       });
  //       mezDbgPrint("[][][][]======== ${mapController.markers.length}");
  //       break;
  //     default:
  //       mezDbgPrint("opopop =--|>  4");
  //   }
  // }

  List<Widget> get _mapWidget {
    mezDbgPrint("the length of markers ${mapController.markers.length}");
    return <Widget>[
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
  }

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Scaffold(
      body: Obx(() {
        if (viewController.order.value != null) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      MezCalmosResizer.getWepPageHorizontalPadding(context),
                  vertical: kToolbarHeight / 2),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          OrderStatusCard(
                            order: viewController.order.value!,
                            ordersStates: viewController.order.value!.status,
                            isWebversion: true,
                          ),
                          // if (viewController.order.value!.paymentType ==
                          //     PaymentType.BankTransfer)
                          //   RestaurantBankInfoCard(
                          //       isWebVersion: true,
                          //       restaurantId:
                          //           viewController.order.value!.restaurantId),
                          if (viewController.order.value!.inProcess())
                            CustomerRestaurantOrderEst(
                                order: viewController.order.value!),

                          RestaurantOrderDriverCard(
                            order: viewController.order.value!,
                            isWebVersion: true,
                          ),

                          if (viewController.order.value!.inDeliveryPhase())
                            ..._mapWidget,
                          OrderRestaurantCard(
                              isWebVersion: true,
                              order: viewController.order.value!),

                          OrderItemsCard(
                            order: viewController.order.value!,
                            isWebVersion: true,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 25),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${_i18n()["deliveryDet"]}',
                              style: txt.bodyText1?.copyWith(fontSize: 16),
                            ),
                          ),
                          OrderDeliveryLocation(
                            order: viewController.order.value!,
                            margin: const EdgeInsets.only(top: 20),
                            isWebVersion: true,
                          ),
                          OrderPaymentMethod(
                            order: viewController.order.value!,
                            margin: const EdgeInsets.only(top: 20),
                            isWebVersion: true,
                          ),
                        ],
                      )),
                      SizedBox(
                        width: MezCalmosResizer.getWepPageHorizontalPadding(
                                context) /
                            2,
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          if (viewController.order.value!.review != null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Review : ",
                                  style: txt.bodyText1?.copyWith(fontSize: 16),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ReviewCard(
                                  review: viewController.order.value!.review!,
                                  isWebVersion: true,
                                ),
                              ],
                            ),
                          viewController.order.value?.notes == null ||
                                  viewController.order.value!.notes!.length <= 0
                              ? Container()
                              : notesWidget(viewController.order, context,
                                  isWebVersion: true),
                          OrderSummaryCard(
                            order: viewController.order.value!,
                            isWebVersion: true,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          OrderFooterCard(
                            order: viewController.order.value!,
                            isWebVersion: true,
                            cancelOrderFunction: viewController.cancelOrder,
                          )
                        ],
                      ))
                    ],
                  )
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      }),
    );
    // return Obx(
    //   () => (order.value != null)
    //       ? SingleChildScrollView(
    //           child: Padding(
    // padding: EdgeInsets.symmetric(
    //     horizontal:
    //         MezCalmosResizer.getWepPageHorizontalPadding(context),
    //     vertical: kToolbarHeight / 2),
    //           child: Column(
    //             children: [
    //               Row(
    // mainAxisAlignment: MainAxisAlignment.start,
    // crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Expanded(
    //                       child: Container(
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         _buildStatusCard(order: order),
    // SizedBox(
    //   height: 20,
    // ),
    //                         // CustomerRestaurantOrderEst(
    //                         //   order: order.value!,
    //                         //   isWebVersion: true,
    //                         // ),
    //                         RestaurantOrderDriverCard(
    //                           order: order.value!,
    //                           isWebVersion: true,
    //                         ),
    //                         _buildRestoInfoCart(),
    //                         if (order.value!.inDeliveryPhase()) ..._mapWidget,
    //                         SizedBox(
    //                           height: 10,
    //                         ),
    //                         _buildOrdersItems(),
    //                         Container(
    //                           margin: const EdgeInsets.only(top: 20),
    //                           child: Text(
    //                             '${_i18n()["deliveryDet"]}',
    //                             style: txt.bodyText1!.copyWith(fontSize: 16),
    //                           ),
    //                         ),
    //                         RestaurantOrderDeliveryTimeCard(
    //                           order: order.value!,
    //                           margin: EdgeInsets.zero,
    //                           isWebVersion: true,
    //                         ),
    //                         OrderDeliveryLocation(
    //                           order: order.value!,
    //                           margin: const EdgeInsets.only(top: 5),
    //                           isWebVersion: true,
    //                         ),
    //                         OrderPaymentMethod(
    //                           order: order.value!,
    //                           margin: const EdgeInsets.only(top: 20),
    //                           isWebVersion: true,
    //                         ),
    //                       ],
    //                     ),
    //                   )),
    // SizedBox(
    //   width: MezCalmosResizer.getWepPageHorizontalPadding(
    //           context) /
    //       2,
    // ),
    //                   Expanded(
    //                       child: Container(
    //                     child: Column(
    //                       children: [
    //                         order.value?.notes == null ||
    //                                 order.value!.notes!.length <= 0
    //                             ? Container()
    //                             : Padding(
    //                                 padding:
    //                                     const EdgeInsets.only(bottom: 15.0),
    //                                 child: notesWidget(
    //                                   order,
    //                                   context,
    //                                   isWebVersion: true,
    //                                 ),
    //                               ),
    //                         OrderSummaryCard(
    //                           margin: const EdgeInsets.all(0),
    //                           order: order.value!,
    //                           isWebVersion: true,
    //                         ),
    //                         SizedBox(
    //                           height: 50,
    //                         ),
    //                         OrderFooterCard(
    //                           order: order.value!,
    //                           isWebVersion: true,
    //                           navigationCallback: () {
    //                             QR.to("/restaurants");
    //                           },
    //                         )
    //                         // _buildCancelOrder()
    //                       ],
    //                     ),
    //                   ))
    //                 ],
    //               )
    //             ],
    //           ),
    //         ))
    //       : Center(
    //           child: MezLoaderWidget(),
    //         ),
    // );
  }

//   Widget _buildStatusCard({required Rxn<RestaurantOrder> order}) {
//     return OrderStatusCard(
//       isWebversion: true,
//       order: order.value!,
//       ordersStates: order.value!.status,
//     );
//   }

//   Widget _buildCancelOrder() {
//     return Container(
//       width: Get.width,
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(08),
//           color: Color.fromRGBO(255, 235, 236, 1)),
//       child: Center(
//           child: Text(
//         "Cancel Order",
//         style: GoogleFonts.montserrat(
//             fontSize: 16, fontWeight: FontWeight.w600, color: Colors.red),
//       )),
//     );
//   }

//   Widget _buildOrdersItems() {
//     return OrderItemsCard(
//       order: order.value!,
//       isWebVersion: true,
//     );
//   }

//   Widget _buildRestoInfoCart() {
//     return OrderRestaurantCard(
//       textStyle: GoogleFonts.montserrat(),
//       order: order.value!,
//       isWebVersion: true,
//       navigateMsgCallback: () {
//         mezDbgPrint("this where the magic happen");

//         QR.to(MessagesRoutes.getMessagesRoute(
//           chatId: order.value!.orderId.toString(),
//           orderId: order.value!.orderId.toString(),
//           recipientType: ParticipantType.Restaurant,
//         ));
//       },
//     );
//   }
}
