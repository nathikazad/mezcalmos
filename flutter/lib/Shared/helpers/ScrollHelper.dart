import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

extension BottomReachExtension on ScrollController {
  void onBottomReach(
    VoidCallback callback, {
    double sensitivity = 300.0,
  }) {
    addListener(() {
      final bool isReverse =
          position.userScrollDirection == ScrollDirection.reverse;

      final bool reachedSensitivePixels = position.extentAfter < sensitivity;
      if (isReverse && reachedSensitivePixels) {
        callback();
      }
    });
  }
}
