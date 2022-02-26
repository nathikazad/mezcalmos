import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/Hints/RidePriceControllHint.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/Hints/RideReadByTaxisHint.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/TaxiBottomBars/TaxiOrderBottomBar.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/TopBar.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezToolTip.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:sizer/sizer.dart';

class ViewTaxiOrderScreen extends StatefulWidget {
  final MGoogleMapController mGoogleMapController = MGoogleMapController();

  @override
  _ViewTaxiOrderScreenState createState() => _ViewTaxiOrderScreenState();
}

class _ViewTaxiOrderScreenState extends State<ViewTaxiOrderScreen>
    with SingleTickerProviderStateMixin {
  OrderController controller = Get.find<OrderController>();
  TaxiController taxiController = Get.put<TaxiController>(TaxiController());
  Rxn<TaxiOrder> order = Rxn();
  StreamSubscription? _orderListener;
  final String toMarkerId = "to";
  LanguageController _lang = Get.find<LanguageController>();
  RxDouble bottomPadding =
      ((GetStorage().read(getxGmapBottomPaddingKey) as double) + 15.0).obs;

/******************************  Init and build function ************************************/
  @override
  void initState() {
    String orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId) as TaxiOrder?;
    if (order.value != null) {
      // set initial location
      widget.mGoogleMapController.setLocation(order.value!.from);
      // add the polylines!
      widget.mGoogleMapController.decodeAndAddPolyline(
          encodedPolylineString: order.value!.routeInformation.polyline);
      widget.mGoogleMapController.setAnimateMarkersPolyLinesBounds(true);
      widget.mGoogleMapController.animateAndUpdateBounds();

      if (order.value!.inProcess()) {
        inProcessOrderStatusHandler(order.value!.status);
        _orderListener = controller
            .getCurrentOrderStream(orderId)
            .listen((currentOrder) async {
          if (currentOrder != null) {
            order.value = currentOrder as TaxiOrder;
            inProcessOrderStatusHandler(order.value!.status);
            setState(() {});
          } else {
            _orderListener?.cancel();
            _orderListener = null;
            TaxiOrder? _order = controller.getOrder(orderId) as TaxiOrder?;
            // this else clause gets executed when the order becomes /pastOrders.
            if (_order == null) {
              if (order.value!.status == TaxiOrdersStatus.CancelledByCustomer) {
                Get.back();
                oneButtonDialog(
                    body: _lang.strings['shared']['snackbars']
                        ['orderCancelSuccess'],
                    imagUrl: _order!.customer.image);
              }
              _order = (await controller.getPastOrderStream(orderId).first)
                  as TaxiOrder?;
            }

            order.value = _order;
            // one time execution :
            widget.mGoogleMapController.setAnimateMarkersPolyLinesBounds(true);
            pastOrderStatusHandler(order.value!.status);
            setState(() {});
          }
        });
      } else {
        // it's in past orders!
        pastOrderStatusHandler(order.value!.status);
        setState(() {});
      }
    } else {
      mezDbgPrint("Error :Unfound Order !");
    }

    super.initState();
  }

  @override
  void dispose() {
    _orderListener?.cancel();
    _orderListener = null;
    super.dispose();
  }

  bool _offersBtnClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
            onClick: () => Get.back()),
        // appBar: AppBar(),
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          child: Obx(
            () => order.value != null
                ? Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                        Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            child: MGoogleMap(
                              mGoogleMapController:
                                  this.widget.mGoogleMapController,
                              periodicRerendering: true,
                            )),
                        if (_offersBtnClicked)
                          InkWell(
                            onTap: !_clickedAccept
                                ? () {
                                    setState(() {
                                      _offersBtnClicked = false;
                                    });
                                  }
                                : null,
                            child: Container(
                              height: Get.height,
                              width: Get.width,
                            ),
                          ),
                        TopBar(order: order.value!),
                        Positioned(
                          bottom: 15,
                          left: 15,
                          right: 15,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (this.order.value!.counterOffers.isEmpty)
                                Flexible(child: offersButton()),
                              if (this.order.value!.counterOffers.isEmpty)
                                SizedBox(
                                  width: 10,
                                ),
                              Flexible(
                                  child: cancelButton(order.value!.status)),
                            ],
                          ),
                        ),
                        TaxiOrderBottomBar(order: order),
                        getToolTip(),
                        counterOffersBottomSheet(),
                      ])
                : MezLogoAnimation(
                    centered: true,
                  ),
          ),
        ));
  }

  /// this builds [MezToolTip] with the given [getHints()],
  ///
  /// if [Get.find<TaxiController>().numOfTimesToolTipShownToUser()] has already set to 5+,
  ///
  /// we won't show it, instead we simply return an empty box.
  Widget getToolTip() {
    // only if not marker as read more than 4 times or status isLookingForTaxi
    if (order.value!.status == TaxiOrdersStatus.LookingForTaxi &&
        Get.find<TaxiController>().numOfTimesToolTipShownToUser() <=
            nMaxTimesToShowTTipsOnCustomerApp)
      return MezToolTip(
        hintWidgetsList: getHints(),
      );
    else
      return SizedBox();
  }

  /// This gets invoked when the order is moved to [inProcess] db node
  void inProcessOrderStatusHandler(TaxiOrdersStatus status) {
    switch (status) {
      case TaxiOrdersStatus.OnTheWay:
        bottomPadding.value = 10.0;
        widget.mGoogleMapController.setAnimateMarkersPolyLinesBounds(true);
        widget.mGoogleMapController.animateAndUpdateBounds();

        // update the to dest marker
        // widget.mGoogleMapController.removeDestinationMarker();
        widget.mGoogleMapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value!.to.toLatLng());
        // taxi driver marker
        if (order.value!.driver?.location != null)
          widget.mGoogleMapController.addOrUpdateTaxiDriverMarker(
              order.value!.driver!.id, order.value!.driver!.location!);
        // customer marker
        widget.mGoogleMapController.addOrUpdateUserMarker(
            markerId: order.value!.customer.id,
            latLng: order.value!.from.toLatLng());
        break;

      case TaxiOrdersStatus.InTransit:
        bottomPadding.value = 10.0;
        widget.mGoogleMapController.setAnimateMarkersPolyLinesBounds(true);

        // from [driver] to [destination]
        // thus we keep updating the driver marker only.
        // + Remove customer Marker
        // + Add destination Marker

        // addOrUpdateUserMarker(
        //     order.value!.driver!.id, order.value!.from.toLatLng());

        // removing customer marker
        widget.mGoogleMapController.removeMarkerById(order.value!.customer.id);
        // updating driver's marker
        widget.mGoogleMapController.addOrUpdateTaxiDriverMarker(
            order.value!.driver!.id,
            LatLng(order.value!.driver!.location!.latitude,
                order.value!.driver!.location!.longitude));
        // updating destination marker.
        widget.mGoogleMapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value!.to.toLatLng());
        break;

      default:
        // bottomPadding.value = 10.0;

        // default is : isLoookingForTaxi
        // so user can move freely
        widget.mGoogleMapController.setAnimateMarkersPolyLinesBounds(true);
        widget.mGoogleMapController.animateAndUpdateBounds();

        // updating destination marker.
        widget.mGoogleMapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value!.to.toLatLng());
        // customer marker
        widget.mGoogleMapController.addOrUpdateUserMarker(
            markerId: order.value!.customer.id,
            latLng: order.value!.from.toLatLng());
        break;
    }
  }

  /// This gets invoked when the order is moved to /past db node
  void pastOrderStatusHandler(TaxiOrdersStatus status) {
    bottomPadding.value = 10.0;

    if (order.value!.driver != null)
      widget.mGoogleMapController.removeMarkerById(order.value!.driver!.id);
    // adding customer's marker
    widget.mGoogleMapController.addOrUpdateUserMarker(
        markerId: order.value!.customer.id,
        latLng: order.value!.from.toLatLng());
    // updating destination marker.
    widget.mGoogleMapController
        .addOrUpdatePurpleDestinationMarker(latLng: order.value!.to.toLatLng());
  }

  Widget cancelButton(TaxiOrdersStatus status) {
    if (status != TaxiOrdersStatus.LookingForTaxi) {
      return SizedBox();
    } else {
      return Container(
        child: InkWell(
          onTap: () async {
            YesNoDialogButton res = await yesNoDialog(
                text: _lang.strings['customer']['cancelOrder']['title'],
                body: _lang.strings['customer']['cancelOrder']['question']);
            if (res == YesNoDialogButton.Yes) {
              await Get.find<TaxiController>().cancelTaxi(order.value!.orderId);
            }
          },
          child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.red.shade400,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  _lang.strings['customer']['taxiView']['cancel'],
                  style: TextStyle(
                      fontFamily: "psr",
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              )),
        ),
      );
    }
  }

  Widget offersButton() {
    return Container(
      child: InkWell(
        onTap: () {
          setState(() {
            _offersBtnClicked = true;
          });
        },
        child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.purple.shade400,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'offers',
                  style: TextStyle(
                      fontFamily: "psr",
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 10),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Flexible(
                      child: Text(
                    this.order.value!.counterOffers.length.toString(),
                    textAlign: TextAlign.center,
                  )),
                )
              ],
            )),
      ),
    );
  }

  /// the hints [MezToolTipHint] that are related to this view !
  List<MezToolTipHint> getHints() {
    return [
      MezToolTipHint(
        hintWidget: RidePriceControllHint(
            hintText: Get.find<LanguageController>().strings['customer']
                ['taxiView']['taxiRidePriceTooltip']),
        left: 80.1,
        bottom: 150.5,
        bodyLeft: 20,
        bodyRight: 20,
        bodyBottom: 150.5,
      ),
      MezToolTipHint(
        hintWidget: RideReadByTaxisHint(),
        left: 199,
        bottom: 150.5,
        bodyLeft: 20,
        bodyRight: 20,
        bodyBottom: 150.5,
      )
    ];
  }

  bool _clickedAccept = false;

  Widget counterOffersBottomSheet() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: _offersBtnClicked ? 40.h : 0,
        curve: Curves.easeInExpo,
        width: Get.width,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: 5)
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: !_clickedAccept
            ? SingleChildScrollView(
                padding:
                    EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
                physics: ClampingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Offers',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 14.sp),
                          ),
                          Text(
                            this.order.value!.counterOffers.length.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 14.sp),
                          )
                        ],
                      ),
                    ),
                    ...getCounterOffersListItems(),
                    ...getCounterOffersListItems(),
                    ...getCounterOffersListItems(),
                    ...getCounterOffersListItems(),
                    ...getCounterOffersListItems(),
                  ],
                ),
              )
            : MezLogoAnimation(
                centered: true,
              ),
      ),
    );
  }

  List<Widget> getCounterOffersListItems() {
    return [
      Padding(
        padding: EdgeInsets.only(left: 50, right: 50, top: 5),
        child: Divider(),
      ),
      // list items of CounterOffer
      Container(
        // height: 100,
        width: Get.width,
        child: ListTile(
          leading: Container(
            height: 40,
            width: 40,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.black),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SAAD TAXI',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 12.sp),
                    ),
                    Text(
                      '\$40',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 11.sp),
                    ),
                  ]),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  children: [
                    Container(
                      height: 29,
                      width: 29,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 172, 89, 252),
                          shape: BoxShape.circle),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _clickedAccept = true;
                            });
                            // we accept counter offer and wait for it.

                            // if it fails , we set _clickedAccept = false
                          },
                          child: Icon(
                            Icons.check,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 29,
                      width: 29,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 252, 89, 99),
                          shape: BoxShape.circle),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            // to do cancel count offer.
                          },
                          child: Icon(
                            Icons.close,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ];
  }
}
