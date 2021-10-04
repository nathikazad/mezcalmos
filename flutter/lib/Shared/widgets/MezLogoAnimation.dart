import 'package:flutter/material.dart';
import 'package:rive/rive.dart' show RiveAnimation;

class MezLogoAnimation extends StatelessWidget {
  final double? h;
  final double? w;
  MezLogoAnimation({this.h, this.w});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      width: w,
      child: RiveAnimation.asset(
        "assets/animation/LoadingAnimationV6.riv",
        fit: BoxFit.fill,
      ),
    );
  }
}
