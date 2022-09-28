import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:mezcalmos/CustomerApp/models/OnlineTaxiDriver.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/helpers/OnlineDriversHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

class NearByOnlineTaxiDrivers extends StatefulWidget {
  final Rxn<Location> centerLocation;
  const NearByOnlineTaxiDrivers({
    required this.centerLocation,
    Key? key,
  }) : super(key: key);

  @override
  State<NearByOnlineTaxiDrivers> createState() =>
      _NearByOnlineTaxiDriversState();
}

class _NearByOnlineTaxiDriversState extends State<NearByOnlineTaxiDrivers> {
  late StreamSubscription<List<OnlineTaxiDriver>>? _onlineDriversListener;
  RxInt onlineDriversNumber = 0.obs;

  @override
  void initState() {
    // one time execution without waiting 10s:
    fetchOnlineTaxiDriversOnce(centerLocation: widget.centerLocation).then(
      (List<OnlineTaxiDriver> onlineDrivers) =>
          onlineDriversNumber.value = onlineDrivers.length,
    );
    // every 10s
    _onlineDriversListener = onlineTaxiDriversListener(
      centerLocation: widget.centerLocation,
    ).listen((List<OnlineTaxiDriver> onlineDrivers) {
      onlineDriversNumber.value = onlineDrivers.length;
      // setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _onlineDriversListener?.cancel();
    _onlineDriversListener = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: Offset(2.47, 2.47),
            blurRadius: 8.23,
            color: Color.fromRGBO(175, 175, 175, 0.25),
          )
        ],
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(33, 145, 37, 1),
            ),
          ),
          Obx(
            () => Text(
              onlineDriversNumber.value.toString(),
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          Icon(
            Icons.local_taxi,
            size: 21,
          )
        ],
      ),
    );
  }
}
