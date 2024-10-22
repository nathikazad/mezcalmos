import 'package:flutter/material.dart';
import 'package:rive/rive.dart' show RiveAnimation;

class MezLogoAnimation extends StatelessWidget {
  final double? h;
  final double? w;
  final bool centered;

  const MezLogoAnimation({
    this.h,
    this.w,
    this.centered = false,
  });

  @override
  Widget build(BuildContext context) {
    final Widget animationContainer = Container(
      height: h,
      width: w,
      child: RiveAnimation.asset(
        "assets/animation/LoadingAnimationV6.riv",
        fit: BoxFit.fill,
      ),
    );
    if (centered) {
      return Center(
        child: Container(
          height: 200,
          width: 200,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Transform.scale(scale: .8, child: animationContainer),
        ),
      );
    } else {
      return animationContainer;
    }
  }
}
