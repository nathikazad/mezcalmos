import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';

Widget getMezcalmosLogo(double size) {
  return MezcalmosSharedWidgets.logo(size: size);
}

Widget getMezcalmosText(double size) {
  return MezcalmosSharedWidgets.mezcalmosTitle(textSize: size, isBold: false);
}
