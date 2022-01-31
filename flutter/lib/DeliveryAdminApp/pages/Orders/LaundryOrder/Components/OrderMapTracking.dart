import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/components/LocationPicker.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

class OrderMapTracking extends StatefulWidget {
  final LaundryOrder order;
  const OrderMapTracking({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderMapTracking> createState() => _OrderMapTrackingState();
}

class _OrderMapTrackingState extends State<OrderMapTracking> {
  final LocationPickerController locationPickerController =
      LocationPickerController();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          height: 300,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(widget.order.to.position.latitude!,
                    widget.order.to.position.longitude!)),
          )),
    );
  }
}
