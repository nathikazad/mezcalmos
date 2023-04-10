import 'package:flutter/material.dart';

extension ContextHelper on BuildContext {
  TextTheme get txt => Theme.of(this).textTheme;

  void showSlowInternet() {}
  void hideSlowInternet() {}
}
