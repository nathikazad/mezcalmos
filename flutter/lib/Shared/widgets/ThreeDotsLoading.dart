import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class ThreeDotsLoading extends StatelessWidget {
  final double height;
  final double width;
  final Color dotsColor;

  ThreeDotsLoading(
      {this.height = 5,
      this.width = 5,
      this.dotsColor = Colors.white,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CollectionScaleTransition(
      children: <Widget>[
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: dotsColor),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: dotsColor),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: dotsColor),
        ),
      ],
    );
  }
}
