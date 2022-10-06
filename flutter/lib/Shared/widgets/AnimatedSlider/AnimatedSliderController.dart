import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AnimatedSliderController {
  late double _maxSliderHeight;
  late double _minSliderHeight;

  // NOTE : using setters and getters here just to get ride of that .value to make it transparent to class user.

  // Slider Height getters and setters
  late RxDouble _sliderHeight;
  double get sliderHeight => _sliderHeight.value;
  set sliderHeight(double height) => _sliderHeight.value = height;
  // Slider Width getters and setters
  late RxDouble _sliderWidth;
  double get sliderWidth => _sliderWidth.value;
  set sliderWidth(double width) => _sliderWidth.value = width;

  /// CurveAnimation with getter and setter
  Rx<Curve> _curveAnimation = Curves.easeInExpo.obs;
  Curve get curveAnimation => _curveAnimation.value;
  set curveAnimation(Curve curve) => _curveAnimation.value = curve;

  /// AnimationDuration with getter and setter
  Rx<Duration> _animationDuration = Duration(seconds: 1).obs;
  Duration get animationDuration => _animationDuration.value;
  set animationDuration(Duration curve) => _animationDuration.value = curve;

  /// Slider Background color with getter and setter
  Rx<Color> _backgroundColor = Colors.white.obs;
  Color get backgroundColor => _backgroundColor.value;
  set backgroundColor(Color color) => _backgroundColor.value = color;

  AnimatedSliderController(
      {double? maxSliderHeight, double? minSliderHeight, double? sliderWidth}) {
    // setting max-min height
    _maxSliderHeight = maxSliderHeight ?? 40.0.h;
    _minSliderHeight = minSliderHeight ?? 0.0.h;
    // setting default height to _minSliderHeight
    _sliderHeight = RxDouble(_minSliderHeight);
    // setting the default slider Width of slider
    _sliderWidth = RxDouble(sliderWidth ?? Get.width);
  }

  // Public Functions
  void slideUp() {
    if (sliderHeight != _maxSliderHeight) {
      sliderHeight = _maxSliderHeight;
      refreshSliderState();
    }
  }

  void slideDown() {
    if (sliderHeight != _minSliderHeight) {
      sliderHeight = _minSliderHeight;
      refreshSliderState();
    }
  }

  void refreshSliderState() {
    _sliderHeight.refresh();
  }
}
