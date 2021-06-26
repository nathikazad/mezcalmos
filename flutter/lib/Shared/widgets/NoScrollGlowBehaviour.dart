import 'package:flutter/material.dart';

class NoScrollGlowBehaviour extends ScrollBehavior {
  String? testCaller =  null;

  NoScrollGlowBehaviour({this.testCaller});

  @override
  Widget buildViewportChrome(
    BuildContext context, Widget child, AxisDirection axisDirection) 
    {
      testCaller ?? print("[!] Don't use ::NoScrollGlowBehaviour:: Directly , Use MezcalmosNoGlowScrollConfiguration(Widget); !");
      return child;
    }
}