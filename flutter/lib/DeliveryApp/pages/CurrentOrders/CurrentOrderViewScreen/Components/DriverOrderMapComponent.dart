import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:sizer/sizer.dart';

class DriverOrderMapComponent extends StatefulWidget {
  Order order;
  final MGoogleMapController mapController;

  DriverOrderMapComponent(
      {Key? key, required this.order, required this.mapController})
      : super(key: key);

  @override
  _DriverOrderMapComponentState createState() =>
      _DriverOrderMapComponentState();
}

class _DriverOrderMapComponentState extends State<DriverOrderMapComponent> {
  @override
  void initState() {
    // widget.order.listen((Order? order) {
    //   if (order != null) {
    //     switch (order.orderType) {
    //       case OrderType.Laundry:
    //         handleLaundryOrder(order as LaundryOrder);
    //         break;
    //       case OrderType.Restaurant:
    //         handleRestaurantOrder(order as RestaurantOrder);
    //         break;
    //       default:
    //         return;
    //     }
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      // we do not need OBX here, since we're passing the Whole RxObject.
      child: MGoogleMap(
        mGoogleMapController: widget.mapController,
        rerenderDuration: Duration(seconds: 30),
      ),
    );
  }
}
