import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

class OrderMapWidget extends StatefulWidget {
  const OrderMapWidget(
      {super.key,
      required this.deliveryOrderId,
      required this.updateDriver,
      required this.polyline,
      required this.from,
      required this.to});
  final int deliveryOrderId;
  final bool updateDriver;
  final String? polyline;
  final MezLocation from;
  final MezLocation to;

  @override
  State<OrderMapWidget> createState() => _OrderMapWidgetState();
}

class _OrderMapWidgetState extends State<OrderMapWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
