import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MGoogleMap(
      mGoogleMapController: widget.mapController,
    );
  }
}
