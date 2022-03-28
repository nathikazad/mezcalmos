import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

AppBar deliveryAppBar(AppBarLeftButtonType leftBtnType, {Function? function}) {
  return mezcalmosAppBar(leftBtnType, onClick: function);
}
