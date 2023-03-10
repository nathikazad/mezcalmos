import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/RestaurantApp/router/restaurantRoutes.dart';
import 'package:mezcalmos/RestaurantApp/router/router.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

class ROpAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? autoBack;
  final AppBarLeftButtonType leftBtnType;
  PreferredSizeWidget? bottom;
  bool showOrders;
  bool canGoBack;
  Function? onClick;

  ROpAppBar(
      {Key? key,
      this.title,
      this.showOrders = true,
      this.autoBack = false,
      this.canGoBack = true,
      this.onClick,
      this.bottom,
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
        tabBar: bottom,
        onClick: () => onClick?.call(),
        showNotifications: true,
        ordersRoute: (showOrders) ? RestaurantRouter.pastOrdersRoute : null);
  }
}
