import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart'
    show mezDbgPrint;

class NoScrollGlowBehaviour extends ScrollBehavior {
  String? testCaller = null;

  NoScrollGlowBehaviour({this.testCaller});

  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    testCaller ??
        mezDbgPrint(
            "[!] Don't use ::NoScrollGlowBehaviour:: Directly , Use MezcalmosNoGlowScrollConfiguration(Widget); !");
    return child;
  }
}

Widget MezcalmosNoGlowScrollConfiguration(Widget child) {
  return ScrollConfiguration(
    behavior:
        NoScrollGlowBehaviour(testCaller: "MezcalmosNoGlowScrollConfiguration"),
    child: child,
  );
}
