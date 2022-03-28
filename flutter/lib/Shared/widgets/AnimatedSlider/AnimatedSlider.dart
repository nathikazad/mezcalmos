import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSliderController.dart';

class AnimatedSliderCoordinates {
  double? left;
  double? top;
  double? right;
  double? bottom;

  AnimatedSliderCoordinates({this.left, this.top, this.right, this.bottom});
}

class AnimatedSlider extends StatefulWidget {
  /// child of the container
  final Widget child;

  final AnimatedSliderController animatedSliderController;

  /// if This Slidder is a Wrapped within `Positioned` a.k.a Stack->Positioned->AnimatedSlider ,
  ///
  /// then use `AnimatedSliderCoordinates(left, top, right, bottom)` to fill this with Positioned LTRB
  final AnimatedSliderCoordinates? isPositionedCoordinates;

  const AnimatedSlider(
      {required this.animatedSliderController,
      required this.child,
      this.isPositionedCoordinates = null,
      Key? key})
      : super(key: key);

  @override
  State<AnimatedSlider> createState() => _AnimatedSliderState();
}

class _AnimatedSliderState extends State<AnimatedSlider> {
  @override
  Widget build(BuildContext context) {
    return _getRootWidget(
        child: AnimatedContainer(
            duration: Duration(seconds: 1),
            height: widget.animatedSliderController.sliderHeight,
            curve: widget
                .animatedSliderController.curveAnimation, // Curves.easeInExpo,
            width: widget.animatedSliderController.sliderWidth, // Get.width,
            decoration: BoxDecoration(
                color: widget
                    .animatedSliderController.backgroundColor, //Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38, blurRadius: 10, spreadRadius: 5)
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: widget.child));
  }

  /// This checks if the slider Wrapped Inside a Positioned inside a stack or not.
  Widget _getRootWidget({required Widget child}) {
    if (widget.isPositionedCoordinates != null) {
      return Positioned(
          left: widget.isPositionedCoordinates!.left,
          top: widget.isPositionedCoordinates!.top,
          right: widget.isPositionedCoordinates!.right,
          bottom: widget.isPositionedCoordinates!.bottom,
          child: child);
    } else {
      return SizedBox(
        child: child,
      );
    }
  }
}
