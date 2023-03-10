import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/PickDriverView/controllers/PickDriverViewController.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';

class ROpDriversMapComponent extends StatefulWidget {
  const ROpDriversMapComponent({Key? key, required this.viewController})
      : super(key: key);
  final PickDriverViewController viewController;

  @override
  _ROpDriversMapComponentState createState() => _ROpDriversMapComponentState();
}

class _ROpDriversMapComponentState extends State<ROpDriversMapComponent> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 300,
        child: MGoogleMap(
          mGoogleMapController: widget.viewController.mapController,
          padding: const EdgeInsets.all(5),
        ),
      ),
    );
  }
}
