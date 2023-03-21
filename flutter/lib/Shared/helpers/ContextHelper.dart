import 'package:flutter/material.dart';

extension ContextHelper on BuildContext {
  TextTheme get txt => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);

  void showSlowInternet() {}
  void hideSlowInternet() {}
}
