import 'package:flutter/material.dart';

class TaxiImage extends StatelessWidget {
  final double? sw;
  final double? sh;
  const TaxiImage({this.sw, this.sh, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sw,
      height: sh,
      child: Image.asset("assets/images/customer/taxi/taxi.png"),
    );
  }
}

/////////////////////////////
class FoodImage extends StatelessWidget {
  final double? sw;
  final double? sh;
  const FoodImage({this.sw, this.sh, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sw,
      height: sh,
      child: Image.asset("assets/images/deliveryAdmin/restaurant.png"),
    );
  }
}
