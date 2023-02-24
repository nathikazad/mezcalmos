import 'package:flutter/material.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

class LaundryAppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? autoBack;
  final AppBarLeftButtonType leftBtnType;
  bool showOrders;
  bool canGoBack;
  Function? onClick;
  LaundryAppAppBar(
      {Key? key,
      this.title,
      this.showOrders = true,
      this.autoBack = false,
      this.canGoBack = true,
      this.onClick,
      this.leftBtnType = AppBarLeftButtonType.Back})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return MezcalmosAppBar(leftBtnType,
        title: title,
        showLeftBtn: canGoBack,
        onClick: () => onClick?.call(),
        showNotifications: true,
        ordersRoute: kPastOrdersListView);
  }
}
